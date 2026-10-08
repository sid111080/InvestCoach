import 'dart:ui';

/// Нейтральный текстовый базис дизайн-системы InvestCoach.
///
/// Используется только [AppTextStyles] как «по умолчанию» цвет текста
/// (const-стили не могут обращаться к текущей теме). Нейтральные значения
/// читаемы на любом тонированном фоне всех тем.
///
/// Все тем-специфичные цвета (фон, surface, яркий акцент, контейнеры,
/// семантические) живут в [ThemePalette] — см. `theme_palette.dart`.
abstract final class AppColors {
  AppColors._();

  /// Основной текст — нейтральный почти-белый.
  static const Color textPrimary = Color(0xFFF1F5F9);

  /// Вторичный текст — нейтральный серый (токен дизайн-системы).
  static const Color textSecondary = Color(0xFF94A3B8);
}
