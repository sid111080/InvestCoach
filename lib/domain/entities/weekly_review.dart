import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_review.freezed.dart';
part 'weekly_review.g.dart';

/// Сравнение портфеля с индексом за неделю.
@freezed
sealed class PortfolioComparison with _$PortfolioComparison {
  const factory PortfolioComparison({
    required double yourReturn,
    required double indexReturn,
  }) = _PortfolioComparison;

  factory PortfolioComparison.fromJson(Map<String, dynamic> json) =>
      _$PortfolioComparisonFromJson(json);
}

/// Еженедельный разбор из `GET /weekly-review/current`
/// и `GET /weekly-review/history`.
@freezed
sealed class WeeklyReview with _$WeeklyReview {
  const factory WeeklyReview({
    /// Неделя в формате ISO (например, «2026-W37»).
    required String week,

    /// Process Score (0–10).
    required double processScore,

    /// Ключевые инсайты (3–4 карточки).
    required List<String> insights,

    /// Сравнение с индексом (может отсутствовать).
    PortfolioComparison? portfolioComparison,

    /// Дата генерации.
    DateTime? generatedAt,
  }) = _WeeklyReview;

  factory WeeklyReview.fromJson(Map<String, dynamic> json) =>
      _$WeeklyReviewFromJson(json);
}
