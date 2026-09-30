import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/core/config/app_config.dart';

void main() {
  group('AppConfig.fromEnv', () {
    test('по умолчанию — dev-среда и mock-режим', () {
      final config = AppConfig.fromEnv();

      expect(config.environment, AppEnvironment.dev);
      expect(config.apiBaseUrl, 'https://dev-api.investcoach.ru/v1');
      expect(config.wsUrl, 'wss://dev-api.investcoach.ru/v1/ws/chat');
      expect(config.useRealServices, isFalse);
    });
  });

  group('AppEnvironment', () {
    test('prod использует production URL', () {
      const prod = AppEnvironment.prod;

      expect(prod.apiBaseUrl, 'https://api.investcoach.ru/v1');
      expect(prod.wsUrl, 'wss://api.investcoach.ru/v1/ws/chat');
    });
  });
}
