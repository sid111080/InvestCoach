import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';

/// Горизонтальный скролл чипсов с примерами вопросов (Quick Actions).
///
/// Тап по чипу — тот же путь, что и обычный вопрос:
/// [onSend] с текстом чипа. Во время генерации ответа
/// чипы заблокированы ([isEnabled] = false).
class QuickActionsBar extends StatelessWidget {
  const QuickActionsBar({
    super.key,
    required this.questions,
    required this.onSend,
    this.isEnabled = true,
  });

  final List<String> questions;
  final ValueChanged<String> onSend;

  /// `false`, пока Coach думает/стримит — новые вопросы не шлются.
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.space2xs,
          ),
          child: Text(
            l10n.quickActions,
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spaceXs),
        SizedBox(
          height: AppDimensions.spaceXxl,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: questions.length,
            separatorBuilder: (_, _) =>
                const SizedBox(width: AppDimensions.spaceXs),
            itemBuilder: (context, index) => _ActionChip(
              label: questions[index],
              onTap: isEnabled ? () => onSend(questions[index]) : null,
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionChip extends StatelessWidget {
  const _ActionChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return Opacity(
      opacity: enabled ? 1 : 0.45,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spaceMd,
            vertical: AppDimensions.spaceSm,
          ),
          constraints: const BoxConstraints(
            minHeight: AppDimensions.minTapTarget * 0.6,
          ),
          decoration: BoxDecoration(
            color: AppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
            border: Border.all(color: AppColors.outline),
          ),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
