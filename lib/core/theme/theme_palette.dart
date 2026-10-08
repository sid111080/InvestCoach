import 'dart:ui';

/// Идентификатор темы интерфейса.
enum ThemeId { spring, summer, autumn, winter, rose }

/// Палитра цветов для одной темы.
///
/// Принцип: фон — тёмный, слегка тонированный под тему; **мягкий,
/// приглушённый «землистый» акцент** ([primary]) идёт на иконки, кнопки,
/// пузыри чата и ключевые элементы — заметный, но не неоновый.
/// Семантические цвета (success/warning/error) не зависят от темы —
/// они несут смысл, а не «настроение».
final class ThemePalette {
  const ThemePalette({
    required this.id,
    required this.name,
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.textPrimary,
    required this.textSecondary,
    required this.success,
    required this.warning,
    required this.error,
    required this.errorContainer,
    required this.onError,
    required this.outline,
    required this.shadow,
    required this.overlay,
  });

  final ThemeId id;
  final String name;

  /// Фон приложения — тёмный, тонированный под тему.
  final Color background;
  final Color surface;
  final Color surfaceElevated;

  /// Мягкий акцент темы: иконки, микрофон, отправка, пузырь чата.
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;

  final Color textPrimary;
  final Color textSecondary;

  /// Семантические цвета — одинаковые во всех темах.
  final Color success;
  final Color warning;
  final Color error;
  final Color errorContainer;
  final Color onError;

  final Color outline;
  final Color shadow;
  final Color overlay;
}

/// 🌿 Весна — приглушённый болотный акцент на тёмно-зелёном фоне.
const ThemePalette springPalette = ThemePalette(
  id: ThemeId.spring,
  name: 'Весна',
  background: Color(0xFF0A1410),
  surface: Color(0xFF12201A),
  surfaceElevated: Color(0xFF1B2E25),
  primary: Color(0xFF6B8E5A),
  onPrimary: Color(0xFF16240E),
  primaryContainer: Color(0xFF4A6B3A),
  onPrimaryContainer: Color(0xFFDCE8CE),
  textPrimary: Color(0xFFF1F5F9),
  textSecondary: Color(0xFF8CA89B),
  success: Color(0xFF5FA876),
  warning: Color(0xFFC9A24A),
  error: Color(0xFFD47A7A),
  errorContainer: Color(0xFF7F1D1D),
  onError: Color(0xFFFEF2F2),
  outline: Color(0xFF1E3A2E),
  shadow: Color(0x59000000),
  overlay: Color(0xB30A1410),
);

/// ☀️ Лето — приглушённый горчичный акцент на тёмно-янтарном фоне.
const ThemePalette summerPalette = ThemePalette(
  id: ThemeId.summer,
  name: 'Лето',
  background: Color(0xFF141208),
  surface: Color(0xFF201D10),
  surfaceElevated: Color(0xFF2E2A18),
  primary: Color(0xFFC9B84A),
  onPrimary: Color(0xFF26220C),
  primaryContainer: Color(0xFF8A7A2A),
  onPrimaryContainer: Color(0xFFF5F0C8),
  textPrimary: Color(0xFFF1F5F9),
  textSecondary: Color(0xFFA8A07A),
  success: Color(0xFF5FA876),
  warning: Color(0xFFC9A24A),
  error: Color(0xFFD47A7A),
  errorContainer: Color(0xFF7F1D1D),
  onError: Color(0xFFFEF2F2),
  outline: Color(0xFF3A3520),
  shadow: Color(0x59000000),
  overlay: Color(0xB3141208),
);

/// 🍂 Осень — приглушённый глиняный акцент на тёмно-коричневом фоне.
const ThemePalette autumnPalette = ThemePalette(
  id: ThemeId.autumn,
  name: 'Осень',
  background: Color(0xFF140D08),
  surface: Color(0xFF201610),
  surfaceElevated: Color(0xFF2E2018),
  primary: Color(0xFFC97B4A),
  onPrimary: Color(0xFF26140A),
  primaryContainer: Color(0xFF8A4A2A),
  onPrimaryContainer: Color(0xFFF5E0D0),
  textPrimary: Color(0xFFF1F5F9),
  textSecondary: Color(0xFFA89080),
  success: Color(0xFF5FA876),
  warning: Color(0xFFC9A24A),
  error: Color(0xFFD47A7A),
  errorContainer: Color(0xFF7F1D1D),
  onError: Color(0xFFFEF2F2),
  outline: Color(0xFF3A2A20),
  shadow: Color(0x59000000),
  overlay: Color(0xB3140D08),
);

/// ❄️ Зима — приглушённый стальной акцент на тёмно-синем фоне.
const ThemePalette winterPalette = ThemePalette(
  id: ThemeId.winter,
  name: 'Зима',
  background: Color(0xFF081218),
  surface: Color(0xFF101E28),
  surfaceElevated: Color(0xFF182E3C),
  primary: Color(0xFF5C9BC4),
  onPrimary: Color(0xFF0A2030),
  primaryContainer: Color(0xFF3A6A8A),
  onPrimaryContainer: Color(0xFFD8E8F5),
  textPrimary: Color(0xFFF1F5F9),
  textSecondary: Color(0xFF7A9AAA),
  success: Color(0xFF5FA876),
  warning: Color(0xFFC9A24A),
  error: Color(0xFFD47A7A),
  errorContainer: Color(0xFF7F1D1D),
  onError: Color(0xFFFEF2F2),
  outline: Color(0xFF1E3A4A),
  shadow: Color(0x59000000),
  overlay: Color(0xB3081218),
);

/// 🌹 Розовая — приглушённый пыльно-розовый акцент на тёмно-пурпурном фоне.
const ThemePalette rosePalette = ThemePalette(
  id: ThemeId.rose,
  name: 'Розовая',
  background: Color(0xFF140810),
  surface: Color(0xFF20101A),
  surfaceElevated: Color(0xFF2E1824),
  primary: Color(0xFFC47BA0),
  onPrimary: Color(0xFF260A16),
  primaryContainer: Color(0xFF8A4A6A),
  onPrimaryContainer: Color(0xFFF5D8E8),
  textPrimary: Color(0xFFF1F5F9),
  textSecondary: Color(0xFFA88FA0),
  success: Color(0xFF5FA876),
  warning: Color(0xFFC9A24A),
  error: Color(0xFFD47A7A),
  errorContainer: Color(0xFF7F1D1D),
  onError: Color(0xFFFEF2F2),
  outline: Color(0xFF3A1E2E),
  shadow: Color(0x59000000),
  overlay: Color(0xB3140810),
);

/// Все доступные темы.
const List<ThemePalette> allPalettes = [
  springPalette,
  summerPalette,
  autumnPalette,
  winterPalette,
  rosePalette,
];

/// Получить палитру по [ThemeId].
ThemePalette paletteFor(ThemeId id) =>
    allPalettes.firstWhere((p) => p.id == id, orElse: () => springPalette);
