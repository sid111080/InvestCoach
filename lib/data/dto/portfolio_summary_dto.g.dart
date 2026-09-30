// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortfolioSummaryDto _$PortfolioSummaryDtoFromJson(Map<String, dynamic> json) =>
    _PortfolioSummaryDto(
      totalValueRub: (json['totalValueRub'] as num?)?.toInt() ?? 0,
      dailyChangePercent:
          (json['dailyChangePercent'] as num?)?.toDouble() ?? 0.0,
      dailyChangeRub: (json['dailyChangeRub'] as num?)?.toInt(),
      allocation:
          (json['allocation'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const <String, double>{},
    );

Map<String, dynamic> _$PortfolioSummaryDtoToJson(
  _PortfolioSummaryDto instance,
) => <String, dynamic>{
  'totalValueRub': instance.totalValueRub,
  'dailyChangePercent': instance.dailyChangePercent,
  'dailyChangeRub': instance.dailyChangeRub,
  'allocation': instance.allocation,
};
