// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStats _$UserStatsFromJson(Map<String, dynamic> json) => _UserStats(
  currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
  avgInteractionsPerDay:
      (json['avgInteractionsPerDay'] as num?)?.toDouble() ?? 0.0,
  topTopics:
      (json['topTopics'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  biasPatterns:
      (json['biasPatterns'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  activeDays: (json['activeDays'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$UserStatsToJson(_UserStats instance) =>
    <String, dynamic>{
      'currentStreak': instance.currentStreak,
      'avgInteractionsPerDay': instance.avgInteractionsPerDay,
      'topTopics': instance.topTopics,
      'biasPatterns': instance.biasPatterns,
      'activeDays': instance.activeDays,
    };
