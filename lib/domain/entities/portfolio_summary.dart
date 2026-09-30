import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_summary.freezed.dart';
part 'portfolio_summary.g.dart';

/// Сводка портфеля — формат `GET /portfolio/summary`.
///
/// Нестыковка ТЗ: OpenAPI описывает только `GET /portfolio`,
/// для мини-карточки на главном экране ожидается `/portfolio/summary` —
/// согласовать с backend-командой.
@freezed
sealed class PortfolioSummary with _$PortfolioSummary {
  const factory PortfolioSummary({
    /// Стоимость портфеля в рублях (целое число, как в ТЗ).
    required int totalValueRub,

    /// Дневная доходность, в процентах (может быть отрицательной).
    required double dailyChangePercent,

    /// Изменение стоимости за день, в рублях.
    int? dailyChangeRub,

    /// Долевая аллокация в процентах (сумма ≈ 100).
    @Default(<String, double>{}) Map<String, double> allocation,
  }) = _PortfolioSummary;

  factory PortfolioSummary.fromJson(Map<String, dynamic> json) =>
      _$PortfolioSummaryFromJson(json);
}
