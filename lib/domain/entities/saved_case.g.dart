// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedCase _$SavedCaseFromJson(Map<String, dynamic> json) => _SavedCase(
  id: json['id'] as String,
  topic: json['topic'] as String,
  excerpt: json['excerpt'] as String,
  savedAt: DateTime.parse(json['savedAt'] as String),
  newsId: json['newsId'] as String?,
);

Map<String, dynamic> _$SavedCaseToJson(_SavedCase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'excerpt': instance.excerpt,
      'savedAt': instance.savedAt.toIso8601String(),
      'newsId': instance.newsId,
    };
