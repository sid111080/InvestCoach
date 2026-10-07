import '../../domain/entities/micro_lesson.dart';
import '../../domain/entities/saved_case.dart';
import '../../domain/entities/weekly_review.dart';
import '../../domain/repositories/learning_repository.dart';

/// Mock [LearningRepository]: реалистичные данные для UI без backend.
final class MockLearningRepository implements LearningRepository {
  const MockLearningRepository({
    this.latency = const Duration(milliseconds: 600),
  });

  final Duration latency;

  @override
  Future<List<MicroLesson>> fetchRecommendedLessons() async {
    await Future<void>.delayed(latency);
    return const [
      MicroLesson(
        id: 'lesson_001',
        title: 'Что такое FOMO и как его заметить',
        durationSeconds: 45,
        difficulty: LessonDifficulty.easy,
        biasTag: 'FOMO',
        description:
            'Коротко о том, почему «все покупают» — не аргумент, '
            'и как сделать шаг назад.',
      ),
      MicroLesson(
        id: 'lesson_002',
        title: 'Диверсификация: не клади всё в одну корзину',
        durationSeconds: 60,
        difficulty: LessonDifficulty.easy,
        description:
            'Почему 3–5 разных активов — уже хорошая защита '
            'от резких движений рынка.',
      ),
      MicroLesson(
        id: 'lesson_003',
        title: 'Анхедония к убыткам: почему −10% больнее, чем +10%',
        durationSeconds: 50,
        difficulty: LessonDifficulty.medium,
        biasTag: 'Loss Aversion',
        description:
            'Психология убытков и как не продавать на панике.',
      ),
      MicroLesson(
        id: 'lesson_004',
        title: 'Как читать отчёт компании за 3 минуты',
        durationSeconds: 60,
        difficulty: LessonDifficulty.medium,
        description:
            'Три цифры, которые стоит проверить: выручка, EBITDA, долг.',
      ),
    ];
  }

  @override
  Future<void> completeLesson(String lessonId) async {
    await Future<void>.delayed(latency);
  }

  @override
  Future<WeeklyReview?> fetchCurrentReview() async {
    await Future<void>.delayed(latency);
    return const WeeklyReview(
      week: '2026-W37',
      processScore: 7.4,
      insights: [
        'Ты хорошо реагируешь на позитивные новости, но часто игнорируешь риски',
        'FOMO проявлялся 3 раза за неделю — в моменты резкого роста',
        'Отличная работа с диверсификацией: портфель сбалансирован',
        'Попытка «догнать» рынок после пропуска движения — стоит обсудить',
      ],
      portfolioComparison: PortfolioComparison(
        yourReturn: 4.2,
        indexReturn: 5.1,
      ),
    );
  }

  @override
  Future<List<WeeklyReview>> fetchReviewHistory() async {
    await Future<void>.delayed(latency);
    return const [
      WeeklyReview(
        week: '2026-W37',
        processScore: 7.4,
        insights: [
          'Хорошая реакция на позитив, но риски игнорируются',
          'FOMO: 3 раза за неделю',
        ],
        portfolioComparison: PortfolioComparison(
          yourReturn: 4.2,
          indexReturn: 5.1,
        ),
      ),
      WeeklyReview(
        week: '2026-W36',
        processScore: 6.8,
        insights: [
          'Слишком много сделок на эмоциях',
          'Хорошо: не продавал на панике',
        ],
        portfolioComparison: PortfolioComparison(
          yourReturn: 2.1,
          indexReturn: 3.4,
        ),
      ),
      WeeklyReview(
        week: '2026-W35',
        processScore: 7.1,
        insights: [
          'Стабильная неделя, минимум импульсивных решений',
          'Стоит добавить облигации для «якоря»',
        ],
        portfolioComparison: PortfolioComparison(
          yourReturn: 3.8,
          indexReturn: 4.0,
        ),
      ),
    ];
  }

  @override
  Future<List<SavedCase>> fetchCases() async {
    await Future<void>.delayed(latency);
    final now = DateTime.now();
    return [
      SavedCase(
        id: 'case_001',
        topic: 'Сбер: отчёт за 8 месяцев',
        excerpt:
            'Разобрали, почему рост прибыли +34% не всегда означает '
            'рост акций. Обсудили влияние на позицию SBER в портфеле.',
        savedAt: now.subtract(const Duration(days: 2)),
        newsId: 'news_7843',
      ),
      SavedCase(
        id: 'case_002',
        topic: 'ЦБ сохранил ставку 16%',
        excerpt:
            'Почему высокая ставка — аргумент за облигации и депозиты. '
            'Согласовали план перераспределения кэша.',
        savedAt: now.subtract(const Duration(days: 5)),
        newsId: 'news_7844',
      ),
      SavedCase(
        id: 'case_003',
        topic: 'Транснефть: рекордные дивиденды',
        excerpt:
            'Обсудили, стоит ли увеличивать позицию под дивиденды '
            'или это «дивидендная ловушка». Оставили позицию без изменений.',
        savedAt: now.subtract(const Duration(days: 8)),
        newsId: 'news_7845',
      ),
    ];
  }
}
