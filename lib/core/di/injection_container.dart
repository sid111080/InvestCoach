import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/services/fcm_notification_service.dart';
import '../../data/services/flutter_tts_synthesizer.dart';
import '../../data/services/mock_notification_service.dart';
import '../../data/services/mock_speech_services.dart';
import '../../data/services/mock_subscription_service.dart';
import '../../data/services/revenuecat_subscription_service.dart';
import '../../data/services/speech_transcriber_impl.dart';
import '../../domain/services/notification_service.dart';
import '../../domain/services/speech_synthesizer.dart';
import '../../domain/services/speech_transcriber.dart';
import '../../domain/services/subscription_service.dart';
import '../../shared/onboarding/onboarding_state_repository.dart';
import '../analytics/analytics_service.dart';
import '../auth/auth_token_provider.dart';
import '../config/app_config.dart';
import '../crash_reporting/crash_reporting_service.dart';
import '../errors/app_error_mapper.dart';
import '../network/api_client.dart';

/// Корень dependency injection приложения (get_it).
///
/// В задаче 2 появятся реальные реализации (PostHog, Sentry,
/// FirebaseAuth) — они подключатся в [_registerServices] по флагу
/// [AppConfig.useRealServices].
final GetIt getIt = GetIt.instance;

/// Регистрация всех сервисов. Идемпотентна: повторный вызов
/// заменяет прежние регистрации (нужно для widget-тестов,
/// где приложение «перезапускается» несколько раз в процессе).
void registerDependencies(AppConfig config) {
  _singleton(config);

  // Mock-режим (задача 1): локальные реализации без внешних сервисов.
  // Задача 2: при `config.useRealServices` — PostHog + Sentry + Firebase.
  _singleton<AnalyticsService>(
    config.useRealServices
        ? const _NoopAnalyticsService()
        : const DebugAnalyticsService(),
  );
  _singleton<CrashReportingService>(const NoOpCrashReportingService());
  _singleton<AuthTokenProvider>(const NoOpAuthTokenProvider());

  // Голос (Voice-First): реальные SDK или демо-mock.
  _singleton<SpeechTranscriber>(
    config.useRealServices ? SpeechTranscriberImpl() : MockSpeechTranscriber(),
  );
  _singleton<SpeechSynthesizer>(
    config.useRealServices
        ? FlutterTtsSynthesizer()
        : MockSpeechSynthesizer(),
  );

  // Подписка (RevenueCat) и push-уведомления (FCM).
  _singleton<SubscriptionService>(
    config.useRealServices
        ? RevenueCatSubscriptionService(
            apiKey: const String.fromEnvironment(
              'REVENUECAT_API_KEY',
              defaultValue: 'rc_placeholder',
            ),
          )
        : MockSubscriptionService(),
  );
  _singleton<NotificationService>(
    config.useRealServices
        ? FcmNotificationService()
        : MockNotificationService(),
  );

  // Ядро сети.
  _singleton<AppErrorMapper>(const AppErrorMapper());
  _singleton<ApiClient>(
    ApiClient(
      config: config,
      tokenProvider: getIt<AuthTokenProvider>(),
      errorMapper: getIt<AppErrorMapper>(),
      analytics: getIt<AnalyticsService>(),
      crashReporting: getIt<CrashReportingService>(),
    ),
  );
}

/// Инициализация DI — публичная точка входа (main, тесты).
Future<void> initAppDependencies(AppConfig config) async {
  registerDependencies(config);

  // Локальное состояние онбординга: SharedPreferences доступен
  // только после ensureInitialized + getInstance.
  final prefs = await SharedPreferences.getInstance();
  _singleton<OnboardingStateRepository>(SharedPreferencesOnboardingState(prefs));
}

/// [registerSingleton] с защитой от повторной регистрации.
void _singleton<T extends Object>(T instance) {
  if (getIt.isRegistered<T>()) {
    getIt.unregister<T>();
  }
  getIt.registerSingleton<T>(instance);
}

/// No-op аналитика, пока не подключён PostHog (задача 2).
final class _NoopAnalyticsService implements AnalyticsService {
  const _NoopAnalyticsService();

  @override
  void track(String name, [Map<String, Object?>? params]) {}

  @override
  void screen(String name) {}
}
