// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortfolioComparison _$PortfolioComparisonFromJson(Map<String, dynamic> json) =>
    _PortfolioComparison(
      yourReturn: (json['yourReturn'] as num).toDouble(),
      indexReturn: (json['indexReturn'] as num).toDouble(),
    );

Map<String, dynamic> _$PortfolioComparisonToJson(
  _PortfolioComparison instance,
) => <String, dynamic>{
  'yourReturn': instance.yourReturn,
  'indexReturn': instance.indexReturn,
};

_WeeklyReview _$WeeklyReviewFromJson(Map<String, dynamic> json) =>
    _WeeklyReview(
      week: json['week'] as String,
      processScore: (json['processScore'] as num).toDouble(),
      insights: (json['insights'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      portfolioComparison: json['portfolioComparison'] == null
          ? null
          : PortfolioComparison.fromJson(
              json['portfolioComparison'] as Map<String, dynamic>,
            ),
      generatedAt: json['generatedAt'] == null
          ? null
          : DateTime.parse(json['generatedAt'] as String),
    );

Map<String, dynamic> _$WeeklyReviewToJson(_WeeklyReview instance) =>
    <String, dynamic>{
      'week': instance.week,
      'processScore': instance.processScore,
      'insights': instance.insights,
      'portfolioComparison': instance.portfolioComparison,
      'generatedAt': instance.generatedAt?.toIso8601String(),
    };
