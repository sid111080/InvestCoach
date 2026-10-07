import '../../domain/entities/micro_lesson.dart';
import '../../domain/entities/saved_case.dart';
import '../../domain/entities/weekly_review.dart';
import '../../domain/repositories/learning_repository.dart';

/// Mock [LearningRepository]: реалистичные данные для UI без backend.
final class MockLearningRepository implements LearningRepository {
  MockLearningRepository({
    this.latency = const Duration(milliseconds: 600),
  });

  final Duration latency;

  /// Отслеживает завершённые уроки (mock-состояние).
  final Set<String> _completedLessons = {};

  @override
  Future<List<MicroLesson>> fetchRecommendedLessons() async {
    await Future<void>.delayed(latency);
    return [
      MicroLesson(
        id: 'lesson_001',
        title: 'Что такое FOMO и как его заметить',
        durationSeconds: 45,
        difficulty: LessonDifficulty.easy,
        biasTag: 'FOMO',
        description:
            'FOMO (Fear Of Missing Out) — страх пропустить. '
            'Когда все вокруг говорят о росте акции, а ты ещё не купил, '
            'мозг начинает давить: «Сейчас или никогда».\n\n'
            'Как заметить: если ты хочешь купить просто потому, что '
            'акция уже выросла и «все об этом говорят», — это сигнал FOMO. '
            'Попробуй сделать паузу в 10 минут и спроси себя: '
            '«Я бы купил эту бумагу, если бы она не росла?» '
            'Если ответ «нет» — скорее всего, ты реагируешь на эмоцию, '
            'а не на фундамент.',
        completed: _completedLessons.contains('lesson_001'),
      ),
      MicroLesson(
        id: 'lesson_002',
        title: 'Диверсификация: не клади всё в одну корзину',
        durationSeconds: 60,
        difficulty: LessonDifficulty.easy,
        description:
            'Представь, что весь твой портфель — одна акция. '
            'Компания отчиталась плохо — и ты потерял 15% за день. '
            'Теперь представь, что этот портфель разбит на 4–5 бумаг '
            'из разных секторов: банки, нефть, IT, ритейл. '
            'Одна просела — другие сгладили удар.\n\n'
            'Диверсификация не гарантирует прибыль, но она снижает '
            'риск резких просадок. Для учебного портфеля достаточно '
            '3–5 позиций из разных отраслей, плюс немного облигаций '
            'или ETF как «подушка».',
        completed: _completedLessons.contains('lesson_002'),
      ),
      MicroLesson(
        id: 'lesson_003',
        title: 'Анхедония к убыткам: почему −10% больнее, чем +10%',
        durationSeconds: 50,
        difficulty: LessonDifficulty.medium,
        biasTag: 'Loss Aversion',
        description:
            'Исследования показывают: потеря 1000 ₽ ощущается '
            'примерно в 2–2,5 раза сильнее, чем радость от прибыли '
            'в 1000 ₽. Это называется loss aversion — асимметрия '
            'восприятия выигрышей и проигрышей.\n\n'
            'Практический риск: когда портфель проседает, '
            'хочется «закрыть позицию и забыть». Но часто именно '
            'в момент паники продают на минимуме. Правило: '
            'решения о продаже принимай не в день просадки, '
            'а через 1–2 дня, когда эмоция спадет.',
        completed: _completedLessons.contains('lesson_003'),
      ),
      MicroLesson(
        id: 'lesson_004',
        title: 'Как читать отчёт компании за 3 минуты',
        durationSeconds: 60,
        difficulty: LessonDifficulty.medium,
        description:
            'Полный отчёт — 80 страниц. Но 90% полезной информации '
            'умещается в трёх цифрах. Вот что стоит проверить:\n\n'
            '1. Выручка — растёт или падает год к году? '
            'Рост > 5% — хороший знак.\n'
            '2. EBITDA (операционная прибыль) — компания '
            'реально зарабатывает или живёт на кредитах?\n'
            '3. Долг/EBITDA — если больше 3, компания '
            'сильно закредитована.\n\n'
            'Если все три цифры в порядке — компания здорова. '
            'Если что-то «поплыло» — стоит поговорить с Coach '
            'о том, как это влияет на твою позицию.',
        completed: _completedLessons.contains('lesson_004'),
      ),
    ];
  }

  @override
  Future<void> completeLesson(String lessonId) async {
    await Future<void>.delayed(latency);
    _completedLessons.add(lessonId);
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
