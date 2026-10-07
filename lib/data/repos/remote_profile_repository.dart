import '../../core/network/api_client.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/entities/subscription_status.dart';
import '../../domain/entities/user_preferences.dart';
import '../../domain/entities/user_stats.dart';
import '../../domain/repositories/profile_repository.dart';

/// Реальная реализация [ProfileRepository] поверх REST API.
final class RemoteProfileRepository implements ProfileRepository {
  const RemoteProfileRepository(this._api);

  final ApiClient _api;

  @override
  Future<UserStats> fetchStats() async {
    try {
      final response = await _api.dio.get('/users/me');
      final data = response.data as Map<String, dynamic>;
      final stats = data['stats'] as Map<String, dynamic>?;
      if (stats == null) {
        return const UserStats();
      }
      return UserStats.fromJson(stats);
    } catch (error) {
      throw _api.toAppException(error);
    }
  }

  @override
  Future<SubscriptionStatus> fetchSubscriptionStatus() async {
    try {
      final response = await _api.dio.get('/subscription/status');
      return SubscriptionStatus.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (error) {
      throw _api.toAppException(error);
    }
  }

  @override
  Future<void> upgradeSubscription(UserTier tier) async {
    try {
      await _api.dio.post(
        '/subscription/upgrade',
        data: {'plan': tier.name},
      );
    } catch (error) {
      throw _api.toAppException(error);
    }
  }

  @override
  Future<void> updateCoachStyle(CommunicationStyle style) async {
    try {
      await _api.dio.patch(
        '/users/coach-style',
        data: {'style': style.name},
      );
    } catch (error) {
      throw _api.toAppException(error);
    }
  }
}
