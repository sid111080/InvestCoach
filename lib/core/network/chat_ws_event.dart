import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_ws_event.freezed.dart';

/// Состояния WebSocket-соединения (WS-спецификация, раздел 5).
enum ChatWsConnectionState {
  /// Подключение.
  @JsonValue('connecting')
  connecting,

  /// Авторизация прошла.
  @JsonValue('authenticated')
  authenticated,

  /// Нормальная работа.
  @JsonValue('active')
  active,

  /// Автоматическое переподключение.
  @JsonValue('reconnecting')
  reconnecting,

  /// Соединение закрыто.
  @JsonValue('closed')
  closed,
}

/// События от сервера (WS-спецификация, раздел 4).
///
/// Все сообщения имеют оболочку `{type, payload, timestamp, message_id}`;
/// [parseChatWsMessage] превращает её в эту sealed-связку.
@freezed
sealed class ChatWsEvent with _$ChatWsEvent {
  /// Изменение состояния соединения.
  const factory ChatWsEvent.state(ChatWsConnectionState state) =
      WsStateEvent;

  /// Успешная авторизация (`auth_success`).
  const factory ChatWsEvent.authSuccess({
    required String userId,
    required String sessionId,
  }) = WsAuthSuccessEvent;

  /// Подтверждение получения сообщения (`message_received`).
  const factory ChatWsEvent.messageReceived({
    required String messageId,
    @Default('received') String status,
  }) = WsMessageReceivedEvent;

  /// Coach начал думать (`coach_thinking`).
  const factory ChatWsEvent.coachThinking({required String messageId}) =
      WsCoachThinkingEvent;

  /// Чанк стрима (`stream_chunk`).
  const factory ChatWsEvent.streamChunk({
    required String messageId,
    required String content,
    required bool isFinal,
    @Default(<String>[]) List<String> suggestedReplies,
    @Default(<String>[]) List<String> biasDetected,
    bool? relatedToPortfolio,
  }) = WsStreamChunkEvent;

  /// Готовый голосовой ответ (`voice_response`).
  const factory ChatWsEvent.voiceResponse({
    required String voiceSessionId,
    String? transcript,
    String? responseText,
    String? audioUrl,
    int? durationMs,
  }) = WsVoiceResponseEvent;

  /// Push-сообщение от Coach (`push_notification`).
  const factory ChatWsEvent.pushNotification({
    required String notificationId,
    String? title,
    String? body,
    @Default(<String, String>{}) Map<String, String> data,
  }) = WsPushNotificationEvent;

  /// Ошибка (`error`): лимиты, валидация и т.д.
  const factory ChatWsEvent.error({
    required String code,
    String? message,
    bool? suggestUpgrade,
  }) = WsErrorEvent;
}

/// Разбор сообщения WebSocket → [ChatWsEvent].
///
/// `null` — тип не знаем (служебное сообщение): игнорируем.
ChatWsEvent? parseChatWsMessage(Map<String, dynamic> json) {
  final payload =
      json['payload'] is Map ? (json['payload'] as Map).cast<String, dynamic>() : null;
  switch (json['type']) {
    case 'auth_success':
      if (payload == null) return null;
      return ChatWsEvent.authSuccess(
        userId: payload['user_id'] as String? ?? '',
        sessionId: payload['session_id'] as String? ?? '',
      );
    case 'message_received':
      if (payload == null) return null;
      return ChatWsEvent.messageReceived(
        messageId: payload['message_id'] as String? ?? '',
        status: payload['status'] as String? ?? 'received',
      );
    case 'coach_thinking':
      if (payload == null) return null;
      return ChatWsEvent.coachThinking(
        messageId: payload['message_id'] as String? ?? '',
      );
    case 'stream_chunk':
      if (payload == null) return null;
      final metadata =
          payload['metadata'] is Map ? (payload['metadata'] as Map).cast<String, dynamic>() : null;
      return ChatWsEvent.streamChunk(
        messageId: payload['message_id'] as String? ?? '',
        content: payload['content'] as String? ?? '',
        isFinal: payload['is_final'] as bool? ?? false,
        suggestedReplies: (payload['suggested_replies'] as List<dynamic>?)
                ?.whereType<String>()
                .toList() ??
            const <String>[],
        biasDetected:
            (metadata?['bias_detected'] as List?)?.whereType<String>().toList() ??
            const <String>[],
        relatedToPortfolio:
            metadata?['related_to_portfolio'] as bool?,
      );
    case 'voice_response':
      if (payload == null) return null;
      return ChatWsEvent.voiceResponse(
        voiceSessionId: payload['voice_session_id'] as String? ?? '',
        transcript: payload['transcript'] as String?,
        responseText: payload['response_text'] as String?,
        audioUrl: payload['audio_url'] as String?,
        durationMs: (payload['duration_ms'] as num?)?.toInt(),
      );
    case 'push_notification':
      if (payload == null) return null;
      final data = (payload['data'] as Map?)?.cast<String, dynamic>();
      return ChatWsEvent.pushNotification(
        notificationId: payload['notification_id'] as String? ?? '',
        title: payload['title'] as String?,
        body: payload['body'] as String?,
        data: {
          for (final entry in data?.entries ?? const <MapEntry<String, dynamic>>[])
            if (entry.value is String) entry.key: entry.value as String,
        },
      );
    case 'error':
      if (payload == null) return null;
      return ChatWsEvent.error(
        code: payload['code'] as String? ?? 'UNKNOWN',
        message: payload['message'] as String?,
        suggestUpgrade: payload['suggest_upgrade'] as bool?,
      );
    // auth, ping и прочие типы без payload для UI не используются.
    default:
      return null;
  }
}
