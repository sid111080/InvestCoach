import 'package:dio/dio.dart';

import '../../core/network/api_client.dart';
import '../../domain/entities/chat_context.dart';
import '../dto/chat_dto.dart';

/// Источник голосового режима: `POST /chat/voice`.
///
/// Возвращает текст + `audio_url` (TTS) + подсказки;
/// для стриминга голосовых ответов предусмотрен WS
/// (событие `voice_response`) — см. core/network/chat_web_socket.dart.
final class ChatVoiceSource {
  const ChatVoiceSource(this._api);

  final ApiClient _api;

  /// Отправляет запрос голосового режима.
  ///
  /// [transcript] — результат STT; [audioBase64] — запись
  /// (бэкенд сам выполняет транскрипцию). Передать достаточно
  /// одной из величин.
  Future<ChatVoiceResponseDto> request({
    String? transcript,
    String? audioBase64,
    ChatContext? context,
  }) {
    return _api.dio
        .post<Object?>(
          '/chat/voice',
          data: {
            'audio_base64': ?audioBase64,
            'transcript': ?transcript,
            'context_type':
                context?.type.name ?? ChatContextType.general.name,
          },
          options: Options(
            // Генерация TTS может занимать до минуты.
            receiveTimeout: const Duration(seconds: 90),
          ),
        )
        .then(
          (response) =>
              ChatVoiceResponseDto.fromJson(
                response.data as Map<String, dynamic>,
              ),
        );
  }
}
