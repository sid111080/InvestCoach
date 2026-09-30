import '../../core/network/api_client.dart';
import '../dto/daily_news_dto.dart';
import '../../domain/entities/daily_news.dart';
import '../../domain/repositories/news_repository.dart';

/// Реальная реализация [NewsRepository] поверх REST API.
final class RemoteNewsRepository implements NewsRepository {
  const RemoteNewsRepository(this._api);

  final ApiClient _api;

  @override
  Future<List<DailyNews>> fetchDaily() async {
    try {
      final response = await _api.dio.get('/news/daily');
      final dto = DailyNewsResponseDto.fromJson(response.data);
      return [
        for (final item in dto.news)
          DailyNews(
            id: item.id,
            title: item.title,
            summary: item.summary,
            impactOnPortfolio: item.impactOnPortfolio,
            portfolioImpactPercent: item.portfolioImpactPercent,
            publishedAt: item.publishedAt,
            tags: item.tags,
          ),
      ];
    } catch (error) {
      throw _api.toAppException(error);
    }
  }
}
