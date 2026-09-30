import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Шрифтовые семейства дизайн-системы.
///
/// ТЗ предписывает Satoshi для заголовков, но лицензионные TTF ещё не
/// предоставлены дизайнером — временно используется Inter. После получения
/// файлов положить их в `assets/fonts/`, зарегистрировать в pubspec.yaml
/// и заменить [AppFonts.heading] на `'Satoshi'`.
abstract final class AppFonts {
  AppFonts._();

  /// Шрифт заголовков.
  static const String heading = 'Inter';

  /// Шрифт основного текста.
  static const String body = 'Inter';
}

/// Типографика InvestCoach.
abstract final class AppTextStyles {
  AppTextStyles._();

  /// Крупные цифры (итог портфеля, Process Score).
  static const TextStyle display = TextStyle(
    fontFamily: AppFonts.heading,
    fontSize: 30,
    height: 1.25,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: AppFonts.heading,
    fontSize: 20,
    height: 1.3,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: AppFonts.heading,
    fontSize: 16,
    height: 1.35,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: AppFonts.heading,
    fontSize: 14,
    height: 1.4,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 16,
    height: 1.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 14,
    height: 1.45,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 12,
    height: 1.4,
    color: AppColors.textSecondary,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 14,
    height: 1.3,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: AppColors.textSecondary,
  );
}
