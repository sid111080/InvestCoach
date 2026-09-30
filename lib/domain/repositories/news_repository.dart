import '../entities/daily_news.dart';

/// Новости (`GET /news/daily`, `GET /news/feed`).
abstract interface class NewsRepository {
  /// Персонализированные новости дня — карточка «Сегодня важно»
  /// на главном экране и лента экрана «Новости».
  Future<List<DailyNews>> fetchDaily();
}
