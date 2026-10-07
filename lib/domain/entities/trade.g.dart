// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Trade _$TradeFromJson(Map<String, dynamic> json) => _Trade(
  id: json['id'] as String,
  ticker: json['ticker'] as String,
  name: json['name'] as String,
  side: $enumDecode(_$TradeSideEnumMap, json['side']),
  quantity: (json['quantity'] as num).toInt(),
  priceRub: (json['priceRub'] as num).toDouble(),
  executedAt: DateTime.parse(json['executedAt'] as String),
  coachFeedback: json['coachFeedback'] as String?,
  feedbackTone: json['feedbackTone'] as String? ?? 'neutral',
);

Map<String, dynamic> _$TradeToJson(_Trade instance) => <String, dynamic>{
  'id': instance.id,
  'ticker': instance.ticker,
  'name': instance.name,
  'side': _$TradeSideEnumMap[instance.side]!,
  'quantity': instance.quantity,
  'priceRub': instance.priceRub,
  'executedAt': instance.executedAt.toIso8601String(),
  'coachFeedback': instance.coachFeedback,
  'feedbackTone': instance.feedbackTone,
};

const _$TradeSideEnumMap = {TradeSide.buy: 'buy', TradeSide.sell: 'sell'};
