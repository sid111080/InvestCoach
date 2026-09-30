import 'package:flutter/foundation.dart';

/// Аналитика приложения.
///
/// Главный канал — PostHog (реализация появится в Спринте 2,
/// вместе с `flutterfire configure` и ключом PostHog).
abstract interface class AnalyticsService {
  /// Отправить событие со стандартными параметрами
  /// (`user_tier`, `session_id` добавляет реализация).
  void track(String name, [Map<String, Object?>? params]);

  /// Открытие экрана (обязательное событие `screen_viewed`).
  void screen(String name);
}

/// Локальная реализация для разработки без внешних сервисов.
final class DebugAnalyticsService implements AnalyticsService {
  const DebugAnalyticsService();

  @override
  void track(String name, [Map<String, Object?>? params]) {
    if (kDebugMode) {
      debugPrint('[analytics] $name $params');
    }
  }

  @override
  void screen(String name) {
    track('screen_viewed', {'screen_name': name});
  }
}
