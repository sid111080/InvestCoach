import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/providers/repository_providers.dart';
import '../../../../domain/entities/user_preferences.dart';
import 'onboarding_flow_state.dart';

/// Длительность анимации «Создаём Coach» (ТЗ: не менее 2 секунд).
const Duration kOnboardingCreatingDuration = Duration(seconds: 2);

/// Количество шагов онбординга (прогресс «Шаг X из 5»).
const int kOnboardingTotalSteps = 5;

/// Флоу онбординга: приветствие → имя → опыт → цели → риск + стиль.
final onboardingFlowProvider =
    NotifierProvider<OnboardingFlowNotifier, OnboardingFlowState>(
      OnboardingFlowNotifier.new,
    );

/// Логика онбординг-флоу.
///
/// Последовательность на финальном шаге:
/// анимация (≥ 2 с) → `PATCH /users/preferences`
/// → локальный флаг «онбординг пройден» → роутер показывает главный экран.
final class OnboardingFlowNotifier extends Notifier<OnboardingFlowState> {
  /// Длительность анимации создания Coach.
  ///
  /// Поле (не константа) — в юнит-тестах его можно сократить,
  /// не ожидая реальных двух секунд.
  Duration creatingDuration = kOnboardingCreatingDuration;

  @override
  OnboardingFlowState build() => const OnboardingFlowState();

  /// Собранное из ответов предпочтение (идёт в `PATCH /users/preferences`).
  UserPreferences get preferences => UserPreferences(
        experienceLevel: state.experienceLevel,
        mainGoals: List.of(state.mainGoals),
        riskTolerance: state.riskTolerance,
        communicationStyle: state.communicationStyle,
      );

  /// Имя корректно: не короче двух символов после trim.
  bool get nameIsValid => state.name.trim().length >= 2;

  /// Шаг «цели» позволяет продолжить.
  bool get goalsAreValid => state.mainGoals.isNotEmpty;

  /// Добро пожаловать → ввод имени.
  void start() {
    if (state.completed || state.creatingCoach || state.step != 0) return;
    state = state.copyWith(step: 1, error: null);
  }

  /// Имя → создание аккаунта (`POST /auth/firebase`) → опыт.
  Future<void> submitName() async {
    if (!nameIsValid || state.creatingAccount || state.creatingCoach) return;
    state = state.copyWith(creatingAccount: true, error: null);
    try {
      await ref.read(authRepositoryProvider).createAccount(state.name.trim());
      state = state.copyWith(step: 2, creatingAccount: false);
    } on AppException catch (error) {
      state = state.copyWith(creatingAccount: false, error: error);
    }
  }

  /// Поле имени — обновляется по мере ввода.
  void setName(String value) {
    if (value == state.name) return;
    state = state.copyWith(name: value, error: null);
  }

  /// Назад на предыдущий шаг.
  void goBack() {
    if (state.step <= 0 || state.creatingCoach || state.completed) return;
    state = state.copyWith(step: state.step - 1, error: null);
  }

  /// Прямой переход (свайп) — только на уже пройденные шаги.
  void moveToStep(int step) {
    if (step < 0 || step >= kOnboardingTotalSteps) return;
    if (step >= state.step || state.creatingCoach || state.completed) return;
    state = state.copyWith(step: step, error: null);
  }

  /// «Продолжить» на шагах опыта/целей.
  void advance() {
    if (state.creatingCoach || state.completed) return;
    if (state.step == 2) {
      state = state.copyWith(step: 3, error: null);
    } else if (state.step == 3) {
      if (!goalsAreValid) return;
      state = state.copyWith(step: 4, error: null);
    }
  }

  /// Шаг «опыт»: одинарный выбор.
  void selectExperience(ExperienceLevel level) {
    if (state.experienceLevel == level) return;
    state = state.copyWith(experienceLevel: level);
  }

  /// Шаг «цели»: мульти-выбор (добавить/убрать).
  void toggleGoal(MainGoal goal) {
    final goals = state.mainGoals.contains(goal)
        ? [for (final g in state.mainGoals) if (g != goal) g]
        : [...state.mainGoals, goal];
    state = state.copyWith(mainGoals: goals);
  }

  /// Шаг «риск»: одинарный выбор.
  void selectRisk(RiskTolerance tolerance) {
    if (state.riskTolerance == tolerance) return;
    state = state.copyWith(riskTolerance: tolerance);
  }

  /// Шаг «стиль общения»: одинарный выбор.
  void selectStyle(CommunicationStyle style) {
    if (state.communicationStyle == style) return;
    state = state.copyWith(communicationStyle: style);
  }

  /// Финал: создать Coach.
  ///
  /// Сначала отправляем предпочтения в backend, затем пишем
  /// локальный флаг. Если backend недоступен, флаг не ставим
  /// (в приложении остаётся онбординг, пользователь нажимает
  /// «Повторить»).
  Future<void> createCoach() async {
    if (state.creatingCoach || state.completed || !goalsAreValid) return;
    state = state.copyWith(creatingCoach: true, error: null);

    // Анимация — не менее 2 секунд (ТЗ), чтобы переход
    // не «мигал» даже при мгновенном backend.
    await Future<void>.delayed(creatingDuration);

    try {
      final userPreferences = preferences;
      await ref
          .read(authRepositoryProvider)
          .updatePreferences(userPreferences);
      await ref.read(onboardingStateRepositoryProvider).complete(
            userName: state.name.trim(),
            preferences: userPreferences,
          );
      state = state.copyWith(completed: true, creatingCoach: false);

      // Флаг слушает этот провайдер: после invalidate он
      // перечитает SharedPreferences, и GoRouter сам перенаправит
      // на главный экран (см. OnboardingStateFlag).
      ref.invalidate(onboardingCompletedProvider);
    } on AppException catch (error) {
      state = state.copyWith(creatingCoach: false, error: error);
    }
  }
}
