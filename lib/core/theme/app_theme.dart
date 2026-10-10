import 'package:flutter/material.dart';

import 'app_dimensions.dart';
import 'app_text_styles.dart';
import 'theme_palette.dart';

/// Определяет яркость по фону палитры.
Brightness _brightness(ThemePalette p) =>
    allLightPalettes.contains(p) ? Brightness.light : Brightness.dark;

/// Строит [ThemeData] для данной палитры (dark или light).
ThemeData buildAppTheme(ThemePalette p) {
  final brightness = _brightness(p);

  final baseScheme = brightness == Brightness.dark
      ? ColorScheme.dark()
      : ColorScheme.light();

  final colorScheme = baseScheme.copyWith(
    primary: p.primary,
    onPrimary: p.onPrimary,
    primaryContainer: p.primaryContainer,
    onPrimaryContainer: p.onPrimaryContainer,
    secondary: p.textSecondary,
    onSecondary: p.background,
    secondaryContainer: p.surface,
    onSecondaryContainer: p.textPrimary,
    error: p.error,
    errorContainer: p.errorContainer,
    onError: p.onError,
    surface: p.surface,
    onSurface: p.textPrimary,
  );

  return ThemeData(
    brightness: brightness,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: p.background,
    // Цвет текста берётся из палитры — корректно и для dark, и для light.
    textTheme: TextTheme(
      displaySmall: AppTextStyles.display.copyWith(color: p.textPrimary),
      headlineSmall: AppTextStyles.titleLarge.copyWith(color: p.textPrimary),
      titleLarge: AppTextStyles.titleMedium.copyWith(color: p.textPrimary),
      titleMedium: AppTextStyles.titleSmall.copyWith(color: p.textPrimary),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: p.textPrimary),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: p.textPrimary),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: p.textSecondary),
      labelLarge: AppTextStyles.labelLarge.copyWith(color: p.textPrimary),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: p.textSecondary),
      labelSmall: AppTextStyles.labelSmall.copyWith(color: p.textSecondary),
    ),
    // Иконки по умолчанию — акцент темы.
    iconTheme: IconThemeData(
      color: p.primary,
      size: 22,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: p.background,
      foregroundColor: p.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: p.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        side: BorderSide(color: p.outline),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 64,
      backgroundColor: p.surface,
      elevation: 0,
      indicatorColor: p.primaryContainer,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          size: 24,
          color: states.contains(WidgetState.selected)
              ? p.primary
              : p.textSecondary,
        ),
      ),
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(
          fontFamily: AppFonts.body,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          height: 1.2,
          color: p.textSecondary,
        ),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: p.surface,
      selectedColor: p.primaryContainer,
      checkmarkColor: p.primary,
      side: BorderSide(color: p.outline),
      labelStyle: TextStyle(
        fontFamily: AppFonts.body,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: p.textPrimary,
      ),
    ),
  );
}
