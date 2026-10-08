import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/theme_palette.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../l10n/app_localizations.dart';

/// Экран «Выберите тему» — показывается при первом запуске.
///
/// Горизонтальный скролл превью 5 тем, тап — выбор.
class ThemeSelectionScreen extends ConsumerWidget {
  const ThemeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final currentPalette = ref.watch(themePaletteProvider);

    return Scaffold(
      backgroundColor: context.palette.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.spaceXl),
            // Заголовок
            Text(
              l10n.themeSelectTitle,
              style: AppTextStyles.titleLarge
                  .copyWith(color: context.palette.textPrimary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spaceSm),
            Text(
              l10n.themeSelectSubtitle,
              style: AppTextStyles.bodyMedium
                  .copyWith(color: context.palette.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spaceXl),
            // Горизонтальный скролл превью
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spaceLg,
                ),
                itemCount: allPalettes.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: AppDimensions.spaceMd),
                itemBuilder: (context, index) {
                  final palette = allPalettes[index];
                  final isSelected = palette.id == currentPalette.id;
                  return _ThemePreviewCard(
                    palette: palette,
                    isSelected: isSelected,
                    onTap: () {
                      ref.read(themePaletteProvider.notifier).setTheme(palette.id);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: AppDimensions.spaceXl),
            // Кнопка «Начать»
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spaceLg,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: () => context.go('/onboarding'),
                  style: FilledButton.styleFrom(
                    backgroundColor: context.palette.primary,
                    foregroundColor: context.palette.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                    ),
                  ),
                  child: Text(
                    l10n.themeSelectStart,
                    style: AppTextStyles.labelLarge,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spaceXl),
          ],
        ),
      ),
    );
  }
}

/// Карточка-превью одной темы.
class _ThemePreviewCard extends StatelessWidget {
  const _ThemePreviewCard({
    required this.palette,
    required this.isSelected,
    required this.onTap,
  });

  final ThemePalette palette;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 160,
        padding: const EdgeInsets.all(AppDimensions.spaceMd),
        decoration: BoxDecoration(
          color: palette.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          border: Border.all(
            color: isSelected ? palette.primary : palette.outline,
            width: isSelected ? 2.5 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Мини-превью: 3 «плитки»
            Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(
                color: palette.background,
                borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 12,
                      decoration: BoxDecoration(
                        color: palette.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 60,
                      height: 8,
                      decoration: BoxDecoration(
                        color: palette.primaryContainer,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 50,
                      height: 8,
                      decoration: BoxDecoration(
                        color: palette.surfaceElevated,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spaceSm),
            // Название
            Text(
              palette.name,
              style: AppTextStyles.labelLarge
                  .copyWith(color: palette.textPrimary),
              textAlign: TextAlign.center,
            ),
            // Индикатор выбора
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Icon(
                  Icons.check_circle,
                  size: 20,
                  color: palette.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
