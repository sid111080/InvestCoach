import '../../domain/entities/app_user.dart';
import '../../domain/entities/subscription_status.dart';
import '../../domain/entities/user_preferences.dart';
import '../../domain/entities/user_stats.dart';
import '../../domain/repositories/profile_repository.dart';

/// Mock [ProfileRepository]: реалистичные данные профиля и подписки.
final class MockProfileRepository implements ProfileRepository {
  const MockProfileRepository({
    this.latency = const Duration(milliseconds: 500),
  });

  final Duration latency;

  @override
  Future<UserStats> fetchStats() async {
    await Future<void>.delayed(latency);
    return const UserStats(
      currentStreak: 12,
      avgInteractionsPerDay: 6.3,
      topTopics: ['Акции', 'Облигации', 'Дивиденды'],
      biasPatterns: ['FOMO', 'Loss Aversion'],
      activeDays: 23,
    );
  }

  @override
  Future<SubscriptionStatus> fetchSubscriptionStatus() async {
    await Future<void>.delayed(latency);
    return const SubscriptionStatus(
      tier: UserTier.free,
      pullRequestsLeft: 3,
      pullRequestsLimit: 8,
      newsPlusActive: false,
      canUpgradeTo: UserTier.newsPlus,
    );
  }

  @override
  Future<void> upgradeSubscription(UserTier tier) async {
    await Future<void>.delayed(latency);
  }

  @override
  Future<void> updateCoachStyle(CommunicationStyle style) async {
    await Future<void>.delayed(latency);
  }
}
