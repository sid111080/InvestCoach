import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../analytics/analytics_service.dart';
import '../config/app_config.dart';
import '../crash_reporting/crash_reporting_service.dart';
import '../errors/app_error_mapper.dart';
import '../errors/app_exception.dart';
import '../auth/auth_token_provider.dart';

/// HTTP-клиент InvestCoach (Dio).
///
/// - Firebase ID Token подставляется интерцептором для каждого запроса.
/// - Все ошибки централизованно логируются в Sentry + PostHog.
/// - Тестировать UI и репозитории удобно через [toAppException]:
///   она превращает любой сбой в типизированный [AppException].
@Injectable()
final class ApiClient {
  ApiClient({
    required AppConfig config,
    required AuthTokenProvider tokenProvider,
    required this._errorMapper,
    required AnalyticsService analytics,
    required CrashReportingService crashReporting,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: config.apiBaseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 30),
            headers: const {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          ),
        ) {
    _dio.interceptors.add(_AuthInterceptor(tokenProvider));
    _dio.interceptors.add(_CentralErrorInterceptor(
      analytics: analytics,
      crashReporting: crashReporting,
    ));
  }

  final Dio _dio;
  final AppErrorMapper _errorMapper;

  /// Доступ к Dio для специфичных запросов (SSE, upload, WS-фолбэк).
  Dio get dio => _dio;

  /// Преобразует обработанный сбой в типизированное [AppException].
  /// (Логирование уже выполнено в [_CentralErrorInterceptor].)
  AppException toAppException(Object error) =>
      _errorMapper.map(error is DioException ? error : error);
}

/// Подставляет Firebase ID Token в заголовок `Authorization`.
final class _AuthInterceptor extends Interceptor {
  _AuthInterceptor(this._tokenProvider);

  final AuthTokenProvider _tokenProvider;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenProvider.token();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

/// Централизованный обработчик ошибок: Sentry + PostHog.
final class _CentralErrorInterceptor extends Interceptor {
  _CentralErrorInterceptor({
    required this._analytics,
    required this._crashReporting,
  });

  final AnalyticsService _analytics;
  final CrashReportingService _crashReporting;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final apiError = AppApiError.tryParse(err.response?.data);
    _crashReporting.capture(
      err,
      StackTrace.current,
      extras: {
        'url': err.requestOptions.uri.toString(),
        'http_status': err.response?.statusCode,
        'error_code': apiError?.error,
      },
    );
    _analytics.track(
      'error_occurred',
      {
        'error': apiError?.error ?? err.type.name,
        'http_status': err.response?.statusCode,
        'url': err.requestOptions.path,
      },
    );
    handler.next(err);
  }
}
