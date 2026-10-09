import 'dart:async';

import '../../domain/entities/app_user.dart';
import '../../domain/services/subscription_service.dart';

/// Mock [SubscriptionService] для тестов и mock-режима.
final class MockSubscriptionService implements SubscriptionService {
  MockSubscriptionService({UserTier initialTier = UserTier.free})
      : _tier = initialTier;

  final StreamController<UserTier> _tierController =
      StreamController<UserTier>.broadcast();
  UserTier _tier;

  @override
  UserTier get currentTier => _tier;

  @override
  Stream<UserTier> get tierChanged => _tierController.stream;

  @override
  bool get isNewsPlusActive =>
      _tier == UserTier.newsPlus || _tier == UserTier.pro;

  @override
  Future<void> initialize() async {}

  @override
  Future<bool> purchase(UserTier tier) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _tier = tier;
    _tierController.add(_tier);
    return true;
  }

  @override
  Future<void> restorePurchases() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
  }

  /// Симулировать смену тарифа (для тестов).
  void simulateTierChange(UserTier tier) {
    _tier = tier;
    _tierController.add(_tier);
  }

  void dispose() {
    _tierController.close();
  }
}
