import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/theme_provider.dart';

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
              color: context.palette.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spaceXs),
        // SingleChildScrollView + Row: высота определяется чипсами,
        // без жёсткого ограничения и без parentDataDirty в тестах.
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i = 0; i < questions.length; i++) ...[
                if (i > 0) const SizedBox(width: AppDimensions.spaceXs),
                _ActionChip(
                  label: questions[i],
                  onTap: isEnabled ? () => onSend(questions[i]) : null,
                ),
              ],
            ],
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
          // Минимальный tap target 44dp (accessibility).
          constraints: const BoxConstraints(minHeight: 44),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spaceMd,
            vertical: AppDimensions.spaceXs,
          ),
          decoration: BoxDecoration(
            color: context.palette.surfaceElevated,
            borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
            border: Border.all(color: context.palette.outline),
          ),
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.labelMedium.copyWith(
                color: context.palette.textPrimary,
              ),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
