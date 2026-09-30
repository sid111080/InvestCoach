import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/providers/repository_providers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/entities/portfolio_summary.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/shimmer_skeleton.dart';

/// Плавающая мини-карточка портфеля (`GET /portfolio/summary`).
///
/// Лежит в конце скролла — «появляется при прокрутке».
/// Ненужное состояние: при ошибке карточка скрывается
/// (портфель не блокирует другие функции экрана).
class PortfolioMiniCard extends ConsumerWidget {
  const PortfolioMiniCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(portfolioSummaryProvider).when(
          loading: () => const ShimmerSkeleton(child: _CardGhost()),
          error: (error, stackTrace) => const SizedBox.shrink(),
          data: (summary) => summary == null
              ? const SizedBox.shrink()
              : _PortfolioContent(summary: summary),
        );
  }
}

class _PortfolioContent extends StatelessWidget {
  const _PortfolioContent({required this.summary});

  final PortfolioSummary summary;

  /// Формат «10 236 ₽» (ru-разделитель — неразрывный пробел).
  String _formatRubles(int value) {
    final formatted = NumberFormat('#,##0', 'ru_RU').format(value);
    return value < 0 ? '−$formatted ₽' : '$formatted ₽';
  }

  String _formatSignedPercent(double percent) {
    final digits = percent.abs().toStringAsFixed(1).replaceAll('.', ',');
    return '${percent >= 0 ? '+' : '−'}$digits%';
  }

  Color _allocationColor(String key) => switch (key) {
        'stocks' => AppColors.primary,
        'bonds' => AppColors.onPrimaryContainer,
        'etf' => AppColors.primaryContainer,
        _ => AppColors.textSecondary.withValues(alpha: 0.5),
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final rising = summary.dailyChangePercent >= 0;
    final changeColor = rising ? AppColors.success : AppColors.error;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.portfolioCardTitle,
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppDimensions.space2xs),
          Text(
            _formatRubles(summary.totalValueRub),
            style: AppTextStyles.display.copyWith(fontSize: 24),
          ),
          Row(
            children: [
              Text(
                _formatSignedPercent(summary.dailyChangePercent),
                style: AppTextStyles.labelMedium.copyWith(color: changeColor),
              ),
              if (summary.dailyChangeRub != null) ...[
                const SizedBox(width: AppDimensions.spaceXs),
                Text(
                  '${rising ? '+' : '−'}'
                  '${_formatRubles(summary.dailyChangeRub!.abs())}',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
          if (summary.allocation.isNotEmpty) ...[
            const SizedBox(height: AppDimensions.spaceSm),
            _AllocationBar(allocation: summary.allocation),
            const SizedBox(height: AppDimensions.spaceSm),
            Wrap(
              spacing: AppDimensions.spaceXs,
              runSpacing: AppDimensions.spaceXs,
              children: [
                for (final entry in summary.allocation.entries)
                  _LegendChip(
                    label: _labelFor(l10n, entry.key),
                    percent: entry.value,
                    color: _allocationColor(entry.key),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _labelFor(AppLocalizations l10n, String key) => switch (key) {
        'stocks' => l10n.allocStocks,
        'bonds' => l10n.allocBonds,
        'etf' => l10n.allocEtf,
        _ => l10n.allocOther,
      };
}

/// Тонкая стековая диаграмма аллокации (пропорциональные сегменты).
class _AllocationBar extends StatelessWidget {
  const _AllocationBar({required this.allocation});

  final Map<String, double> allocation;

  @override
  Widget build(BuildContext context) {
    final total = allocation.values.fold<double>(0, (sum, value) => sum + value);
    final remainder = (100 - total).clamp(0.0, 100.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      child: SizedBox(
        height: 8,
        child: Row(
          children: [
            for (final entry in allocation.entries)
              Expanded(
                flex: entry.value.round().clamp(1, 999),
                child: ColoredBox(
                  color: _colorFor(entry.key),
                ),
              ),
            if (remainder > 0.5)
              Expanded(
                flex: remainder.round().clamp(1, 999),
                child: const ColoredBox(
                  color: AppColors.surfaceElevated,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _colorFor(String key) => switch (key) {
        'stocks' => AppColors.primary,
        'bonds' => AppColors.onPrimaryContainer,
        'etf' => AppColors.primaryContainer,
        _ => AppColors.textSecondary.withValues(alpha: 0.5),
      };
}

class _LegendChip extends StatelessWidget {
  const _LegendChip({
    required this.label,
    required this.percent,
    required this.color,
  });

  final String label;
  final double percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: AppDimensions.space2xs),
        Text(
          '$label ${percent.round()}%',
          style: AppTextStyles.labelSmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _CardGhost extends StatelessWidget {
  const _CardGhost();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _GhostBar(width: 110, height: 10),
          SizedBox(height: AppDimensions.spaceSm),
          _GhostBar(width: 120, height: 22),
          SizedBox(height: AppDimensions.spaceXs),
          _GhostBar(width: 90, height: 12),
          SizedBox(height: AppDimensions.spaceSm),
          _GhostBar(width: double.infinity, height: 8, radius: 999),
        ],
      ),
    );
  }
}

class _GhostBar extends StatelessWidget {
  const _GhostBar({
    required this.width,
    required this.height,
    this.radius = AppDimensions.radiusSm,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
