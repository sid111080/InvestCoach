import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/entities/weekly_review.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/shimmer_skeleton.dart';
import '../../../../core/theme/theme_provider.dart';

/// Вкладка «Weekly Reviews» — текущий разбор + история.
class ReviewsTab extends ConsumerWidget {
  const ReviewsTab({
    super.key,
    required this.currentAsync,
    required this.historyAsync,
    required this.onRetry,
  });

  final AsyncValue<WeeklyReview?> currentAsync;
  final AsyncValue<List<WeeklyReview>> historyAsync;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return currentAsync.when(
      loading: () => const _ReviewsLoading(),
      error: (error, _) => _ReviewsError(onRetry: onRetry),
      data: (current) {
        final history = historyAsync.value ?? [];
        return ListView(
          padding: const EdgeInsets.all(AppDimensions.spaceMd),
          children: [
            if (current != null)
              _CurrentReviewCard(review: current)
            else
              _ReviewsEmpty(),
            if (history.length > 1) ...[
                const SizedBox(height: AppDimensions.spaceLg),
                _HistorySection(history: history),
              ],
          ],
        );
      },
    );
  }
}

/// Акцентная карточка текущего Weekly Review.
class _CurrentReviewCard extends StatelessWidget {
  const _CurrentReviewCard({required this.review});

  final WeeklyReview review;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spaceXl),
      decoration: BoxDecoration(
        color: context.palette.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
        border: Border.all(color: context.palette.outline),
      ),
      child: Column(
        children: [
          // Круг с Process Score
          _ScoreCircle(score: review.processScore),
          const SizedBox(height: AppDimensions.spaceLg),
          Text(
            l10n.learnReviewScore,
            style: AppTextStyles.labelMedium.copyWith(
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: AppDimensions.spaceXl),

          // Сравнение с индексом
          if (review.portfolioComparison != null) ...[
            _ComparisonRow(
              comparison: review.portfolioComparison!,
            ),
            const SizedBox(height: AppDimensions.spaceLg),
          ],

          // Инсайты
          Text(
            l10n.learnReviewInsights,
            style: AppTextStyles.titleSmall,
          ),
          const SizedBox(height: AppDimensions.spaceSm),
          ...review.insights.map(
            (insight) => Padding(
              padding: const EdgeInsets.only(bottom: AppDimensions.spaceXs),
              child: _InsightChip(text: insight),
            ),
          ),
          const SizedBox(height: AppDimensions.spaceLg),

          // Кнопка «Обсудить»
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: context.palette.primary,
                foregroundColor: context.palette.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                ),
              ),
              icon: const Icon(Icons.chat_bubble_outline, size: 20),
              label: Text(
                l10n.learnReviewDiscuss,
                style: AppTextStyles.labelLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Круг с Process Score.
class _ScoreCircle extends StatelessWidget {
  const _ScoreCircle({required this.score});

  final double score;

  @override
  Widget build(BuildContext context) {
    final ratio = score / 10.0;
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: CircularProgressIndicator(
              value: ratio,
              strokeWidth: 8,
              strokeCap: StrokeCap.round,
              backgroundColor: context.palette.surfaceElevated,
              valueColor: AlwaysStoppedAnimation<Color>(
                context.palette.primary,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                score.toStringAsFixed(1),
                style: AppTextStyles.display.copyWith(fontSize: 28),
              ),
              Text(
                '/ 10',
                style: AppTextStyles.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Строка сравнения с индексом.
class _ComparisonRow extends StatelessWidget {
  const _ComparisonRow({required this.comparison});

  final PortfolioComparison comparison;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      decoration: BoxDecoration(
        color: context.palette.surfaceElevated,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ComparisonItem(
            label: l10n.learnReviewYourReturn,
            value: comparison.yourReturn,
            isPositive: comparison.yourReturn >= 0,
          ),
          Container(
            width: 1,
            height: 32,
            color: context.palette.outline,
          ),
          _ComparisonItem(
            label: l10n.learnReviewIndexReturn,
            value: comparison.indexReturn,
            isPositive: comparison.indexReturn >= 0,
          ),
        ],
      ),
    );
  }
}

class _ComparisonItem extends StatelessWidget {
  const _ComparisonItem({
    required this.label,
    required this.value,
    required this.isPositive,
  });

  final String label;
  final double value;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${value >= 0 ? '+' : ''}${value.toStringAsFixed(1)}%',
          style: AppTextStyles.titleMedium.copyWith(
            color: isPositive ? context.palette.success : context.palette.error,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.labelSmall),
      ],
    );
  }
}

/// Чип-инсайт.
class _InsightChip extends StatelessWidget {
  const _InsightChip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMd,
        vertical: AppDimensions.spaceSm,
      ),
      decoration: BoxDecoration(
        color: context.palette.surfaceElevated,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      ),
      child: Row(
        children: [
          Icon(Icons.lightbulb_outline, size: 16, color: context.palette.warning),
          const SizedBox(width: AppDimensions.spaceXs),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodySmall.copyWith(
                color: context.palette.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Секция истории.
class _HistorySection extends StatelessWidget {
  const _HistorySection({required this.history});

  final List<WeeklyReview> history;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.learnReviewHistory,
          style: AppTextStyles.titleLarge,
        ),
        const SizedBox(height: AppDimensions.spaceSm),
        // Пропускаем первый (он уже показан как текущий)
        ...history.skip(1).map(
              (review) => Padding(
                padding: const EdgeInsets.only(bottom: AppDimensions.spaceSm),
                child: _HistoryCard(review: review),
              ),
            ),
      ],
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.review});

  final WeeklyReview review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      decoration: BoxDecoration(
        color: context.palette.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: context.palette.outline),
      ),
      child: Row(
        children: [
          // Мини-круг со score
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.palette.primaryContainer,
            ),
            child: Center(
              child: Text(
                review.processScore.toStringAsFixed(1),
                style: AppTextStyles.titleSmall.copyWith(
                  color: context.palette.onPrimaryContainer,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.spaceMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.week,
                  style: AppTextStyles.titleSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  review.insights.first,
                  style: AppTextStyles.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Loading.
class _ReviewsLoading extends StatelessWidget {
  const _ReviewsLoading();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShimmerSkeleton(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimensions.spaceXl),
          decoration: BoxDecoration(
            color: context.palette.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
            border: Border.all(color: context.palette.outline),
          ),
          child: const Column(
            children: [
              SizedBox(width: 120, height: 120),
              SizedBox(height: 20),
              _GhostBar(width: 100, height: 12),
              SizedBox(height: 16),
              _GhostBar(width: double.infinity, height: 40),
              SizedBox(height: 16),
              _GhostBar(width: double.infinity, height: 32),
            ],
          ),
        ),
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
class _ReviewsEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spaceXl),
      decoration: BoxDecoration(
        color: context.palette.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
        border: Border.all(color: context.palette.outline),
      ),
      child: Column(
        children: [
          Icon(
            Icons.event_note_outlined,
            color: context.palette.textSecondary,
            size: 48,
          ),
          const SizedBox(height: AppDimensions.spaceMd),
          Text(
            l10n.learnReviewEmpty,
            style: AppTextStyles.bodyMedium.copyWith(
              color: context.palette.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Error.
class _ReviewsError extends StatelessWidget {
  const _ReviewsError({required this.onRetry});

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
