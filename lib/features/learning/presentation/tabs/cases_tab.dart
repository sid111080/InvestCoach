import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/entities/saved_case.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/shimmer_skeleton.dart';

/// Вкладка «Мои Кейсы» — сохранённые разговоры по новостям.
class CasesTab extends ConsumerWidget {
  const CasesTab({super.key, required this.casesAsync, required this.onRetry});

  final AsyncValue<List<SavedCase>> casesAsync;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return casesAsync.when(
      loading: () => const _CasesLoading(),
      error: (error, _) => _CasesError(onRetry: onRetry),
      data: (cases) {
        if (cases.isEmpty) return _CasesEmpty();
        return ListView.separated(
          padding: const EdgeInsets.all(AppDimensions.spaceMd),
          itemCount: cases.length,
          separatorBuilder: (_, _) =>
              const SizedBox(height: AppDimensions.spaceSm),
          itemBuilder: (context, index) => _CaseCard(cas: cases[index]),
        );
      },
    );
  }
}

/// Карточка сохранённого кейса.
class _CaseCard extends StatelessWidget {
  const _CaseCard({required this.cas});

  final SavedCase cas;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spaceLg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.bookmark_outline,
                size: 18,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: AppDimensions.spaceXs),
              Text(
                _formatDate(cas.savedAt),
                style: AppTextStyles.labelSmall,
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spaceXs),
          Text(
            cas.topic,
            style: AppTextStyles.titleMedium,
          ),
          const SizedBox(height: AppDimensions.spaceXs),
          Text(
            cas.excerpt,
            style: AppTextStyles.bodySmall,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'янв', 'фев', 'мар', 'апр',
      'май', 'июн', 'июл', 'авг',
      'сен', 'окт', 'ноя', 'дек',
    ];
    return '${date.day} ${months[date.month - 1]}';
  }
}

/// Loading.
class _CasesLoading extends StatelessWidget {
  const _CasesLoading();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      itemCount: 3,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: AppDimensions.spaceSm),
        child: ShimmerSkeleton(child: const _CaseGhost()),
      ),
    );
  }
}

class _CaseGhost extends StatelessWidget {
  const _CaseGhost();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spaceLg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.outline),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _GhostBar(width: 60, height: 10),
          SizedBox(height: AppDimensions.spaceXs),
          _GhostBar(width: double.infinity, height: 16),
          SizedBox(height: AppDimensions.spaceXs),
          _GhostBar(width: double.infinity, height: 12),
          SizedBox(height: AppDimensions.spaceXs),
          _GhostBar(width: double.infinity, height: 12),
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
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
      ),
    );
  }
}

/// Empty.
class _CasesEmpty extends StatelessWidget {
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
              Icons.bookmark_border,
              color: AppColors.textSecondary,
              size: 40,
            ),
            const SizedBox(height: AppDimensions.spaceMd),
            Text(
              l10n.learnCasesEmpty,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
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
class _CasesError extends StatelessWidget {
  const _CasesError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, color: AppColors.error, size: 40),
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
