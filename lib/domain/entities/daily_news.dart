import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_news.freezed.dart';
part 'daily_news.g.dart';

/// Новость дня из `GET /news/daily`.
///
/// Показывается в акцентной карточке «Сегодня важно»
/// на главном экране и в ленте экрана «Новости».
@freezed
sealed class DailyNews with _$DailyNews {
  const factory DailyNews({
    required String id,
    required String title,
    required String summary,

    /// Влияет ли новость на портфель пользователя.
    @Default(false) bool impactOnPortfolio,

    /// Процент влияния на портфель (может отсутствовать).
    double? portfolioImpactPercent,

    required DateTime publishedAt,
    @Default(<String>[]) List<String> tags,
  }) = _DailyNews;

  factory DailyNews.fromJson(Map<String, dynamic> json) =>
      _$DailyNewsFromJson(json);
}
