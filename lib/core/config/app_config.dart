import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';

/// Среда выполнения. Backend размещён на облачном сервере
/// (Python FastAPI, отдельная команда разработки).
enum AppEnvironment {
  /// Development.
  dev(
    apiBaseUrl: 'https://dev-api.investcoach.ru/v1',
    wsUrl: 'wss://dev-api.investcoach.ru/v1/ws/chat',
  ),

  /// Production.
  prod(
    apiBaseUrl: 'https://api.investcoach.ru/v1',
    wsUrl: 'wss://api.investcoach.ru/v1/ws/chat',
  );

  const AppEnvironment({
    required this.apiBaseUrl,
    required this.wsUrl,
  });

  /// Base URL REST API.
  final String apiBaseUrl;

  /// URL WebSocket для real-time чата (токен — в query-параметре).
  final String wsUrl;
}

/// Конфигурация приложения.
///
/// Читаются из `--dart-define`:
/// - `ENV=dev|prod` (по умолчанию `dev`)
/// - `USE_REAL_SERVICES=true` — включать Firebase/PostHog/Sentry
///   (по умолчанию `false` — mock-режим, приложение работает без backend)
@freezed
sealed class AppConfig with _$AppConfig {
  const factory AppConfig({
    required AppEnvironment environment,
    required bool useRealServices,
  }) = _AppConfig;

  const AppConfig._();

  /// Сформировать конфигурацию из переменных среды сборки.
  factory AppConfig.fromEnv() {
    final environment = switch (
      const String.fromEnvironment('ENV', defaultValue: 'dev')
    ) {
      'prod' => AppEnvironment.prod,
      _ => AppEnvironment.dev,
    };
    return AppConfig(
      environment: environment,
      useRealServices: const bool.fromEnvironment('USE_REAL_SERVICES'),
    );
  }

  String get apiBaseUrl => environment.apiBaseUrl;

  String get wsUrl => environment.wsUrl;
}
