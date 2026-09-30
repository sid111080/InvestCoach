import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../domain/entities/user_preferences.dart';

part 'onboarding_flow_state.freezed.dart';

/// Состояние онбординг-флоу (5 шагов).
///
/// Все ответы пользователя собираются в [UserPreferences]
/// и на финальном шаге уходят в `PATCH /users/preferences`.
@freezed
sealed class OnboardingFlowState with _$OnboardingFlowState {
  const factory OnboardingFlowState({
    /// Текущий шаг: 0 — приветствие, 1 — имя, 2 — опыт,
    /// 3 — цели, 4 — риск + стиль общения.
    @Default(0) int step,

    /// Введённое на шаге 1 имя (trim-ится перед отправкой).
    @Default('') String name,

    /// Ответ шага 2.
    @Default(ExperienceLevel.beginner) ExperienceLevel experienceLevel,

    /// Ответ шага 3 (мультивыбор).
    @Default(<MainGoal>[]) List<MainGoal> mainGoals,

    /// Ответ шага 4.
    @Default(RiskTolerance.moderate) RiskTolerance riskTolerance,

    /// Ответ шага 4.
    @Default(CommunicationStyle.detailed) CommunicationStyle
    communicationStyle,

    /// В полёте запрос «создать аккаунт» (`POST /auth/firebase`).
    @Default(false) bool creatingAccount,

    /// Финальный этап: «создаём Coach» (анимация + сохранение).
    @Default(false) bool creatingCoach,

    /// Онбординг завершён: локальный флаг выставлен, роутер
    /// перенаправляет на главный экран.
    @Default(false) bool completed,

    /// Сбой последнего запроса (показывается с кнопкой «Повторить»).
    AppException? error,
  }) = _OnboardingFlowState;
}
