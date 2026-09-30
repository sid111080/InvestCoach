// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatCompletionEventDto _$ChatCompletionEventDtoFromJson(
  Map<String, dynamic> json,
) => _ChatCompletionEventDto(
  type: json['type'] as String? ?? '',
  content: json['content'] as String?,
  isFinal: json['is_final'] as bool? ?? false,
  messageId: json['message_id'] as String?,
  suggestedActions:
      (json['suggested_actions'] as List<dynamic>?)
          ?.map((e) => SuggestedActionDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SuggestedActionDto>[],
  biasDetected:
      (json['bias_detected'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  relatedToPortfolio: json['related_to_portfolio'] as bool?,
);

Map<String, dynamic> _$ChatCompletionEventDtoToJson(
  _ChatCompletionEventDto instance,
) => <String, dynamic>{
  'type': instance.type,
  'content': instance.content,
  'is_final': instance.isFinal,
  'message_id': instance.messageId,
  'suggested_actions': instance.suggestedActions,
  'bias_detected': instance.biasDetected,
  'related_to_portfolio': instance.relatedToPortfolio,
};

_SuggestedActionDto _$SuggestedActionDtoFromJson(Map<String, dynamic> json) =>
    _SuggestedActionDto(
      text: json['text'] as String? ?? '',
      action: json['action'] as String? ?? '',
    );

Map<String, dynamic> _$SuggestedActionDtoToJson(_SuggestedActionDto instance) =>
    <String, dynamic>{'text': instance.text, 'action': instance.action};

_ChatVoiceResponseDto _$ChatVoiceResponseDtoFromJson(
  Map<String, dynamic> json,
) => _ChatVoiceResponseDto(
  transcript: json['transcript'] as String? ?? '',
  responseText: json['response_text'] as String? ?? '',
  audioUrl: json['audio_url'] as String?,
  suggestedReplies:
      (json['suggested_replies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  biasDetected:
      (json['bias_detected'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
);

Map<String, dynamic> _$ChatVoiceResponseDtoToJson(
  _ChatVoiceResponseDto instance,
) => <String, dynamic>{
  'transcript': instance.transcript,
  'response_text': instance.responseText,
  'audio_url': instance.audioUrl,
  'suggested_replies': instance.suggestedReplies,
  'bias_detected': instance.biasDetected,
};
