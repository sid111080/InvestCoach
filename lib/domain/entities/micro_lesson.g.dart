// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'micro_lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MicroLesson _$MicroLessonFromJson(Map<String, dynamic> json) => _MicroLesson(
  id: json['id'] as String,
  title: json['title'] as String,
  durationSeconds: (json['durationSeconds'] as num).toInt(),
  difficulty:
      $enumDecodeNullable(_$LessonDifficultyEnumMap, json['difficulty']) ??
      LessonDifficulty.easy,
  biasTag: json['biasTag'] as String?,
  description: json['description'] as String?,
  completed: json['completed'] as bool? ?? false,
);

Map<String, dynamic> _$MicroLessonToJson(_MicroLesson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'durationSeconds': instance.durationSeconds,
      'difficulty': _$LessonDifficultyEnumMap[instance.difficulty]!,
      'biasTag': instance.biasTag,
      'description': instance.description,
      'completed': instance.completed,
    };

const _$LessonDifficultyEnumMap = {
  LessonDifficulty.easy: 'easy',
  LessonDifficulty.medium: 'medium',
  LessonDifficulty.hard: 'hard',
};
