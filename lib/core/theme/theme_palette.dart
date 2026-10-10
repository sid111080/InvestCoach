import 'dart:ui';

/// Идентификатор темы интерфейса.
enum ThemeId { spring, summer, autumn, winter, rose }

/// Режим отображения: тёмная / светлая.
enum AppThemeMode { dark, light }

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

// ─── Светлые варианты ────────────────────────────────────────────────────────

/// 🌿 Весна (светлая) — мягкий зелёный акцент на светлом фоне.
const ThemePalette springLightPalette = ThemePalette(
  id: ThemeId.spring,
  name: 'Весна',
  background: Color(0xFFF5F8F3),
  surface: Color(0xFFEDF2EB),
  surfaceElevated: Color(0xFFE2EAE0),
  primary: Color(0xFF4A6B3A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFDCE8CE),
  onPrimaryContainer: Color(0xFF2A4A1A),
  textPrimary: Color(0xFF1A2A1E),
  textSecondary: Color(0xFF5A7A6A),
  success: Color(0xFF3D8A56),
  warning: Color(0xFFB8860B),
  error: Color(0xFFC0392B),
  errorContainer: Color(0xFFF5E0E0),
  onError: Color(0xFF7F1D1D),
  outline: Color(0xFFC8D8C8),
  shadow: Color(0x1A000000),
  overlay: Color(0xB3F5F8F3),
);

/// ☀️ Лето (светлая) — горчичный акцент на тёплом светлом фоне.
const ThemePalette summerLightPalette = ThemePalette(
  id: ThemeId.summer,
  name: 'Лето',
  background: Color(0xFFF8F6F0),
  surface: Color(0xFFF0EDE3),
  surfaceElevated: Color(0xFFE8E4D8),
  primary: Color(0xFF8A7A2A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFF5F0C8),
  onPrimaryContainer: Color(0xFF4A3A0A),
  textPrimary: Color(0xFF2A2618),
  textSecondary: Color(0xFF7A7050),
  success: Color(0xFF3D8A56),
  warning: Color(0xFFB8860B),
  error: Color(0xFFC0392B),
  errorContainer: Color(0xFFF5E0E0),
  onError: Color(0xFF7F1D1D),
  outline: Color(0xFFD8D0B8),
  shadow: Color(0x1A000000),
  overlay: Color(0xB3F8F6F0),
);

/// 🍂 Осень (светлая) — глиняный акцент на тёплом светлом фоне.
const ThemePalette autumnLightPalette = ThemePalette(
  id: ThemeId.autumn,
  name: 'Осень',
  background: Color(0xFFF8F4F0),
  surface: Color(0xFFF0EAE3),
  surfaceElevated: Color(0xFFE8DED5),
  primary: Color(0xFF8A4A2A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFF5E0D0),
  onPrimaryContainer: Color(0xFF4A2A1A),
  textPrimary: Color(0xFF2A1A10),
  textSecondary: Color(0xFF7A6050),
  success: Color(0xFF3D8A56),
  warning: Color(0xFFB8860B),
  error: Color(0xFFC0392B),
  errorContainer: Color(0xFFF5E0E0),
  onError: Color(0xFF7F1D1D),
  outline: Color(0xFFD8C8B8),
  shadow: Color(0x1A000000),
  overlay: Color(0xB3F8F4F0),
);

/// ❄️ Зима (светлая) — стальной акцент на холодном светлом фоне.
const ThemePalette winterLightPalette = ThemePalette(
  id: ThemeId.winter,
  name: 'Зима',
  background: Color(0xFFF3F6F8),
  surface: Color(0xFFE8EEF2),
  surfaceElevated: Color(0xFFDDE5EA),
  primary: Color(0xFF2A6A9A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD8E8F5),
  onPrimaryContainer: Color(0xFF1A3A5A),
  textPrimary: Color(0xFF1A2A38),
  textSecondary: Color(0xFF5A7A8A),
  success: Color(0xFF3D8A56),
  warning: Color(0xFFB8860B),
  error: Color(0xFFC0392B),
  errorContainer: Color(0xFFF5E0E0),
  onError: Color(0xFF7F1D1D),
  outline: Color(0xFFB8C8D8),
  shadow: Color(0x1A000000),
  overlay: Color(0xB3F3F6F8),
);

/// 🌹 Розовая (светлая) — пыльно-розовый акцент на светлом фоне.
const ThemePalette roseLightPalette = ThemePalette(
  id: ThemeId.rose,
  name: 'Розовая',
  background: Color(0xFFF8F3F5),
  surface: Color(0xFFF0E8EC),
  surfaceElevated: Color(0xFFE8DDE3),
  primary: Color(0xFF8A3A6A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFF5D8E8),
  onPrimaryContainer: Color(0xFF4A1A3A),
  textPrimary: Color(0xFF2A1A24),
  textSecondary: Color(0xFF7A5A6A),
  success: Color(0xFF3D8A56),
  warning: Color(0xFFB8860B),
  error: Color(0xFFC0392B),
  errorContainer: Color(0xFFF5E0E0),
  onError: Color(0xFF7F1D1D),
  outline: Color(0xFFD8C0D0),
  shadow: Color(0x1A000000),
  overlay: Color(0xB3F8F3F5),
);

// ─── Реестр ─────────────────────────────────────────────────────────────────

/// Все тёмные палитры (для выбора в UI).
const List<ThemePalette> allPalettes = [
  springPalette,
  summerPalette,
  autumnPalette,
  winterPalette,
  rosePalette,
];

/// Светлые варианты, индексы соответствуют [allPalettes].
const List<ThemePalette> allLightPalettes = [
  springLightPalette,
  summerLightPalette,
  autumnLightPalette,
  winterLightPalette,
  roseLightPalette,
];

/// Получить палитру по [ThemeId] и [AppThemeMode].
ThemePalette paletteFor(ThemeId id, [AppThemeMode mode = AppThemeMode.dark]) {
  final index = id.index;
  if (mode == AppThemeMode.light) {
    return allLightPalettes[index];
  }
  return allPalettes.firstWhere(
    (p) => p.id == id,
    orElse: () => springPalette,
  );
}
