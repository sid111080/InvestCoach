import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'app_exception.dart';

/// Тело ответа backend в формате `ErrorResponse`.
final class AppApiError {
  const AppApiError({
    required this.code,
    required this.error,
    this.message,
    this.details,
  });

  /// HTTP-статус.
  final int code;

  /// Код ошибки, например `RATE_LIMIT_EXCEEDED`.
  final String error;

  /// Сообщение от backend (может отсутствовать).
  final String? message;

  /// Дополнительные детали (`limit`, `suggest_upgrade`, …).
  final Map<String, Object?>? details;

  /// `null`, если тело не соответствует формату `ErrorResponse`.
  static AppApiError? tryParse(Object? data) {
    if (data is! Map) return null;
    final code = data['code'];
    final error = data['error'];
    if (code is! int || error is! String) return null;
    final details = data['details'];
    return AppApiError(
      code: code,
      error: error,
      message: data['message'] is String ? data['message'] as String : null,
      details: details is Map ? details.cast<String, Object?>() : null,
    );
  }
}

/// Централизованный маппер ошибок backend → [AppException].
///
/// Стратегия обработки (Error Specification):
/// - `RATE_LIMIT_EXCEEDED` (429) → мягкий paywall News+
/// - `LLM_TIMEOUT`/`LLM_UNAVAILABLE` → «Coach задумался» + «Повторить»
/// - `TOKEN_EXPIRED` (498) → silent refresh
/// - сетевой сбой → «Вы оффлайн…»
@Injectable()
final class AppErrorMapper {
  const AppErrorMapper();

  /// Маппит [DioException] с учётом тела ответа и статуса.
  AppException mapDioException(DioException exception) {
    if (_isConnectivityFailure(exception)) {
      return const NoInternetException();
    }
    final apiError = AppApiError.tryParse(exception.response?.data);
    final statusCode = exception.response?.statusCode ?? 0;
    final message = apiError?.message;
    final details = apiError?.details;
    final code = apiError?.error;
    if (code == null) {
      return UnknownException(
        httpStatus: statusCode > 0 ? statusCode : null,
      );
    }
    return switch (code) {
      'RATE_LIMIT_EXCEEDED' ||
      'DAILY_LIMIT_REACHED' ||
      'VOICE_LIMIT_REACHED' =>
        RateLimitExceededException(userMessage: message, details: details),
      'SUBSCRIPTION_REQUIRED' =>
        SubscriptionRequiredException(userMessage: message, details: details),
      'UNAUTHORIZED' => UnauthorizedException(userMessage: message),
      'FORBIDDEN' => ForbiddenException(userMessage: message),
      'TOKEN_EXPIRED' => const TokenExpiredException(),
      'LLM_TIMEOUT' => LlmTimeoutException(userMessage: message),
      'LLM_UNAVAILABLE' => LlmUnavailableException(userMessage: message),
      'VALIDATION_ERROR' ||
      'INVALID_TICKER' ||
      'INVALID_OPERATION' ||
      'AUDIO_TOO_LARGE' =>
        ValidationException(userMessage: message),
      'INSUFFICIENT_FUNDS' =>
        InsufficientFundsException(userMessage: message),
      _ when statusCode == 404 => NotFoundException(userMessage: message),
      _ when statusCode == 429 =>
        RateLimitExceededException(userMessage: message, details: details),
      _ => UnknownException(
          userMessage: message,
          httpStatus: statusCode > 0 ? statusCode : null,
        ),
    };
  }

  /// Превращает любой обработанный сбой в [AppException].
  AppException map(Object error) {
    if (error is DioException) return mapDioException(error);
    if (error is AppException) return error;
    return const UnknownException();
  }

  bool _isConnectivityFailure(DioException exception) =>
      switch (exception.type) {
        DioExceptionType.connectionError => true,
        DioExceptionType.connectionTimeout => true,
        DioExceptionType.receiveTimeout => true,
        _ => false,
      };
}
