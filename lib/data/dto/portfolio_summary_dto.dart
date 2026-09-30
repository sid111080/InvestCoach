import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_summary_dto.freezed.dart';
part 'portfolio_summary_dto.g.dart';

/// Тело `GET /portfolio/summary`
/// (контакт с backend уточняется — см. [PortfolioSummary] в domain).
@freezed
sealed class PortfolioSummaryDto with _$PortfolioSummaryDto {
  const factory PortfolioSummaryDto({
    @Default(0) int totalValueRub,
    @Default(0.0) double dailyChangePercent,
    int? dailyChangeRub,
    @Default(<String, double>{}) Map<String, double> allocation,
  }) = _PortfolioSummaryDto;

  factory PortfolioSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$PortfolioSummaryDtoFromJson(json);
}
