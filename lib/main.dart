import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/di/injection_container.dart';
import 'core/providers/app_providers.dart';
import 'core/theme/theme_provider.dart';
import 'domain/services/notification_service.dart';
import 'domain/services/subscription_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Спринт 1: mock-режим по умолчанию — приложение работает
  // без backend и внешних сервисов.
  //
  // Реальные сервисы (Firebase/PostHog/Sentry/RevenueCat/FCM):
  //   flutter run --dart-define=USE_REAL_SERVICES=true
  // Для продакшен-API:
  //   flutter run --dart-define=ENV=prod
  final config = AppConfig.fromEnv();
  await initAppDependencies(config);

  // Инициализация сервисов Спринта 3 (RevenueCat + FCM).
  // В mock-режиме это no-op; в реальном — регистрация токена,
  // запрос разрешения push, загрузка entitlement.
  if (config.useRealServices) {
    await getIt<SubscriptionService>().initialize();
    await getIt<NotificationService>().initialize();
  }

  // Инициализация SharedPreferences (нужно для темы и онбординга).
  await SharedPreferences.getInstance();

  // Загружаем сохранённую тему ДО первого фрейма,
  // чтобы пользователь не видел мигание дефолтной палитры.
  final container = ProviderContainer(
    overrides: [appConfigProvider.overrideWithValue(config)],
  );
  await container.read(themeModeProvider.notifier).loadSaved();
  await container.read(themePaletteProvider.notifier).loadSaved();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const InvestCoachApp(),
    ),
  );
}
