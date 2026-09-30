import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

/// Тело SSE-события ответа Coach (`POST /chat/completion`, `stream: true`).
///
/// Backend шлёт snake_case, поэтому ключи указаны явно.
/// В одном DTO объединены события `content` и `final` —
/// неиспользуемые поля у каждого пустые.
@freezed
sealed class ChatCompletionEventDto with _$ChatCompletionEventDto {
  const factory ChatCompletionEventDto({
    @Default('') String type,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'is_final')
    @Default(false)
    bool isFinal,
    @JsonKey(name: 'message_id') String? messageId,
    @JsonKey(name: 'suggested_actions')
    @Default(<SuggestedActionDto>[])
    List<SuggestedActionDto> suggestedActions,
    @JsonKey(name: 'bias_detected')
    @Default(<String>[])
    List<String> biasDetected,
    @JsonKey(name: 'related_to_portfolio') bool? relatedToPortfolio,
  }) = _ChatCompletionEventDto;

  factory ChatCompletionEventDto.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionEventDtoFromJson(json);
}

/// Подсказка-действие в финальном ответе.
@freezed
sealed class SuggestedActionDto with _$SuggestedActionDto {
  const factory SuggestedActionDto({
    @Default('') String text,
    @Default('') String action,
  }) = _SuggestedActionDto;

  factory SuggestedActionDto.fromJson(Map<String, dynamic> json) =>
      _$SuggestedActionDtoFromJson(json);
}

/// Тело `POST /chat/voice` (response 200).
@freezed
sealed class ChatVoiceResponseDto with _$ChatVoiceResponseDto {
  const factory ChatVoiceResponseDto({
    @Default('') String transcript,
    @JsonKey(name: 'response_text') @Default('') String responseText,
    @JsonKey(name: 'audio_url') String? audioUrl,
    @JsonKey(name: 'suggested_replies')
    @Default(<String>[])
    List<String> suggestedReplies,
    @JsonKey(name: 'bias_detected')
    @Default(<String>[])
    List<String> biasDetected,
  }) = _ChatVoiceResponseDto;

  factory ChatVoiceResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ChatVoiceResponseDtoFromJson(json);
}
