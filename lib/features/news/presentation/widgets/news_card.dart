import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/entities/daily_news.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../core/theme/theme_provider.dart';

/// Карточка новости в ленте.
///
/// [isTop] — акцентная стилизация для первой (топ) новости дня.
class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
    required this.onTap,
    this.isTop = false,
  });

  final DailyNews news;
  final VoidCallback onTap;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hasImpact = news.impactOnPortfolio;
    final impact = news.portfolioImpactPercent;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spaceMd),
      child: AppCard(
        onTap: onTap,
        color: isTop ? context.palette.primaryContainer : context.palette.surface,
        radius: isTop ? AppDimensions.radiusLg : AppDimensions.radiusMd,
        padding: const EdgeInsets.all(AppDimensions.spaceLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Бейдж «Сегодня важно» для топ-новости.
            if (isTop) ...[
              Row(
                children: [
                  Icon(
                    Icons.trending_up,
                    size: 14,
                    color: context.palette.onPrimaryContainer,
                  ),
                  const SizedBox(width: AppDimensions.space2xs),
                  Text(
                    l10n.todayImportant.toUpperCase(),
                    style: AppTextStyles.labelSmall.copyWith(
                      color: context.palette.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.spaceSm),
            ],
            // Заголовок.
            Text(
              news.title,
              style: isTop
                  ? AppTextStyles.titleMedium
                  : AppTextStyles.titleSmall,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppDimensions.spaceXs),
            // Сводка.
            Text(
              news.summary,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isTop
                    ? context.palette.textPrimary.withValues(alpha: 0.75)
                    : context.palette.textSecondary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppDimensions.spaceMd),
            // Нижняя строка: время + влияние + теги.
            Row(
              children: [
                Icon(
                  Icons.schedule,
                  size: 14,
                  color: context.palette.textSecondary,
                ),
                const SizedBox(width: AppDimensions.space2xs),
                Text(
                  _formatTime(news.publishedAt),
                  style: AppTextStyles.labelSmall.copyWith(
                    color: context.palette.textSecondary,
                  ),
                ),
                const SizedBox(width: AppDimensions.spaceSm),
                if (hasImpact) ...[
                  Icon(
                    Icons.insights,
                    size: 14,
                    color: isTop
                        ? context.palette.onPrimaryContainer
                        : context.palette.primary,
                  ),
                  const SizedBox(width: AppDimensions.space2xs),
                  Flexible(
                    child: Text(
                      l10n.newsImpactPortfolio,
                      style: AppTextStyles.labelSmall.copyWith(
                        color: isTop
                            ? context.palette.onPrimaryContainer
                            : context.palette.primary,
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
                      style: AppTextStyles.labelSmall.copyWith(
                        color: isTop
                            ? context.palette.onPrimaryContainer
                            : context.palette.primary,
                      ),
                    ),
                  ],
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} мин назад';
    }
    if (diff.inHours < 24) {
      return '${diff.inHours} ч назад';
    }
    return '${dateTime.day}.${dateTime.month.toString().padLeft(2, '0')}';
  }
}
