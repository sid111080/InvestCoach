// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    _UserPreferences(
      experienceLevel:
          $enumDecodeNullable(
            _$ExperienceLevelEnumMap,
            json['experienceLevel'],
          ) ??
          ExperienceLevel.beginner,
      mainGoals:
          (json['mainGoals'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$MainGoalEnumMap, e))
              .toList() ??
          const <MainGoal>[],
      riskTolerance:
          $enumDecodeNullable(_$RiskToleranceEnumMap, json['riskTolerance']) ??
          RiskTolerance.moderate,
      communicationStyle: $enumDecodeNullable(
        _$CommunicationStyleEnumMap,
        json['communicationStyle'],
      ),
    );

Map<String, dynamic> _$UserPreferencesToJson(
  _UserPreferences instance,
) => <String, dynamic>{
  'experienceLevel': _$ExperienceLevelEnumMap[instance.experienceLevel]!,
  'mainGoals': instance.mainGoals.map((e) => _$MainGoalEnumMap[e]!).toList(),
  'riskTolerance': _$RiskToleranceEnumMap[instance.riskTolerance]!,
  'communicationStyle':
      _$CommunicationStyleEnumMap[instance.communicationStyle],
};

const _$ExperienceLevelEnumMap = {
  ExperienceLevel.beginner: 'beginner',
  ExperienceLevel.intermediate: 'intermediate',
  ExperienceLevel.advanced: 'advanced',
};

const _$MainGoalEnumMap = {
  MainGoal.marketUnderstanding: 'market_understanding',
  MainGoal.biasControl: 'bias_control',
  MainGoal.portfolioManagement: 'portfolio_management',
  MainGoal.regularSaving: 'regular_saving',
};

const _$RiskToleranceEnumMap = {
  RiskTolerance.conservative: 'conservative',
  RiskTolerance.moderate: 'moderate',
  RiskTolerance.aggressive: 'aggressive',
};

const _$CommunicationStyleEnumMap = {
  CommunicationStyle.detailed: 'detailed',
  CommunicationStyle.concise: 'concise',
};
