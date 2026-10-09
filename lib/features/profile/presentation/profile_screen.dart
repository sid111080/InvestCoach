import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/repository_providers.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/theme_palette.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../domain/entities/app_user.dart';
import '../../../domain/entities/subscription_status.dart';
import '../../../domain/entities/user_preferences.dart';
import '../../../domain/entities/user_stats.dart';
import '../../../domain/services/notification_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/shimmer_skeleton.dart';

/// Экран «Профиль» — header, статистика, стиль Coach, тарифы.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);
    final statsAsync = ref.watch(userStatsProvider);
    final subAsync = ref.watch(subscriptionStatusProvider);

    return Scaffold(
      backgroundColor: context.palette.background,
      body: RefreshIndicator(
        color: context.palette.primary,
        backgroundColor: context.palette.surface,
        onRefresh: () async {
          ref.invalidate(userStatsProvider);
          ref.invalidate(subscriptionStatusProvider);
        },
        child: ListView(
          padding: const EdgeInsets.all(AppDimensions.spaceMd),
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            // Header
            userAsync.when(
              loading: () => const _ProfileHeaderGhost(),
              error: (_, _) => const SizedBox.shrink(),
              data: (user) => user == null
                  ? const _ProfileHeaderGhost()
                  : _ProfileHeader(user: user),
            ),
            const SizedBox(height: AppDimensions.spaceLg),

            // Статистика
            statsAsync.when(
              loading: () => const _StatsGhost(),
              error: (error, _) => _SectionError(
                onRetry: () => ref.invalidate(userStatsProvider),
              ),
              data: (stats) => _StatsSection(stats: stats),
            ),
            const SizedBox(height: AppDimensions.spaceLg),

            // Лимиты + апгрейд
            subAsync.when(
              loading: () => const _SubscriptionGhost(),
              error: (error, _) => _SectionError(
                onRetry: () => ref.invalidate(subscriptionStatusProvider),
              ),
              data: (sub) => _SubscriptionSection(subscription: sub),
            ),
            const SizedBox(height: AppDimensions.spaceLg),

            // Мой Coach
            const _CoachStyleSection(),
            const SizedBox(height: AppDimensions.spaceLg),

            // Push-уведомления
            const _PushSection(),
            const SizedBox(height: AppDimensions.spaceLg),

            // Тема интерфейса
            const _ThemeSection(),
            const SizedBox(height: AppDimensions.spaceLg),

            // О приложении
            const _AboutSection(),
          ],
        ),
      ),
    );
  }
}

/// Header: аватар, имя, бейдж тарифа.
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.user});

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tierLabel = switch (user.tier) {
      UserTier.free => l10n.profileTierFree,
      UserTier.newsPlus => l10n.profileTierNewsPlus,
      UserTier.pro => l10n.profileTierPro,
    };
    final tierColor = switch (user.tier) {
      UserTier.free => context.palette.textSecondary,
      UserTier.newsPlus => context.palette.primary,
      UserTier.pro => context.palette.warning,
    };

    return Row(
      children: [
        // Аватар
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.palette.primaryContainer,
          ),
          child: Center(
            child: Text(
              user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
              style: AppTextStyles.display.copyWith(
                fontSize: 28,
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
                user.name,
                style: AppTextStyles.titleLarge,
              ),
              const SizedBox(height: AppDimensions.spaceXs),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: tierColor.withAlpha(30),
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusFull,
                  ),
                  border: Border.all(color: tierColor.withAlpha(80)),
                ),
                child: Text(
                  tierLabel,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: tierColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileHeaderGhost extends StatelessWidget {
  const _ProfileHeaderGhost();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShimmerSkeleton(
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.palette.surface,
            ),
          ),
        ),
        const SizedBox(width: AppDimensions.spaceMd),
        ShimmerSkeleton(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _GhostBar(width: 100, height: 18),
              const SizedBox(height: 8),
              _GhostBar(width: 60, height: 14),
            ],
          ),
        ),
      ],
    );
  }
}

/// Секция статистики за 30 дней.
class _StatsSection extends StatelessWidget {
  const _StatsSection({required this.stats});

  final UserStats stats;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.profileStats30,
          style: AppTextStyles.titleLarge,
        ),
        const SizedBox(height: AppDimensions.spaceMd),
        Row(
          children: [
            Expanded(
              child: _StatTile(
                icon: Icons.local_fire_department,
                iconColor: context.palette.warning,
                label: l10n.profileStreak,
                value: l10n.profileStreakValue(stats.currentStreak),
              ),
            ),
            const SizedBox(width: AppDimensions.spaceSm),
            Expanded(
              child: _StatTile(
                icon: Icons.trending_up,
                iconColor: context.palette.primary,
                label: l10n.profileAvgInteractions,
                value: l10n.profileAvgValue(
                  stats.avgInteractionsPerDay.round(),
                ),
              ),
            ),
          ],
        ),
        if (stats.topTopics.isNotEmpty) ...[
          const SizedBox(height: AppDimensions.spaceMd),
          Text(
            l10n.profileTopTopics,
            style: AppTextStyles.titleSmall,
          ),
          const SizedBox(height: AppDimensions.spaceXs),
          Wrap(
            spacing: AppDimensions.spaceXs,
            runSpacing: AppDimensions.spaceXs,
            children: [
              for (final topic in stats.topTopics)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: context.palette.surfaceElevated,
                    borderRadius: BorderRadius.circular(
                      AppDimensions.radiusFull,
                    ),
                  ),
                  child: Text(
                    topic,
                    style: AppTextStyles.labelLarge,
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
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
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      decoration: BoxDecoration(
        color: context.palette.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: context.palette.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(height: AppDimensions.spaceXs),
          Text(
            value,
            style: AppTextStyles.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.labelSmall,
          ),
        ],
      ),
    );
  }
}

/// Секция подписки + апгрейд.
class _SubscriptionSection extends ConsumerWidget {
  const _SubscriptionSection({required this.subscription});

  final SubscriptionStatus subscription;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final isFree = subscription.tier == UserTier.free;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Лимиты
        if (isFree)
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
                  Icons.chat_bubble_outline,
                  color: context.palette.textSecondary,
                  size: 20,
                ),
                const SizedBox(width: AppDimensions.spaceSm),
                Expanded(
                  child: Text(
                    l10n.profilePullLeft(
                      subscription.pullRequestsLeft,
                      subscription.pullRequestsLimit,
                    ),
                    style: AppTextStyles.bodySmall,
                  ),
                ),
              ],
            ),
          ),

        // Кнопка апгрейда (только для Free)
        if (isFree) ...[
          const SizedBox(height: AppDimensions.spaceMd),
          Container(
            padding: const EdgeInsets.all(AppDimensions.spaceLg),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [context.palette.primaryContainer, context.palette.surface],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.radiusXl),
              border: Border.all(color: context.palette.primary.withAlpha(60)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.profileUpgradeTitle,
                  style: AppTextStyles.titleLarge.copyWith(
                    color: context.palette.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: AppDimensions.spaceXs),
                Text(
                  l10n.profileUpgradeText,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: context.palette.textSecondary,
                  ),
                ),
                const SizedBox(height: AppDimensions.spaceMd),
                // Фичи
                _UpgradeFeature(
                  icon: Icons.check_circle_outline,
                  label: l10n.profileFeatureUnlimited,
                ),
                const SizedBox(height: AppDimensions.spaceXs),
                _UpgradeFeature(
                  icon: Icons.check_circle_outline,
                  label: l10n.profileFeatureLessons,
                ),
                const SizedBox(height: AppDimensions.spaceXs),
                _UpgradeFeature(
                  icon: Icons.check_circle_outline,
                  label: l10n.profileFeaturePriority,
                ),
                const SizedBox(height: AppDimensions.spaceMd),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final service =
                          ref.read(subscriptionServiceProvider);
                      await service.purchase(UserTier.newsPlus);
                      // Синхронизируем статус с backend.
                      await ref
                          .read(profileRepositoryProvider)
                          .upgradeSubscription(UserTier.newsPlus);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.palette.primary,
                      foregroundColor: context.palette.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusMd,
                        ),
                      ),
                    ),
                    child: Text(
                      l10n.profileUpgradeButton,
                      style: AppTextStyles.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _UpgradeFeature extends StatelessWidget {
  const _UpgradeFeature({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: context.palette.onPrimaryContainer),
        const SizedBox(width: AppDimensions.spaceXs),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: context.palette.onPrimaryContainer,
          ),
        ),
      ],
    );
  }
}

/// Секция «Мой Coach» — выбор стиля общения.
class _CoachStyleSection extends ConsumerStatefulWidget {
  const _CoachStyleSection();

  @override
  ConsumerState<_CoachStyleSection> createState() =>
      _CoachStyleSectionState();
}

class _CoachStyleSectionState extends ConsumerState<_CoachStyleSection> {
  CommunicationStyle? _selectedStyle;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    // Загружаем текущий стиль из предпочтений
    _loadCurrentStyle();
  }

  void _loadCurrentStyle() {
    final user = ref.read(currentUserProvider).value;
    _selectedStyle = user?.preferences?.communicationStyle;
  }

  Future<void> _selectStyle(CommunicationStyle style) async {
    setState(() {
      _selectedStyle = style;
      _saving = true;
    });
    try {
      await ref.read(profileRepositoryProvider).updateCoachStyle(style);
    } finally {
      if (mounted) {
        setState(() => _saving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).profileStyleSaved),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            width: 200,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.profileMyCoach,
          style: AppTextStyles.titleLarge,
        ),
        const SizedBox(height: AppDimensions.spaceXs),
        Text(
          l10n.profileStyleTitle,
          style: AppTextStyles.labelMedium,
        ),
        const SizedBox(height: AppDimensions.spaceSm),
        _StyleOption(
          label: l10n.profileStyleDetailed,
          isSelected: _selectedStyle == CommunicationStyle.detailed,
          isSaving: _saving,
          onTap: () => _selectStyle(CommunicationStyle.detailed),
        ),
        const SizedBox(height: AppDimensions.spaceXs),
        _StyleOption(
          label: l10n.profileStyleConcise,
          isSelected: _selectedStyle == CommunicationStyle.concise,
          isSaving: _saving,
          onTap: () => _selectStyle(CommunicationStyle.concise),
        ),
      ],
    );
  }
}

class _StyleOption extends StatelessWidget {
  const _StyleOption({
    required this.label,
    required this.isSelected,
    required this.isSaving,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final bool isSaving;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSaving ? null : onTap,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.spaceMd),
        decoration: BoxDecoration(
          color: isSelected ? context.palette.primaryContainer : context.palette.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          border: Border.all(
            color: isSelected ? context.palette.primary : context.palette.outline,
          ),
        ),
        child: Row(
          children: [
            if (isSelected)
              Icon(Icons.check_circle, color: context.palette.primary, size: 20)
            else
              Icon(
                Icons.radio_button_unchecked,
                color: context.palette.textSecondary,
                size: 20,
              ),
            const SizedBox(width: AppDimensions.spaceSm),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isSelected
                      ? context.palette.onPrimaryContainer
                      : context.palette.textPrimary,
                ),
              ),
            ),
            if (isSaving)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
          ],
        ),
      ),
    );
  }
}

/// Секция push-уведомлений.
class _PushSection extends ConsumerWidget {
  const _PushSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final service = ref.watch(notificationServiceProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.profilePushTitle,
          style: AppTextStyles.titleLarge,
        ),
        const SizedBox(height: AppDimensions.spaceSm),
        Container(
          decoration: BoxDecoration(
            color: context.palette.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            border: Border.all(color: context.palette.outline),
          ),
          child: Column(
            children: [
              _PushToggleRow(
                label: l10n.profilePushDaily,
                category: 'daily_news',
                service: service,
              ),
              Divider(height: 1, indent: 16, color: context.palette.outline),
              _PushToggleRow(
                label: l10n.profilePushReview,
                category: 'weekly_review',
                service: service,
              ),
              Divider(height: 1, indent: 16, color: context.palette.outline),
              _PushToggleRow(
                label: l10n.profilePushLesson,
                category: 'new_lesson',
                service: service,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PushToggleRow extends StatefulWidget {
  const _PushToggleRow({
    required this.label,
    required this.category,
    required this.service,
  });

  final String label;
  final String category;
  final NotificationService service;

  @override
  State<_PushToggleRow> createState() => _PushToggleRowState();
}

class _PushToggleRowState extends State<_PushToggleRow> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.service.isCategoryEnabled(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMd,
        vertical: AppDimensions.spaceXs,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.label,
              style: AppTextStyles.bodyMedium,
            ),
          ),
          Switch(
            value: _value,
            activeThumbColor: context.palette.primary,
            onChanged: (v) async {
              setState(() => _value = v);
              await widget.service.setCategoryEnabled(widget.category, v);
            },
          ),
        ],
      ),
    );
  }
}

/// Секция «О приложении».
class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.profileAbout,
          style: AppTextStyles.titleLarge,
        ),
        const SizedBox(height: AppDimensions.spaceSm),
        Container(
          padding: const EdgeInsets.all(AppDimensions.spaceMd),
          decoration: BoxDecoration(
            color: context.palette.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            border: Border.all(color: context.palette.outline),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.profileAboutVersion('1.0.0'),
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: AppDimensions.spaceSm),
              Text(
                l10n.profileAboutDisclaimer,
                style: AppTextStyles.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Ghost-скелетон статистики.
class _StatsGhost extends StatelessWidget {
  const _StatsGhost();

  @override
  Widget build(BuildContext context) {
    return ShimmerSkeleton(
      child: Row(
        children: [
          Expanded(child: _GhostCard()),
          const SizedBox(width: AppDimensions.spaceSm),
          Expanded(child: _GhostCard()),
        ],
      ),
    );
  }
}

class _GhostCard extends StatelessWidget {
  const _GhostCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      decoration: BoxDecoration(
        color: context.palette.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: context.palette.outline),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 20, height: 20),
          SizedBox(height: 8),
          _GhostBar(width: 80, height: 16),
          SizedBox(height: 4),
          _GhostBar(width: 60, height: 10),
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

/// Ghost-скелетон подписки.
class _SubscriptionGhost extends StatelessWidget {
  const _SubscriptionGhost();

  @override
  Widget build(BuildContext context) {
    return ShimmerSkeleton(
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.spaceMd),
        decoration: BoxDecoration(
          color: context.palette.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          border: Border.all(color: context.palette.outline),
        ),
        child: const Row(
          children: [
            SizedBox(width: 20, height: 20),
            SizedBox(width: 8),
            Expanded(child: _GhostBar(width: double.infinity, height: 14)),
          ],
        ),
      ),
    );
  }
}

/// Ошибка секции.
class _SectionError extends StatelessWidget {
  const _SectionError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      decoration: BoxDecoration(
        color: context.palette.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: context.palette.error.withAlpha(60)),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: context.palette.error, size: 20),
          const SizedBox(width: AppDimensions.spaceSm),
          Expanded(
            child: Text(
              l10n.somethingWentWrong,
              style: AppTextStyles.bodySmall,
            ),
          ),
          TextButton(
            onPressed: onRetry,
            child: Text(
              l10n.retry,
              style: AppTextStyles.labelMedium.copyWith(
                color: context.palette.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Секция «Тема интерфейса» — переключение между 5 палитрами.
class _ThemeSection extends ConsumerWidget {
  const _ThemeSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final currentPalette = ref.watch(themePaletteProvider);

    return Container(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      decoration: BoxDecoration(
        color: context.palette.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: context.palette.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.profileThemeSection,
            style: AppTextStyles.titleSmall
                .copyWith(color: context.palette.textPrimary),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.profileThemeHint,
            style: AppTextStyles.bodySmall
                .copyWith(color: context.palette.textSecondary),
          ),
          const SizedBox(height: AppDimensions.spaceMd),
          // Чипсы тем
          Wrap(
            spacing: AppDimensions.spaceXs,
            runSpacing: AppDimensions.spaceXs,
            children: [
              for (final palette in allPalettes)
                _ThemeChip(
                  palette: palette,
                  isSelected: palette.id == currentPalette.id,
                  onTap: () {
                    ref
                        .read(themePaletteProvider.notifier)
                        .setTheme(palette.id);
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Чип одной темы с цветным индикатором.
class _ThemeChip extends StatelessWidget {
  const _ThemeChip({
    required this.palette,
    required this.isSelected,
    required this.onTap,
  });

  final ThemePalette palette;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spaceMd,
          vertical: AppDimensions.spaceXs,
        ),
        decoration: BoxDecoration(
          color: isSelected ? palette.primaryContainer : context.palette.surfaceElevated,
          borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
          border: Border.all(
            color: isSelected ? palette.primary : context.palette.outline,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Цветной кружок
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: palette.primary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              palette.name,
              style: AppTextStyles.labelMedium
                  .copyWith(color: isSelected ? palette.onPrimaryContainer : context.palette.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
