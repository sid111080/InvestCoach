import 'dart:ui';

/// Токены цвета дизайн-системы InvestCoach (Calm Tech + Financial Trust).
///
/// Источник: `InvestCoach.md`, раздел 4 «Дизайн-система».
abstract final class AppColors {
  AppColors._();

  /// Фон приложения (тёмно-синий).
  static const Color background = Color(0xFF0F172A);

  /// Поверхность карточек.
  static const Color surface = Color(0xFF1E2937);

  /// Поверхность второго уровня (элементы, лежащие поверх [surface]).
  static const Color surfaceElevated = Color(0xFF2A3A50);

  /// Акцентный цвет (Emerald Green).
  static const Color primary = Color(0xFF22C55E);

  /// Контрастный цвет на [primary].
  static const Color onPrimary = Color(0xFF052E16);

  static const Color primaryContainer = Color(0xFF166534);

  static const Color onPrimaryContainer = Color(0xFF86EFAC);

  /// Основной текст.
  static const Color textPrimary = Color(0xFFF1F5F9);

  /// Вторичный текст.
  static const Color textSecondary = Color(0xFF94A3B8);

  static const Color success = Color(0xFF22C55E);

  static const Color warning = Color(0xFFF59E0B);

  static const Color error = Color(0xFFF87171);

  static const Color errorContainer = Color(0xFF7F1D1D);

  static const Color onError = Color(0xFFFEF2F2);

  /// Тонкая граница карточек.
  static const Color outline = Color(0xFF2E3F55);

  /// Мягкая тень карточек.
  static const Color shadow = Color(0x59000000);

  /// Затемнение для fullscreen-оверлеев (голосовой режим).
  static const Color overlay = Color(0xB30F172A);
}
