/// Отчётность об ошибках (Sentry + Firebase Crashlytics).
///
/// Реальные реализации появятся в Спринте 2. Пока — no-op,
/// чтобы централизованный обработчик ошибок уже работал.
abstract interface class CrashReportingService {
  /// Записать ошибку в сервис мониторинга.
  void capture(
    Object error,
    StackTrace stackTrace, {
    Map<String, Object?>? extras,
  });
}

/// Заглушка для mock-режима.
final class NoOpCrashReportingService implements CrashReportingService {
  const NoOpCrashReportingService();

  @override
  void capture(
    Object error,
    StackTrace stackTrace, {
    Map<String, Object?>? extras,
  }) {
    // Осознанно пусто: в mock-режиме ошибки не отправляются.
  }
}
