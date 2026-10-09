import 'package:flutter/services.dart';

/// Централизованный haptic feedback для ключевых действий.
///
/// Интенсивность подобрана под «Calm Tech» — мягкая, не агрессивная:
/// - [light] — тап по карточке, чипу, вкладке
/// - [selection] — переключение тумблера, выбор опции
/// - [success] — успешное действие (отправка, покупка)
/// - [error] — ошибка, неудачное действие
abstract final class Haptics {
  Haptics._();

  /// Лёгкий тап: карточки, чипсы, вкладки, навигация.
  static void light() => HapticFeedback.lightImpact();

  /// Выбор: тумблер, радио-кнопка, выбор темы.
  static void selection() => HapticFeedback.selectionClick();

  /// Успех: отправка сообщения, покупка, завершение онбординга.
  static void success() => HapticFeedback.mediumImpact();

  /// Ошибка: failed-действие, превышение лимита.
  static void error() => HapticFeedback.heavyImpact();
}
