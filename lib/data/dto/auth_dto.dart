import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

/// Тело `POST /auth/firebase` (response 200).
@freezed
sealed class AuthResponseDto with _$AuthResponseDto {
  const factory AuthResponseDto({
    @Default(false) bool success,
    required UserDto user,
    String? accessToken,
    String? refreshToken,
  }) = _AuthResponseDto;

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDtoFromJson(json);
}

/// Пользователь в ответе backend.
///
/// Поля-перечисления хранятся как строки: backend может вернуть
/// неизвестное значение — маппинг (см. [lib/data/mappers/auth_mapper.dart])
/// использует дефолты вместо падения.
@freezed
sealed class UserDto with _$UserDto {
  const factory UserDto({
    required String id,
    required String name,
    @Default('free') String tier,
    required DateTime createdAt,
    UserPreferencesDto? preferences,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

/// `preferences` пользователя в ответе backend.
@freezed
sealed class UserPreferencesDto with _$UserPreferencesDto {
  const factory UserPreferencesDto({
    @Default('beginner') String experienceLevel,
    @Default(<String>[]) List<String> mainGoals,
    @Default('moderate') String riskTolerance,
    String? communicationStyle,
  }) = _UserPreferencesDto;

  factory UserPreferencesDto.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesDtoFromJson(json);
}
