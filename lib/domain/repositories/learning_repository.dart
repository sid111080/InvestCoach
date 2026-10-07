import '../entities/micro_lesson.dart';
import '../entities/saved_case.dart';
import '../entities/weekly_review.dart';

/// Обучение: уроки, Weekly Reviews, сохранённые кейсы.
///
/// - `GET /lessons/recommended` — вкладка «Сегодня».
/// - `POST /lessons/complete/{id}` — отметка о прохождении.
/// - `GET /weekly-review/current` — вкладка «Weekly Reviews».
/// - `GET /weekly-review/history` — история разборов.
/// - `GET /cases` — вкладка «Мои Кейсы».
abstract interface class LearningRepository {
  /// Рекомендованные микро-уроки на сегодня.
  Future<List<MicroLesson>> fetchRecommendedLessons();

  /// Отметить урок как завершённый.
  Future<void> completeLesson(String lessonId);

  /// Текущий Weekly Review.
  Future<WeeklyReview?> fetchCurrentReview();

  /// История всех Weekly Reviews (новые — первыми).
  Future<List<WeeklyReview>> fetchReviewHistory();

  /// Сохранённые разговоры по новостям.
  Future<List<SavedCase>> fetchCases();
}
