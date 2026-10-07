import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_position.freezed.dart';
part 'portfolio_position.g.dart';

/// Позиция в портфеле (актив + количество + стоимость).
@freezed
sealed class PortfolioPosition with _$PortfolioPosition {
  const factory PortfolioPosition({
    required String ticker,
    required String name,
    required int quantity,
    required double avgPriceRub,
    required double currentPriceRub,
    required double dayChangePercent,
  }) = _PortfolioPosition;

  factory PortfolioPosition.fromJson(Map<String, dynamic> json) =>
      _$PortfolioPositionFromJson(json);

  const PortfolioPosition._();

  /// Текущая стоимость позиции.
  double get currentValueRub => quantity * currentPriceRub;

  /// Изменение за день в рублях.
  double get dayChangeRub => currentValueRub * (dayChangePercent / 100.0);
}
