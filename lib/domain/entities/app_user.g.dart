// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  id: json['id'] as String,
  name: json['name'] as String,
  tier: $enumDecodeNullable(_$UserTierEnumMap, json['tier']) ?? UserTier.free,
  createdAt: DateTime.parse(json['createdAt'] as String),
  preferences: json['preferences'] == null
      ? null
      : UserPreferences.fromJson(json['preferences'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'tier': _$UserTierEnumMap[instance.tier]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'preferences': instance.preferences,
};

const _$UserTierEnumMap = {
  UserTier.free: 'free',
  UserTier.newsPlus: 'news_plus',
  UserTier.pro: 'pro',
};
