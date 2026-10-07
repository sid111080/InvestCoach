import '../entities/app_user.dart';
import '../entities/subscription_status.dart';
import '../entities/user_preferences.dart';
import '../entities/user_stats.dart';

/// Профиль: статистика, подписка, настройка Coach.
///
/// - `GET /users/me` — полная информация + статистика.
/// - `GET /subscription/status` — тариф и лимиты.
/// - `POST /subscription/upgrade` — инициация покупки.
/// - `PATCH /users/coach-style` — смена стиля общения.
abstract interface class ProfileRepository {
  /// Статистика пользователя за 30 дней.
  Future<UserStats> fetchStats();

  /// Текущий статус подписки и лимиты.
  Future<SubscriptionStatus> fetchSubscriptionStatus();

  /// Инициирует покупку подписки через RevenueCat.
  Future<void> upgradeSubscription(UserTier tier);

  /// Обновляет стиль общения Coach.
  Future<void> updateCoachStyle(CommunicationStyle style);
}
