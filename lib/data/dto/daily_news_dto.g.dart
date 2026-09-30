// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyNewsResponseDto _$DailyNewsResponseDtoFromJson(
  Map<String, dynamic> json,
) => _DailyNewsResponseDto(
  news:
      (json['news'] as List<dynamic>?)
          ?.map((e) => NewsItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <NewsItemDto>[],
);

Map<String, dynamic> _$DailyNewsResponseDtoToJson(
  _DailyNewsResponseDto instance,
) => <String, dynamic>{'news': instance.news};

_NewsItemDto _$NewsItemDtoFromJson(Map<String, dynamic> json) => _NewsItemDto(
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

Map<String, dynamic> _$NewsItemDtoToJson(_NewsItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'impactOnPortfolio': instance.impactOnPortfolio,
      'portfolioImpactPercent': instance.portfolioImpactPercent,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'tags': instance.tags,
    };
