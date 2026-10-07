import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/repository_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';
import 'tabs/cases_tab.dart';
import 'tabs/progress_tab.dart';
import 'tabs/reviews_tab.dart';
import 'tabs/today_tab.dart';

/// Экран «Обучение» — Top Tab Bar с 4 вкладками:
/// Сегодня / Weekly Reviews / Мои Кейсы / Прогресс.
class LearningScreen extends ConsumerStatefulWidget {
  const LearningScreen({super.key});

  @override
  ConsumerState<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends ConsumerState<LearningScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.primary,
            indicatorWeight: 2.5,
            labelStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Tab(text: l10n.learnTabToday),
              Tab(text: l10n.learnTabReviews),
              Tab(text: l10n.learnTabCases),
              Tab(text: l10n.learnTabProgress),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                _TodayTab(),
                _ReviewsTab(),
                _CasesTab(),
                _ProgressTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Вкладка «Сегодня».
class _TodayTab extends ConsumerWidget {
  const _TodayTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TodayTab(
      lessonsAsync: ref.watch(recommendedLessonsProvider),
      onRetry: () => ref.invalidate(recommendedLessonsProvider),
    );
  }
}

/// Вкладка «Weekly Reviews».
class _ReviewsTab extends ConsumerWidget {
  const _ReviewsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReviewsTab(
      currentAsync: ref.watch(currentReviewProvider),
      historyAsync: ref.watch(reviewHistoryProvider),
      onRetry: () {
        ref.invalidate(currentReviewProvider);
        ref.invalidate(reviewHistoryProvider);
      },
    );
  }
}

/// Вкладка «Мои Кейсы».
class _CasesTab extends ConsumerWidget {
  const _CasesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CasesTab(
      casesAsync: ref.watch(savedCasesProvider),
      onRetry: () => ref.invalidate(savedCasesProvider),
    );
  }
}

/// Вкладка «Прогресс».
class _ProgressTab extends ConsumerWidget {
  const _ProgressTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProgressTab(
      statsAsync: ref.watch(userStatsProvider),
      onRetry: () => ref.invalidate(userStatsProvider),
    );
  }
}
