import '../entities/chat_context.dart';
import '../entities/chat_stream_event.dart';
import '../entities/voice_response.dart';

/// Общение с Coach: текстовый чат (streaming) и голосовой режим.
///
/// Транспорт: `POST /chat/completion` (SSE) для текста,
/// `POST /chat/voice` для голосового режима. В реализации
/// поверх WebSocket (WS-спецификация) события имеют тот же смысл.
abstract interface class ChatRepository {
  /// Отправляет текстовый запрос и возвращает поток событий ответа:
  /// чанки `content`, затем финальный ответ с подсказками.
  ///
  /// Бросает `AppException` (типизированный сбой, см. core/errors)
  /// при ошибке — например, 429 `RATE_LIMIT_EXCEEDED`.
  Stream<ChatStreamEvent> sendMessage(String message, {ChatContext? context});

  /// Голосовой режим: принимает распознанный текст (результат STT)
  /// и/или записанное аудио (base64), возвращает ответ Coach
  /// (текст + `audio_url` для TTS + подсказки).
  Future<VoiceChatResponse> sendVoice({
    String? transcript,
    String? audioBase64,
    ChatContext? context,
  });
}
