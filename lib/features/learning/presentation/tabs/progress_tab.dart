import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/entities/user_stats.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/shimmer_skeleton.dart';
import '../../../../core/theme/theme_provider.dart';

/// Вкладка «Прогресс» — стрики, средние, топ-темы, bias-паттерны.
class ProgressTab extends ConsumerWidget {
  const ProgressTab({super.key, required this.statsAsync, required this.onRetry});

  final AsyncValue<UserStats> statsAsync;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return statsAsync.when(
      loading: () => const _ProgressLoading(),
      error: (error, _) => _ProgressError(onRetry: onRetry),
      data: (stats) {
        final hasData =
            stats.currentStreak > 0 || stats.activeDays > 0;
        if (!hasData) return _ProgressEmpty();
        return ListView(
          padding: const EdgeInsets.all(AppDimensions.spaceMd),
          children: [
            // Статистика: стрик + среднее
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: Icons.local_fire_department,
                    iconColor: context.palette.warning,
                    label: l10n.learnProgressStreak,
                    value: l10n.learnProgressStreakDays(stats.currentStreak),
                  ),
                ),
                const SizedBox(width: AppDimensions.spaceSm),
                Expanded(
                  child: _StatCard(
                    icon: Icons.trending_up,
                    iconColor: context.palette.primary,
                    label: l10n.learnProgressAvg,
                    value: l10n.learnProgressAvgValue(
                      stats.avgInteractionsPerDay.round(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spaceLg),

            // Топ-темы
            if (stats.topTopics.isNotEmpty) ...[
              Text(
                l10n.learnProgressTopics,
                style: AppTextStyles.titleMedium,
              ),
              const SizedBox(height: AppDimensions.spaceSm),
              Wrap(
                spacing: AppDimensions.spaceXs,
                runSpacing: AppDimensions.spaceXs,
                children: [
                  for (final topic in stats.topTopics)
                    _TopicChip(label: topic),
                ],
              ),
              const SizedBox(height: AppDimensions.spaceLg),
            ],

            // Bias-паттерны
            if (stats.biasPatterns.isNotEmpty) ...[
              Text(
                l10n.learnProgressBias,
                style: AppTextStyles.titleMedium,
              ),
              const SizedBox(height: AppDimensions.spaceSm),
              Wrap(
                spacing: AppDimensions.spaceXs,
                runSpacing: AppDimensions.spaceXs,
                children: [
                  for (final bias in stats.biasPatterns)
                    _BiasChip(label: bias),
                ],
              ),
              const SizedBox(height: AppDimensions.spaceLg),
            ],

            // Активные дни
            Container(
              padding: const EdgeInsets.all(AppDimensions.spaceMd),
              decoration: BoxDecoration(
                color: context.palette.surface,
                borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                border: Border.all(color: context.palette.outline),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: context.palette.textSecondary,
                    size: 20,
                  ),
                  const SizedBox(width: AppDimensions.spaceSm),
                  Text(
                    l10n.learnProgressEmpty,
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Карточка статистики (стрик / среднее).
class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spaceLg),
      decoration: BoxDecoration(
        color: context.palette.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: context.palette.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: AppDimensions.spaceSm),
          Text(
            value,
            style: AppTextStyles.display.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.labelMedium,
          ),
        ],
      ),
    );
  }
}

/// Чип темы.
class _TopicChip extends StatelessWidget {
  const _TopicChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMd,
        vertical: AppDimensions.spaceXs,
      ),
      decoration: BoxDecoration(
        color: context.palette.surfaceElevated,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelLarge,
      ),
    );
  }
}

/// Чип bias-паттерна.
class _BiasChip extends StatelessWidget {
  const _BiasChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMd,
        vertical: AppDimensions.spaceXs,
      ),
      decoration: BoxDecoration(
        color: context.palette.primaryContainer,
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.psychology_outlined,
            size: 14,
            color: context.palette.onPrimaryContainer,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.labelLarge.copyWith(
              color: context.palette.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

/// Loading.
class _ProgressLoading extends StatelessWidget {
  const _ProgressLoading();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ShimmerSkeleton(
          child: Row(
            children: [
              Expanded(child: _StatGhost()),
              const SizedBox(width: AppDimensions.spaceSm),
              Expanded(child: _StatGhost()),
            ],
          ),
        ),
        const SizedBox(height: AppDimensions.spaceLg),
        ShimmerSkeleton(
          child: Row(
            children: [
              _GhostBar(width: 80, height: 28),
              const SizedBox(width: 8),
              _GhostBar(width: 100, height: 28),
              const SizedBox(width: 8),
              _GhostBar(width: 70, height: 28),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatGhost extends StatelessWidget {
  const _StatGhost();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spaceLg),
      decoration: BoxDecoration(
        color: context.palette.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: context.palette.outline),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 24, height: 24),
          SizedBox(height: 12),
          _GhostBar(width: 60, height: 22),
          SizedBox(height: 4),
          _GhostBar(width: 80, height: 12),
        ],
      ),
    );
  }
}

class _GhostBar extends StatelessWidget {
  const _GhostBar({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: context.palette.surfaceElevated,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
      ),
    );
  }
}

/// Empty.
class _ProgressEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spaceXxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.bar_chart_outlined,
              color: context.palette.textSecondary,
              size: 40,
            ),
            const SizedBox(height: AppDimensions.spaceMd),
            Text(
              l10n.learnProgressEmpty,
              style: AppTextStyles.bodyMedium.copyWith(
                color: context.palette.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// Error.
class _ProgressError extends StatelessWidget {
  const _ProgressError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, color: context.palette.error, size: 40),
          const SizedBox(height: AppDimensions.spaceMd),
          Text(
            l10n.somethingWentWrong,
            style: AppTextStyles.titleMedium,
          ),
          const SizedBox(height: AppDimensions.spaceLg),
          TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, size: 18),
            label: Text(l10n.retry),
          ),
        ],
      ),
    );
  }
}
