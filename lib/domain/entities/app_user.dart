import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_preferences.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

/// Тариф пользователя.
enum UserTier {
  @JsonValue('free')
  free,

  @JsonValue('news_plus')
  newsPlus,

  @JsonValue('pro')
  pro,
}

/// Пользователь приложения (создаётся в онбординге
/// через `POST /auth/firebase`, читается через `GET /users/me`).
@freezed
sealed class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String name,
    @Default(UserTier.free) UserTier tier,
    required DateTime createdAt,
    UserPreferences? preferences,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
