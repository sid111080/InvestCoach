// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoiceChatResponse _$VoiceChatResponseFromJson(Map<String, dynamic> json) =>
    _VoiceChatResponse(
      transcript: json['transcript'] as String,
      responseText: json['responseText'] as String,
      audioUrl: json['audioUrl'] as String?,
      suggestedReplies:
          (json['suggestedReplies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      biasDetected:
          (json['biasDetected'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$VoiceChatResponseToJson(_VoiceChatResponse instance) =>
    <String, dynamic>{
      'transcript': instance.transcript,
      'responseText': instance.responseText,
      'audioUrl': instance.audioUrl,
      'suggestedReplies': instance.suggestedReplies,
      'biasDetected': instance.biasDetected,
    };
