/// Сервис push-уведомлений (FCM).
///
/// Регистрация токена, обработка входящих уведомлений,
/// управление разрешениями.
abstract interface class NotificationService {
  /// Инициализация: запрос разрешения + регистрация FCM-токена.
  Future<void> initialize();

  /// Текущий FCM-токен (null до регистрации).
  String? get token;

  /// Поток новых FCM-токенов (ротация).
  Stream<String> get tokenStream;

  /// Обработчик уведомления при открытии приложения (foreground tap).
  set onNotificationTapped(void Function(Map<String, String>) callback);

  /// Включить/выключить уведомления по категории.
  Future<void> setCategoryEnabled(String category, bool enabled);

  /// Включены ли уведомления по категории.
  bool isCategoryEnabled(String category);
}
