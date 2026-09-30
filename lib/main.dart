import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/di/injection_container.dart';
import 'core/providers/app_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Спринт 1: mock-режим по умолчанию — приложение работает
  // без backend и внешних сервисов.
  //
  // Реальные сервисы (Firebase/PostHog/Sentry):
  //   flutter run --dart-define=USE_REAL_SERVICES=true
  // Для продакшен-API:
  //   flutter run --dart-define=ENV=prod
  final config = AppConfig.fromEnv();
  await initAppDependencies(config);

  runApp(
    ProviderScope(
      overrides: [
        // Фиксируем конфигурацию, чтобы DI и Riverpod видели одно.
        appConfigProvider.overrideWithValue(config),
      ],
      child: const InvestCoachApp(),
    ),
  );
}
