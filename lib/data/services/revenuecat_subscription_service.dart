import 'dart:async';

import 'package:purchases_flutter/purchases_flutter.dart' as rc;

import '../../domain/entities/app_user.dart';
import '../../domain/services/subscription_service.dart';

/// Реальная реализация [SubscriptionService] через RevenueCat SDK.
///
/// Entitlement-модель:
/// - `news_plus` — подписка News+ (149 ₽/мес)
/// - `pro` — подписка Pro
///
/// При покупке SDK сам обновляет entitlement; мы слушаем
/// [rc.Purchases.addCustomerInfoUpdateListener] и транслируем
/// изменения в [tierChanged].
final class RevenueCatSubscriptionService implements SubscriptionService {
  RevenueCatSubscriptionService({required String apiKey})
      : _apiKey = apiKey; // ignore: prefer_initializing_formals

  final String _apiKey;

  UserTier _tier = UserTier.free;
  final StreamController<UserTier> _tierController =
      StreamController<UserTier>.broadcast();
  bool _initialized = false;
  rc.CustomerInfoUpdateListener? _listener;

  @override
  UserTier get currentTier => _tier;

  @override
  Stream<UserTier> get tierChanged => _tierController.stream;

  @override
  bool get isNewsPlusActive =>
      _tier == UserTier.newsPlus || _tier == UserTier.pro;

  @override
  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    final config = rc.PurchasesConfiguration(_apiKey);
    await rc.Purchases.configure(config);

    // Слушаем изменения entitlement.
    _listener = (rc.CustomerInfo info) => _onCustomerInfoUpdated(info);
    rc.Purchases.addCustomerInfoUpdateListener(_listener!);

    // Первичное чтение.
    final info = await rc.Purchases.getCustomerInfo();
    _onCustomerInfoUpdated(info);
  }

  void _onCustomerInfoUpdated(rc.CustomerInfo info) {
    final newTier = _mapEntitlements(info.entitlements.active);
    if (newTier != _tier) {
      _tier = newTier;
      if (!_tierController.isClosed) {
        _tierController.add(_tier);
      }
    }
  }

  UserTier _mapEntitlements(Map<String, rc.EntitlementInfo> active) {
    if (active.containsKey('pro')) return UserTier.pro;
    if (active.containsKey('news_plus')) return UserTier.newsPlus;
    return UserTier.free;
  }

  @override
  Future<bool> purchase(UserTier tier) async {
    try {
      final offerings = await rc.Purchases.getOfferings();
      final current = offerings.current;
      if (current == null) return false;

      final packageId = switch (tier) {
        UserTier.newsPlus => 'monthly_news_plus',
        UserTier.pro => 'monthly_pro',
        UserTier.free => throw ArgumentError('Нельзя купить Free'),
      };

      final pkg = current.availablePackages
          .where((p) => p.identifier == packageId)
          .firstOrNull;
      if (pkg == null) return false;

      await rc.Purchases.purchase(
        rc.PurchaseParams.package(pkg),
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> restorePurchases() async {
    try {
      await rc.Purchases.restorePurchases();
    } catch (_) {
      // Восстановление может завершиться ошибкой, если покупок нет.
    }
  }

  /// Привязать Firebase UID к RevenueCat (вызывается после онбординга).
  Future<void> setAppUserId(String firebaseUid) async {
    await rc.Purchases.logIn(firebaseUid);
  }

  /// Освобождение ресурсов (при завершении работы приложения).
  void dispose() {
    if (_listener != null) {
      rc.Purchases.removeCustomerInfoUpdateListener(_listener!);
    }
    _tierController.close();
  }
}
