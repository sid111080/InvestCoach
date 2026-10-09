import '../entities/app_user.dart';

/// Сервис подписки: управление покупками через RevenueCat.
///
/// Отвечает за инициализацию SDK, получение офферов,
/// покупку/восстановление и отслеживание entitlement.
abstract interface class SubscriptionService {
  /// Инициализация RevenueCat (вызывается один раз при старте).
  Future<void> initialize();

  /// Текущий тариф пользователя (из entitlement RevenueCat).
  UserTier get currentTier;

  /// Поток изменений тарифа (обновляется при покупке/отмене/истечении).
  Stream<UserTier> get tierChanged;

  /// Покупка тарифа. Возвращает `true` при успешной покупке.
  Future<bool> purchase(UserTier tier);

  /// Восстановление покупки.
  Future<void> restorePurchases();

  /// Активна ли подписка News+.
  bool get isNewsPlusActive;
}
