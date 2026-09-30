import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences.freezed.dart';
part 'user_preferences.g.dart';

/// Уровень опыта пользователя (ответ на шаг 3 онбординга).
enum ExperienceLevel {
  @JsonValue('beginner')
  beginner,

  @JsonValue('intermediate')
  intermediate,

  @JsonValue('advanced')
  advanced,
}

/// Цели обучения (мультивыбор на шаге 4 онбординга).
enum MainGoal {
  @JsonValue('market_understanding')
  marketUnderstanding,

  @JsonValue('bias_control')
  biasControl,

  @JsonValue('portfolio_management')
  portfolioManagement,

  @JsonValue('regular_saving')
  regularSaving,
}

/// Отношение к риску (шаг 5 онбординга).
enum RiskTolerance {
  @JsonValue('conservative')
  conservative,

  @JsonValue('moderate')
  moderate,

  @JsonValue('aggressive')
  aggressive,
}

/// Стиль общения Coach (шаг 5 онбординга,
/// далее меняется в Профиль → «Мой Coach»).
enum CommunicationStyle {
  @JsonValue('detailed')
  detailed,

  @JsonValue('concise')
  concise,
}

/// Предпочтения пользователя — собираются в онбординге,
/// передаются в `PATCH /users/preferences`.
@freezed
sealed class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @Default(ExperienceLevel.beginner) ExperienceLevel experienceLevel,
    @Default(<MainGoal>[]) List<MainGoal> mainGoals,
    @Default(RiskTolerance.moderate) RiskTolerance riskTolerance,
    CommunicationStyle? communicationStyle,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}
