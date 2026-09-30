// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortfolioSummary _$PortfolioSummaryFromJson(Map<String, dynamic> json) =>
    _PortfolioSummary(
      totalValueRub: (json['totalValueRub'] as num).toInt(),
      dailyChangePercent: (json['dailyChangePercent'] as num).toDouble(),
      dailyChangeRub: (json['dailyChangeRub'] as num?)?.toInt(),
      allocation:
          (json['allocation'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const <String, double>{},
    );

Map<String, dynamic> _$PortfolioSummaryToJson(_PortfolioSummary instance) =>
    <String, dynamic>{
      'totalValueRub': instance.totalValueRub,
      'dailyChangePercent': instance.dailyChangePercent,
      'dailyChangeRub': instance.dailyChangeRub,
      'allocation': instance.allocation,
    };
