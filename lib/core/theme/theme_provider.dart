import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_palette.dart';

/// Riverpod-провайдер текущей темы.
final themePaletteProvider =
    NotifierProvider<ThemePaletteNotifier, ThemePalette>(
  ThemePaletteNotifier.new,
);

final class ThemePaletteNotifier extends Notifier<ThemePalette> {
  @override
  ThemePalette build() {
    // TODO: читать из SharedPreferences при старте
    return springPalette;
  }

  void setTheme(ThemeId id) {
    state = paletteFor(id);
    // TODO: сохранить в SharedPreferences
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
