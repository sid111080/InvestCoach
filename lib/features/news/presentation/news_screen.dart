import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/repository_providers.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/daily_news.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/haptics.dart';
import '../../../shared/widgets/animated_reveal.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/shimmer_skeleton.dart';
import 'widgets/news_card.dart';
import '../../../core/theme/theme_provider.dart';

/// Экран «Новости» — лента новостей дня с Push-механикой.
///
/// Сверху — заголовок, далее карточки (топ-новость акцентная).
/// Pull-to-Refresh. Тап по карточке → Coach с контекстом новости.
class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(dailyNewsProvider);

    return Scaffold(
      backgroundColor: context.palette.background,
      body: RefreshIndicator(
        color: context.palette.primary,
        backgroundColor: context.palette.surface,
        onRefresh: () async => ref.invalidate(dailyNewsProvider),
        child: newsAsync.when(
          loading: () => const _NewsLoading(),
          error: (error, stackTrace) => _NewsError(
            onRetry: () => ref.invalidate(dailyNewsProvider),
          ),
          data: (news) {
            if (news.isEmpty) return const _NewsEmpty();
            return _NewsFeed(
              news: news,
              onCardTap: (item) {
                Haptics.light();
                context.go('/coach', extra: item);
              },
            );
          },
        ),
      ),
    );
  }
}

/// Лента: заголовок + карточки.
class _NewsFeed extends StatelessWidget {
  const _NewsFeed({required this.news, required this.onCardTap});

  final List<DailyNews> news;
  final ValueChanged<DailyNews> onCardTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      itemCount: news.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.spaceMd),
            child: Text(
              l10n.newsFeedTitle,
              style: AppTextStyles.titleLarge,
            ),
          );
        }
        final item = news[index - 1];
        return AnimatedReveal(
          delay: Duration(milliseconds: (index - 1) * 60),
          child: NewsCard(
            news: item,
            isTop: index == 1,
            onTap: () => onCardTap(item),
          ),
        );
      },
    );
  }
}

/// Loading: shimmer-скелетоны.
class _NewsLoading extends StatelessWidget {
  const _NewsLoading();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      itemCount: 4,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: AppDimensions.spaceMd),
        child: ShimmerSkeleton(child: _NewsCardGhost()),
      ),
    );
  }
}

/// Error: иконка + «Повторить».
class _NewsError extends StatelessWidget {
  const _NewsError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      children: [
        const SizedBox(height: 120),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: context.palette.error, size: 40),
              const SizedBox(height: AppDimensions.spaceMd),
              Text(
                l10n.somethingWentWrong,
                style: AppTextStyles.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.spaceLg),
              AppButton(
                label: l10n.retry,
                icon: Icons.refresh,
                onPressed: onRetry,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Empty.
class _NewsEmpty extends StatelessWidget {
  const _NewsEmpty();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      children: [
        const SizedBox(height: 120),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.newspaper_outlined,
                color: context.palette.textSecondary,
                size: 40,
              ),
              const SizedBox(height: AppDimensions.spaceMd),
              Text(
                l10n.noNewsForToday,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: context.palette.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Скелетон карточки.
class _NewsCardGhost extends StatelessWidget {
  const _NewsCardGhost();

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
          _GhostBar(width: 100, height: 10),
          SizedBox(height: AppDimensions.spaceSm),
          _GhostBar(width: double.infinity, height: 18),
          SizedBox(height: AppDimensions.spaceXs),
          _GhostBar(width: double.infinity, height: 14),
          SizedBox(height: AppDimensions.spaceXs),
          _GhostBar(width: double.infinity, height: 14),
          SizedBox(height: AppDimensions.spaceMd),
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
