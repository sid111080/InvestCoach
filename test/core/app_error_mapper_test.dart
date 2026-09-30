import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/core/errors/app_error_mapper.dart';
import 'package:investcoach/core/errors/app_exception.dart';

void main() {
  const mapper = AppErrorMapper();

  Map<String, dynamic> errorBody(
    int code,
    String error, {
    String? message,
    Map<String, Object?>? details,
  }) {
    final body = <String, dynamic>{
      'success': false,
      'error': error,
      'code': code,
    };
    if (message != null) body['message'] = message;
    if (details != null) body['details'] = details;
    return body;
  }

  DioException dioException({
    required int statusCode,
    required String error,
    String? message,
    Object? data,
    DioExceptionType type = DioExceptionType.badResponse,
  }) {
    // Если тело не передано явно, собираем его из кода ошибки —
    // как это делает реальный backend (ErrorResponse).
    final body =
        data ?? (error.isEmpty ? null : errorBody(statusCode, error, message: message));
    return DioException(
      requestOptions: RequestOptions(path: '/test'),
      response: body == null
          ? null
          : Response(
              statusCode: statusCode,
              data: body,
              requestOptions: RequestOptions(path: '/test'),
            ),
      type: type,
    );
  }

  group('mapDioException', () {
    test('429 RATE_LIMIT_EXCEEDED → RateLimitExceededException', () {
      final result = mapper.mapDioException(
        dioException(
          statusCode: 429,
          error: 'RATE_LIMIT_EXCEEDED',
          data: errorBody(429, 'RATE_LIMIT_EXCEEDED', message: '8 из 8'),
        ),
      );

      expect(result, isA<RateLimitExceededException>());
      expect(result.userMessage, '8 из 8');
    });

    test('504 LLM_TIMEOUT → LlmTimeoutException с дефолтным сообщением', () {
      final result = mapper.mapDioException(
        dioException(statusCode: 504, error: 'LLM_TIMEOUT'),
      );

      expect(result, isA<LlmTimeoutException>());
      expect(result.userMessage, contains('Попробуйте через минуту'));
    });

    test('498 TOKEN_EXPIRED → TokenExpiredException', () {
      final result = mapper.mapDioException(
        dioException(statusCode: 498, error: 'TOKEN_EXPIRED'),
      );

      expect(result, isA<TokenExpiredException>());
    });

    test('403 SUBSCRIPTION_REQUIRED → SubscriptionRequiredException', () {
      final result = mapper.mapDioException(
        dioException(statusCode: 403, error: 'SUBSCRIPTION_REQUIRED'),
      );

      expect(result, isA<SubscriptionRequiredException>());
    });

    test('сетевой сбой → NoInternetException', () {
      final result = mapper.mapDioException(
        dioException(
          statusCode: 0,
          error: '',
          type: DioExceptionType.connectionError,
        ),
      );

      expect(result, isA<NoInternetException>());
      expect(result.userMessage, contains('оффлайн'));
    });

    test('неизвестный код → UnknownException', () {
      final result = mapper.mapDioException(
        dioException(statusCode: 500, error: 'SOMETHING_NEW'),
      );

      expect(result, isA<UnknownException>());
    });

    test('отсутствие тела → UnknownException', () {
      final result = mapper.mapDioException(
        dioException(statusCode: 500, error: ''),
      );

      expect(result, isA<UnknownException>());
    });
  });

  group('AppApiError.tryParse', () {
    test('валидное тело парсится', () {
      final parsed = AppApiError.tryParse(
        errorBody(429, 'RATE_LIMIT_EXCEEDED', message: 'x'),
      );

      expect(parsed, isNotNull);
      expect(parsed!.code, 429);
      expect(parsed.error, 'RATE_LIMIT_EXCEEDED');
      expect(parsed.message, 'x');
    });

    test('не-Map → null', () {
      expect(AppApiError.tryParse('plain text'), isNull);
      expect(AppApiError.tryParse(null), isNull);
    });

    test('нет кода/имени ошибки → null', () {
      expect(AppApiError.tryParse({'foo': 1}), isNull);
      expect(AppApiError.tryParse({'code': 'not-int'}), isNull);
    });
  });
}
