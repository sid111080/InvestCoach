import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_response.freezed.dart';
part 'voice_response.g.dart';

/// Ответ голосового режима (`POST /chat/voice` / WS `voice_response`).
@freezed
sealed class VoiceChatResponse with _$VoiceChatResponse {
  const factory VoiceChatResponse({
    /// Распознанный текст вопроса пользователя.
    required String transcript,

    /// Текст ответа Coach.
    required String responseText,

    /// URL аудио-ответа (ElevenLabs) — для озвучивания.
    String? audioUrl,

    /// Варианты продолжения разговора.
    @Default(<String>[]) List<String> suggestedReplies,

    /// Обнаруженные bias (например `recency_bias`).
    @Default(<String>[]) List<String> biasDetected,
  }) = _VoiceChatResponse;

  factory VoiceChatResponse.fromJson(Map<String, dynamic> json) =>
      _$VoiceChatResponseFromJson(json);
}
