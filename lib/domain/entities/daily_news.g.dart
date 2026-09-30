// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyNews _$DailyNewsFromJson(Map<String, dynamic> json) => _DailyNews(
  id: json['id'] as String,
  title: json['title'] as String,
  summary: json['summary'] as String,
  impactOnPortfolio: json['impactOnPortfolio'] as bool? ?? false,
  portfolioImpactPercent: (json['portfolioImpactPercent'] as num?)?.toDouble(),
  publishedAt: DateTime.parse(json['publishedAt'] as String),
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$DailyNewsToJson(_DailyNews instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'impactOnPortfolio': instance.impactOnPortfolio,
      'portfolioImpactPercent': instance.portfolioImpactPercent,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'tags': instance.tags,
    };
