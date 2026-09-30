import '../entities/app_user.dart';
import '../entities/user_preferences.dart';

/// Авторизация и профиль пользователя.
///
/// - [createAccount] — `POST /auth/firebase` (экран «Имя» онбординга).
/// - [updatePreferences] — `PATCH /users/preferences` (последний шаг
///   онбординга, далее — Профиль → Настройки Coach).
abstract interface class AuthRepository {
  /// Создаёт (или восстанавливает) пользователя по имени.
  ///
  /// В реальном режиме токен Firebase подставляет Dio-интерцептор;
  /// в mock-режиме — локальный аккаунт.
  Future<AppUser> createAccount(String name);

  /// Обновляет предпочтения Coach.
  ///
  /// Бросает [AppException] (типизированный сбой) при ошибке.
  Future<UserPreferences> updatePreferences(UserPreferences preferences);

  /// Текущий пользователь (`GET /users/me`).
  ///
  /// `null` — аккаунт ещё не создан (первый запуск до онбординга).
  Future<AppUser?> fetchMe();
}
