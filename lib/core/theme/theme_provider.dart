import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_palette.dart';

/// Riverpod-провайдер текущей темы.
final themePaletteProvider =
    NotifierProvider<ThemePaletteNotifier, ThemePalette>(
  ThemePaletteNotifier.new,
);

/// Текущий режим (dark/light) — отдельный провайдер для UI-тогла.
final themeModeProvider =
    NotifierProvider<ThemeModeNotifier, AppThemeMode>(
  ThemeModeNotifier.new,
);

final class ThemeModeNotifier extends Notifier<AppThemeMode> {
  static const _storageKey = 'theme_mode';

  @override
  AppThemeMode build() => AppThemeMode.dark;

  Future<void> loadSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_storageKey);
    if (saved == 'light') state = AppThemeMode.light;
  }

  void setMode(AppThemeMode mode) {
    state = mode;
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setString(_storageKey, mode.name));
    // Обновляем палитру с новым режимом.
    ref.read(themePaletteProvider.notifier).applyMode(mode);
  }
}

final class ThemePaletteNotifier extends Notifier<ThemePalette> {
  static const _storageKey = 'theme_id';
  ThemeId _currentId = ThemeId.spring;
  AppThemeMode _currentMode = AppThemeMode.dark;

  @override
  ThemePalette build() => springPalette;

  Future<void> loadSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString(_storageKey);
    if (savedName != null) {
      for (final p in allPalettes) {
        if (p.name == savedName) {
          _currentId = p.id;
          break;
        }
      }
    }
    // Применяем с учётом сохранённого режима.
    final mode = ref.read(themeModeProvider);
    _currentMode = mode;
    state = paletteFor(_currentId, mode);
  }

  void setTheme(ThemeId id) {
    _currentId = id;
    state = paletteFor(id, _currentMode);
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setString(_storageKey, state.name));
  }

  /// Вызывается из [ThemeModeNotifier] при смене режима.
  void applyMode(AppThemeMode mode) {
    _currentMode = mode;
    state = paletteFor(_currentId, mode);
  }
}

/// InheritedWidget: доступ к палитре из любого виджета через `context.palette`.
class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    super.key,
    required super.child,
    required this.palette,
  });

  final ThemePalette palette;

  static ThemePalette of(BuildContext context) {
    final widget = context.getInheritedWidgetOfExactType<ThemeProvider>();
    // В продакшене ThemeProvider всегда на корне (InvestCoachApp).
    // Фолбэк на дефолтную палитру нужен widget-тестам, которые помпают
    // экран без корневого ThemeProvider.
    return widget?.palette ?? springPalette;
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) =>
      palette.id != oldWidget.palette.id;
}

/// `context.palette.primary` — доступ к текущей палитре.
extension ThemePaletteX on BuildContext {
  ThemePalette get palette => ThemeProvider.of(this);
}
