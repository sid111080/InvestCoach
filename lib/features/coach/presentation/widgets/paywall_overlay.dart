import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_card.dart';

/// Мягкий paywall: дневной лимит Free-тарифа исчерпан.
///
/// Показывается поверх главного экрана (затемнение + карточка).
/// «Перейти на News+» — пока stub (оплата — Спринт 3).
class PaywallOverlay extends StatelessWidget {
  const PaywallOverlay({
    super.key,
    required this.onUpgrade,
    required this.onDismiss,
  });

  /// «Перейти на News+» (в Спринте 1 — hint о ближайших планах).
  final VoidCallback onUpgrade;

  /// «Позже» — закрываем оверлей, лимит при этом остаётся.
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final palette = context.palette;

    return Positioned.fill(
      child: Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(color: palette.overlay),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spaceXl,
                ),
                child: AppCard(
                  padding: const EdgeInsets.all(AppDimensions.spaceXl),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: palette.warning.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.workspace_premium,
                          color: palette.warning,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spaceMd),
                      Text(
                        l10n.paywallTitle,
                        style: AppTextStyles.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppDimensions.spaceXs),
                      Text(
                        l10n.paywallText,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: palette.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppDimensions.spaceLg),
                      AppButton(
                        label: l10n.paywallUpgrade,
                        expand: true,
                        onPressed: onUpgrade,
                      ),
                      const SizedBox(height: AppDimensions.spaceXs),
                      AppButton(
                        label: l10n.paywallLater,
                        variant: AppButtonVariant.ghost,
                        expand: true,
                        onPressed: onDismiss,
                      ),
                    ],
                  ),
                ),
              ),
            ).animate().fadeIn(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
            ),
          ),
        ],
      ),
    );
  }
}
