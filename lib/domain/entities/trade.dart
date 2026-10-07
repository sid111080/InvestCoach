import 'package:freezed_annotation/freezed_annotation.dart';

part 'trade.freezed.dart';
part 'trade.g.dart';

/// Сторона сделки.
enum TradeSide { buy, sell }

/// Сделка + Instant Trade Feedback от Coach.
@freezed
sealed class Trade with _$Trade {
  const factory Trade({
    required String id,
    required String ticker,
    required String name,
    required TradeSide side,
    required int quantity,
    required double priceRub,
    required DateTime executedAt,

    /// Короткий комментарий Coach (Instant Trade Feedback).
    String? coachFeedback,

    /// Эмоциональный окрас фидбека: positive / neutral / caution.
    @Default('neutral') String feedbackTone,
  }) = _Trade;

  factory Trade.fromJson(Map<String, dynamic> json) =>
      _$TradeFromJson(json);
}
