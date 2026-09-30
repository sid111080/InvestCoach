import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/repository_providers.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/entities/daily_news.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/shimmer_skeleton.dart';

/// Акцентная карточка «Сегодня важно» (`GET /news/daily`).
///
/// Главное: заголовок + сводка первой новости дня и кнопка
/// «Обсудить с Coach» — точка входа в обсуждение с контекстом.
/// Состояния: Loading (shimmer) / Error (retry) / Empty / Data.
class DailyNewsCard extends ConsumerWidget {
  const DailyNewsCard({super.key, required this.onDiscuss});

  /// Нажата кнопка «Обсудить с Coach» — передаём новость целиком,
  /// чтобы экран сформировал вопрос и контекст для чата.
  final ValueChanged<DailyNews> onDiscuss;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return ref.watch(dailyNewsProvider).when(
          loading: () => const ShimmerSkeleton(
                child: _NewsCardGhost(),
              ),
          error: (error, stackTrace) => AppCard(
            child: Column(
              children: [
                Icon(Icons.error_outline, color: AppColors.error, size: 24),
                const SizedBox(height: AppDimensions.spaceSm),
                Text(
                  l10n.somethingWentWrong,
                  style: AppTextStyles.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimensions.spaceMd),
                AppButton(
                  label: l10n.retry,
                  variant: AppButtonVariant.ghost,
                  onPressed: () => ref.invalidate(dailyNewsProvider),
                ),
              ],
            ),
          ),
          data: (news) {
            if (news.isEmpty) {
              return AppCard(
                child: Text(
                  l10n.noNewsForToday,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return _NewsContent(news: news.first, onDiscuss: onDiscuss);
          },
        );
  }
}

class _NewsContent extends StatelessWidget {
  const _NewsContent({
    required this.news,
    required this.onDiscuss,
  });

  final DailyNews news;
  final ValueChanged<DailyNews> onDiscuss;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hasImpact = news.impactOnPortfolio;
    final impact = news.portfolioImpactPercent;

    return AppCard(
      color: AppColors.primaryContainer,
      radius: AppDimensions.radiusLg,
      padding: const EdgeInsets.all(AppDimensions.spaceLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.trending_up,
                size: 16,
                color: AppColors.onPrimaryContainer,
              ),
              const SizedBox(width: AppDimensions.spaceXs),
              Text(
                l10n.todayImportant.toUpperCase(),
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.onPrimaryContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spaceSm),
          Text(
            news.title,
            style: AppTextStyles.titleMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppDimensions.spaceXs),
          Text(
            news.summary,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary.withValues(alpha: 0.75),
            ),
          ),
          const SizedBox(height: AppDimensions.spaceMd),
          Row(
            children: [
              Icon(
                hasImpact ? Icons.insights : Icons.remove,
                size: 16,
                color: hasImpact
                    ? AppColors.onPrimaryContainer
                    : AppColors.textSecondary,
              ),
              const SizedBox(width: AppDimensions.space2xs),
              Expanded(
                child: Text(
                  hasImpact
                      ? l10n.newsImpactPortfolio
                      : l10n.newsNoImpact,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: hasImpact
                        ? AppColors.onPrimaryContainer
                        : AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (impact != null) ...[
                const SizedBox(width: AppDimensions.space2xs),
                Text(
                  '${impact >= 0 ? '+' : '−'}'
                  '${impact.abs().toStringAsFixed(1).replaceAll('.', ',')}',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.onPrimaryContainer,
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: AppDimensions.spaceMd),
          AppButton(
            label: l10n.todayImportantDiscuss,
            icon: Icons.chat_bubble_outline,
            expand: true,
            onPressed: () => onDiscuss(news),
          ),
        ],
      ),
    );
  }
}

/// Скелетон карточки: «призрак» заголовка, сводки и кнопки.
class _NewsCardGhost extends StatelessWidget {
  const _NewsCardGhost();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.primaryContainer,
      radius: AppDimensions.radiusLg,
      padding: const EdgeInsets.all(AppDimensions.spaceLg),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _GhostBar(width: 96, height: 10),
          SizedBox(height: AppDimensions.spaceMd),
          _GhostBar(width: double.infinity, height: 18),
          SizedBox(height: AppDimensions.spaceSm),
          _GhostBar(width: double.infinity, height: 14),
          SizedBox(height: AppDimensions.spaceMd),
          _GhostBar(width: 140, height: 12),
          SizedBox(height: AppDimensions.spaceMd),
          _GhostBar(
            width: double.infinity,
            height: AppDimensions.minTapTarget,
            radius: AppDimensions.radiusMd,
          ),
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
