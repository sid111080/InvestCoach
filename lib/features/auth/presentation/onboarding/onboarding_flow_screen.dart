import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/debug/debug_flags.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import 'onboarding_flow_notifier.dart';
import 'onboarding_flow_pages.dart';
import 'onboarding_flow_state.dart';

/// Онбординг — 5 шагов (ТЗ: не более 90 секунд):
///
/// 1. «Познакомься с Coach»
/// 2. Имя → создание аккаунта (`POST /auth/firebase`)
/// 3. Опыт
/// 4. Цели (мультивыбор)
/// 5. Риск + стиль общения → «Создаём Coach» (≥ 2 с) →
///    `PATCH /users/preferences` + локальный флаг → главный экран
///
/// Переход на главный экран делает GoRouter сам: флаг
/// «онбординг пройден» — его `refreshListenable`.
class OnboardingFlowScreen extends ConsumerStatefulWidget {
  const OnboardingFlowScreen({super.key});

  @override
  ConsumerState<OnboardingFlowScreen> createState() =>
      _OnboardingFlowScreenState();
}

class _OnboardingFlowScreenState
    extends ConsumerState<OnboardingFlowScreen>
    with SingleTickerProviderStateMixin {
  /// «Дыхание» аватара на приветствии и при создании Coach.
  ///
  /// В widget-тестах не запускается: бесконечная анимация
  /// не даёт `pumpAndSettle` стабилизироваться.
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  );

  @override
  void initState() {
    super.initState();
    if (!debugIsInFlutterTest) _pulse.repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(onboardingFlowProvider);
    final notifier = ref.read(onboardingFlowProvider.notifier);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {},
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spaceMd,
                  vertical: AppDimensions.spaceXs,
                ),
                child: Row(
                  children: [
                    if (state.step > 0 &&
                        !state.creatingCoach &&
                        !state.completed)
                      IconButton(
                        key: const Key('onboardingBack'),
                        icon: const Icon(Icons.arrow_back),
                        onPressed: notifier.goBack,
                        tooltip: l10n.onbBack,
                      )
                    else
                      SizedBox(
                        width: AppDimensions.minTapTarget,
                        height: AppDimensions.minTapTarget,
                      ),
                    const Spacer(),
                    Text(
                      l10n.onbStep(
                        state.creatingCoach || state.completed
                            ? kOnboardingTotalSteps
                            : state.step + 1,
                        kOnboardingTotalSteps,
                      ),
                      style: AppTextStyles.labelMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: _page(
                    state,
                    notifier,
                    key: ValueKey(
                      state.creatingCoach || state.completed
                          ? 'creating'
                          : 'step_${state.step}',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Содержимое шага.
  Widget _page(
    OnboardingFlowState state,
    OnboardingFlowNotifier notifier, {
    required Key key,
  }) {
    if (state.creatingCoach || state.completed) {
      return OnboardingCreatingPage(key: key, pulse: _pulse);
    }
    return switch (state.step) {
      0 => OnboardingWelcomePage(
          key: key,
          pulse: _pulse,
          onStart: notifier.start,
        ),
      1 => OnboardingNamePage(
          key: key,
          name: state.name,
          creatingAccount: state.creatingAccount,
          error: state.error,
          onNameChanged: notifier.setName,
          onSubmit: notifier.submitName,
        ),
      2 => OnboardingExperiencePage(
          key: key,
          experienceLevel: state.experienceLevel,
          onSelect: notifier.selectExperience,
          onNext: notifier.advance,
        ),
      3 => OnboardingGoalsPage(
          key: key,
          goals: state.mainGoals,
          onToggle: notifier.toggleGoal,
          onNext: notifier.advance,
        ),
      _ => OnboardingRiskStylePage(
          key: key,
          riskTolerance: state.riskTolerance,
          communicationStyle: state.communicationStyle,
          error: state.error,
          onSelectRisk: notifier.selectRisk,
          onSelectStyle: notifier.selectStyle,
          onCreate: notifier.createCoach,
        ),
    };
  }
}
