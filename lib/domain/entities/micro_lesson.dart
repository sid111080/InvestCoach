import 'package:freezed_annotation/freezed_annotation.dart';

part 'micro_lesson.freezed.dart';
part 'micro_lesson.g.dart';

/// Сложность микро-урока.
enum LessonDifficulty {
  @JsonValue('easy')
  easy,

  @JsonValue('medium')
  medium,

  @JsonValue('hard')
  hard,
}

/// Микро-урок (15–60 секунд чтения) из `GET /lessons/recommended`.
@freezed
sealed class MicroLesson with _$MicroLesson {
  const factory MicroLesson({
    required String id,
    required String title,
    required int durationSeconds,
    @Default(LessonDifficulty.easy) LessonDifficulty difficulty,

    /// Связанный bias (нейтрально, без негатива).
    String? biasTag,

    /// Короткое описание (1–2 предложения).
    String? description,

    /// Завершён ли урок.
    @Default(false) bool completed,
  }) = _MicroLesson;

  factory MicroLesson.fromJson(Map<String, dynamic> json) =>
      _$MicroLessonFromJson(json);
}
