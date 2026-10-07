import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_user.dart';

part 'subscription_status.freezed.dart';
part 'subscription_status.g.dart';

/// Статус подписки и лимиты из `GET /subscription/status`.
@freezed
sealed class SubscriptionStatus with _$SubscriptionStatus {
  const factory SubscriptionStatus({
    @Default(UserTier.free) UserTier tier,
    @Default(8) int pullRequestsLeft,
    @Default(8) int pullRequestsLimit,
    @Default(false) bool newsPlusActive,

    /// Дата следующего списания (null для Free).
    DateTime? expiresAt,

    /// На какой тариф можно апгрейдиться.
    @Default(UserTier.newsPlus) UserTier canUpgradeTo,
  }) = _SubscriptionStatus;

  factory SubscriptionStatus.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStatusFromJson(json);
}
