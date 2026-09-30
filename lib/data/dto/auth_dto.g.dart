// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponseDto _$AuthResponseDtoFromJson(Map<String, dynamic> json) =>
    _AuthResponseDto(
      success: json['success'] as bool? ?? false,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$AuthResponseDtoToJson(_AuthResponseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'user': instance.user,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

_UserDto _$UserDtoFromJson(Map<String, dynamic> json) => _UserDto(
  id: json['id'] as String,
  name: json['name'] as String,
  tier: json['tier'] as String? ?? 'free',
  createdAt: DateTime.parse(json['createdAt'] as String),
  preferences: json['preferences'] == null
      ? null
      : UserPreferencesDto.fromJson(
          json['preferences'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$UserDtoToJson(_UserDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'tier': instance.tier,
  'createdAt': instance.createdAt.toIso8601String(),
  'preferences': instance.preferences,
};

_UserPreferencesDto _$UserPreferencesDtoFromJson(Map<String, dynamic> json) =>
    _UserPreferencesDto(
      experienceLevel: json['experienceLevel'] as String? ?? 'beginner',
      mainGoals:
          (json['mainGoals'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      riskTolerance: json['riskTolerance'] as String? ?? 'moderate',
      communicationStyle: json['communicationStyle'] as String?,
    );

Map<String, dynamic> _$UserPreferencesDtoToJson(_UserPreferencesDto instance) =>
    <String, dynamic>{
      'experienceLevel': instance.experienceLevel,
      'mainGoals': instance.mainGoals,
      'riskTolerance': instance.riskTolerance,
      'communicationStyle': instance.communicationStyle,
    };
