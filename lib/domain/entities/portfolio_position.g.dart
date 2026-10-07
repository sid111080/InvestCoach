// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortfolioPosition _$PortfolioPositionFromJson(Map<String, dynamic> json) =>
    _PortfolioPosition(
      ticker: json['ticker'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      avgPriceRub: (json['avgPriceRub'] as num).toDouble(),
      currentPriceRub: (json['currentPriceRub'] as num).toDouble(),
      dayChangePercent: (json['dayChangePercent'] as num).toDouble(),
    );

Map<String, dynamic> _$PortfolioPositionToJson(_PortfolioPosition instance) =>
    <String, dynamic>{
      'ticker': instance.ticker,
      'name': instance.name,
      'quantity': instance.quantity,
      'avgPriceRub': instance.avgPriceRub,
      'currentPriceRub': instance.currentPriceRub,
      'dayChangePercent': instance.dayChangePercent,
    };
