import '../../domain/entities/daily_news.dart';
import '../../domain/repositories/news_repository.dart';

/// Mock [NewsRepository]: реалистичные новости дня
/// (примеры из ТЗ), чтобы UI работал без backend.
final class MockNewsRepository implements NewsRepository {
  const MockNewsRepository({
    this.latency = const Duration(milliseconds: 700),
  });

  final Duration latency;

  @override
  Future<List<DailyNews>> fetchDaily() async {
    await Future<void>.delayed(latency);
    final today = DateTime.now().toLocal();
    return [
      DailyNews(
        id: 'news_7843',
        title: 'Сбер отчитался за 8 месяцев: чистая прибыль +34%',
        summary:
            'Несмотря на рост прибыли, маржа сократилась на 1.8 п.п. '
            'Коуч разберёт, что это значит для твоих бумаг.',
        impactOnPortfolio: true,
        portfolioImpactPercent: 8.4,
        publishedAt: today,
        tags: const ['banking', 'earnings'],
      ),
      DailyNews(
        id: 'news_7844',
        title: 'ЦБ сохранил ключевую ставку',
        summary:
            'Депозиты остаются доходными. Хороший момент вспомнить, '
            'почему кэш в портфеле — это тоже инструмент.',
        impactOnPortfolio: false,
        publishedAt: today,
        tags: const ['macro', 'central_bank'],
      ),
      DailyNews(
        id: 'news_7845',
        title: 'Транснефть: рекордная дивидендная доходность',
        summary:
            'Совет директоров предложил рекордные дивиденды. '
            'Давай посмотрим, как это влияет на твой портфель.',
        impactOnPortfolio: true,
        portfolioImpactPercent: 2.1,
        publishedAt: today,
        tags: const ['dividends'],
      ),
    ];
  }
}
