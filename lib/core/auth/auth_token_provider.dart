/// Источник ID Token Firebase для запросов к backend
/// (заголовок `Authorization: Bearer`).
///
/// Реализация через `firebase_auth` появится в Спринте 2 (онбординг
/// создаёт аккаунт). Пока — заглушка: запросы идут без Authorization,
/// приложение работает в mock-режиме.
abstract interface class AuthTokenProvider {
  /// Текущий токен или `null`, если пользователь не авторизован.
  Future<String?> token();
}

/// Заглушка до реализации онбординга (Спринт 1, задача 2).
final class NoOpAuthTokenProvider implements AuthTokenProvider {
  const NoOpAuthTokenProvider();

  @override
  Future<String?> token() async => null;
}
