import '../../core/network/api_client.dart';
import '../../domain/entities/micro_lesson.dart';
import '../../domain/entities/saved_case.dart';
import '../../domain/entities/weekly_review.dart';
import '../../domain/repositories/learning_repository.dart';

/// Реальная реализация [LearningRepository] поверх REST API.
final class RemoteLearningRepository implements LearningRepository {
  const RemoteLearningRepository(this._api);

  final ApiClient _api;

  @override
  Future<List<MicroLesson>> fetchRecommendedLessons() async {
    try {
      final response = await _api.dio.get('/lessons/recommended');
      final data = response.data as Map<String, dynamic>;
      final lessons = data['lessons'] as List<dynamic>? ?? [];
      return [
        for (final item in lessons)
          MicroLesson.fromJson(item as Map<String, dynamic>),
      ];
    } catch (error) {
      throw _api.toAppException(error);
    }
  }

  @override
  Future<void> completeLesson(String lessonId) async {
    try {
      await _api.dio.post('/lessons/complete/$lessonId');
    } catch (error) {
      throw _api.toAppException(error);
    }
  }

  @override
  Future<WeeklyReview?> fetchCurrentReview() async {
    try {
      final response = await _api.dio.get('/weekly-review/current');
      if (response.data == null) return null;
      return WeeklyReview.fromJson(response.data as Map<String, dynamic>);
    } catch (error) {
      throw _api.toAppException(error);
    }
  }

  @override
  Future<List<WeeklyReview>> fetchReviewHistory() async {
    try {
      final response = await _api.dio.get('/weekly-review/history');
      final data = response.data;
      if (data is List) {
        return [
          for (final item in data)
            WeeklyReview.fromJson(item as Map<String, dynamic>),
        ];
      }
      return [];
    } catch (error) {
      throw _api.toAppException(error);
    }
  }

  @override
  Future<List<SavedCase>> fetchCases() async {
    try {
      final response = await _api.dio.get('/cases');
      final data = response.data;
      if (data is List) {
        return [
          for (final item in data)
            SavedCase.fromJson(item as Map<String, dynamic>),
        ];
      }
      return [];
    } catch (error) {
      throw _api.toAppException(error);
    }
  }
}
