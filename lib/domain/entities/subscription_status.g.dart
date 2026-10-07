// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionStatus _$SubscriptionStatusFromJson(Map<String, dynamic> json) =>
    _SubscriptionStatus(
      tier:
          $enumDecodeNullable(_$UserTierEnumMap, json['tier']) ?? UserTier.free,
      pullRequestsLeft: (json['pullRequestsLeft'] as num?)?.toInt() ?? 8,
      pullRequestsLimit: (json['pullRequestsLimit'] as num?)?.toInt() ?? 8,
      newsPlusActive: json['newsPlusActive'] as bool? ?? false,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      canUpgradeTo:
          $enumDecodeNullable(_$UserTierEnumMap, json['canUpgradeTo']) ??
          UserTier.newsPlus,
    );

Map<String, dynamic> _$SubscriptionStatusToJson(_SubscriptionStatus instance) =>
    <String, dynamic>{
      'tier': _$UserTierEnumMap[instance.tier]!,
      'pullRequestsLeft': instance.pullRequestsLeft,
      'pullRequestsLimit': instance.pullRequestsLimit,
      'newsPlusActive': instance.newsPlusActive,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'canUpgradeTo': _$UserTierEnumMap[instance.canUpgradeTo]!,
    };

const _$UserTierEnumMap = {
  UserTier.free: 'free',
  UserTier.newsPlus: 'news_plus',
  UserTier.pro: 'pro',
};
