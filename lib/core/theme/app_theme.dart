import 'package:flutter/material.dart';

import 'app_dimensions.dart';
import 'app_text_styles.dart';
import 'theme_palette.dart';

/// Тёмная тема InvestCoach (MVP — только dark).
ThemeData buildAppTheme(ThemePalette p) {
  final colorScheme = ColorScheme.dark().copyWith(
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
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: p.background,
    textTheme: const TextTheme(
      displaySmall: AppTextStyles.display,
      headlineSmall: AppTextStyles.titleLarge,
      titleLarge: AppTextStyles.titleMedium,
      titleMedium: AppTextStyles.titleSmall,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium,
      labelSmall: AppTextStyles.labelSmall,
    ),
    // Иконки по умолчанию — яркий акцент темы (яркие иконки везде).
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
      labelTextStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontFamily: AppFonts.body,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          height: 1.2,
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
