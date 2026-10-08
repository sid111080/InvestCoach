import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/providers/repository_providers.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/entities/micro_lesson.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/shimmer_skeleton.dart';
import '../../../../core/theme/theme_provider.dart';

/// Вкладка «Сегодня» — рекомендованные микро-уроки.
class TodayTab extends ConsumerWidget {
  const TodayTab({
    super.key,
    required this.lessonsAsync,
    required this.onRetry,
  });

  final AsyncValue<List<MicroLesson>> lessonsAsync;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return lessonsAsync.when(
      loading: () => const _LessonsLoading(),
      error: (error, _) => _TabError(onRetry: onRetry),
      data: (lessons) {
        if (lessons.isEmpty) return _LessonsEmpty();
        return ListView.separated(
          padding: const EdgeInsets.all(AppDimensions.spaceMd),
          itemCount: lessons.length,
          separatorBuilder: (_, _) =>
              const SizedBox(height: AppDimensions.spaceSm),
          itemBuilder: (context, index) => _LessonCard(
            lesson: lessons[index],
            onRetry: onRetry,
          ),
        );
      },
    );
  }
}

/// Карточка микро-урока.
class _LessonCard extends ConsumerWidget {
  const _LessonCard({required this.lesson, required this.onRetry});

  final MicroLesson lesson;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
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
          Row(
            children: [
              // Длительность
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: context.palette.surfaceElevated,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                ),
                child: Text(
                  l10n.learnLessonDuration(lesson.durationSeconds),
                  style: AppTextStyles.labelMedium,
                ),
              ),
              if (lesson.biasTag != null) ...[
                const SizedBox(width: AppDimensions.spaceXs),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: context.palette.primaryContainer,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusFull,
                    ),
                  ),
                  child: Text(
                    lesson.biasTag!,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: context.palette.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
              const Spacer(),
              if (lesson.completed)
                Icon(Icons.check_circle, color: context.palette.primary, size: 20),
            ],
          ),
          const SizedBox(height: AppDimensions.spaceSm),
          Text(
            lesson.title,
            style: AppTextStyles.titleMedium,
          ),
          if (lesson.description != null) ...[
            const SizedBox(height: AppDimensions.spaceXs),
            Text(
              lesson.description!,
              style: AppTextStyles.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: AppDimensions.spaceMd),
          Row(
            children: [
              _LessonActionButton(
                label: lesson.completed
                    ? l10n.learnLessonCompleted
                    : l10n.learnLessonStart,
                icon: lesson.completed
                    ? Icons.check_circle
                    : Icons.play_arrow,
                isActive: !lesson.completed,
                onPressed: lesson.completed
                    ? null
                    : () => _openLessonSheet(context, ref),
              ),
              const SizedBox(width: AppDimensions.spaceSm),
              _LessonActionButton(
                label: l10n.learnLessonDiscuss,
                icon: Icons.chat_bubble_outline,
                isActive: true,
                onPressed: () => context.go('/coach', extra: lesson),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _openLessonSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.palette.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) => _LessonDetailSheet(
        lesson: lesson,
        onComplete: () {
          Navigator.pop(sheetContext);
          ref.read(learningRepositoryProvider).completeLesson(lesson.id);
          ref.invalidate(recommendedLessonsProvider);
        },
      ),
    );
  }
}

/// Кнопка действия в карточке урока.
class _LessonActionButton extends StatelessWidget {
  const _LessonActionButton({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? context.palette.primary : context.palette.textSecondary;
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spaceSm,
            vertical: AppDimensions.spaceXs,
          ),
          decoration: BoxDecoration(
            color: isActive
                ? context.palette.primaryContainer
                : context.palette.surfaceElevated,
            borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  style: AppTextStyles.labelLarge.copyWith(color: color),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Loading: shimmer-скелетоны.
class _LessonsLoading extends StatelessWidget {
  const _LessonsLoading();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      itemCount: 3,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: AppDimensions.spaceSm),
        child: ShimmerSkeleton(child: const _LessonGhost()),
      ),
    );
  }
}

class _LessonGhost extends StatelessWidget {
  const _LessonGhost();

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
          _GhostBar(width: 60, height: 10),
          SizedBox(height: AppDimensions.spaceSm),
          _GhostBar(width: double.infinity, height: 16),
          SizedBox(height: AppDimensions.spaceXs),
          _GhostBar(width: double.infinity, height: 12),
          SizedBox(height: AppDimensions.spaceMd),
          Row(children: [
            _GhostBar(width: 80, height: 28),
            SizedBox(width: 8),
            _GhostBar(width: 100, height: 28),
          ]),
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
class _LessonsEmpty extends StatelessWidget {
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
              Icons.school_outlined,
              color: context.palette.textSecondary,
              size: 40,
            ),
            const SizedBox(height: AppDimensions.spaceMd),
            Text(
              l10n.learnNoLessons,
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
class _TabError extends StatelessWidget {
  const _TabError({required this.onRetry});

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

/// Bottom sheet с контентом микро-урока.
class _LessonDetailSheet extends StatelessWidget {
  const _LessonDetailSheet({required this.lesson, required this.onComplete});

  final MicroLesson lesson;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spaceLg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: context.palette.outline,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.spaceLg),
              // Метка длительности + bias
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: context.palette.surfaceElevated,
                      borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                    ),
                    child: Text(
                      l10n.learnLessonDuration(lesson.durationSeconds),
                      style: AppTextStyles.labelMedium,
                    ),
                  ),
                  if (lesson.biasTag != null) ...[
                    const SizedBox(width: AppDimensions.spaceXs),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: context.palette.primaryContainer,
                        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                      ),
                      child: Text(
                        lesson.biasTag!,
                        style: AppTextStyles.labelMedium
                            .copyWith(color: context.palette.primary),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: AppDimensions.spaceMd),
              // Заголовок
              Text(
                lesson.title,
                style: AppTextStyles.titleLarge,
              ),
              const SizedBox(height: AppDimensions.spaceMd),
              // Контент урока
              if (lesson.description != null)
                Text(
                  lesson.description!,
                  style: AppTextStyles.bodyLarge
                      .copyWith(color: context.palette.textSecondary),
                ),
              const SizedBox(height: AppDimensions.spaceXl),
              // Кнопка завершения
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: onComplete,
                  style: FilledButton.styleFrom(
                    backgroundColor: context.palette.primary,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                    ),
                  ),
                  child: Text(
                    l10n.learnLessonComplete,
                    style: AppTextStyles.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
