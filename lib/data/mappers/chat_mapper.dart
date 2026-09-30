import '../../domain/entities/chat_stream_event.dart';
import '../../domain/entities/voice_response.dart';
import '../dto/chat_dto.dart';

/// Маппинг чат-DTO → сущности domain.
extension ChatCompletionEventMapper on ChatCompletionEventDto {
  /// Событие в модели domain.
  ///
  /// `null` — тип не знаем (например, служебное), UI игнорирует.
  ChatStreamEvent? toDomain() {
    switch (type) {
      case 'content':
        final content = this.content;
        if (content == null || content.isEmpty) return null;
        return ChatStreamEvent.chunk(content: content, isFinal: isFinal);
      case 'final':
        return ChatStreamEvent.completed(
          messageId: messageId ?? '',
          content: content ?? '',
          suggestedActions: [
            for (final action in suggestedActions)
              SuggestedAction(text: action.text, action: action.action),
          ],
          biasDetected: biasDetected,
          relatedToPortfolio: relatedToPortfolio,
        );
      default:
        return null;
    }
  }
}

extension ChatVoiceResponseMapper on ChatVoiceResponseDto {
  VoiceChatResponse toDomain() {
    return VoiceChatResponse(
      transcript: transcript,
      responseText: responseText,
      audioUrl: audioUrl,
      suggestedReplies: suggestedReplies,
      biasDetected: biasDetected,
    );
  }
}
