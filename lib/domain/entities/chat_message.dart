import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_context.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

/// Роль автора сообщения в чате.
enum ChatRole {
  @JsonValue('user')
  user,

  @JsonValue('coach')
  coach,
}

/// Состояние сообщения — определяет, как рисуется пузырь:
/// «Coach думает», streaming-текст, финал с подсказками, ошибка.
enum ChatMessageStatus {
  /// Ожидание первого чанка ответа.
  @JsonValue('thinking')
  thinking,

  /// Идёт streaming текста.
  @JsonValue('streaming')
  streaming,

  /// Ответ получен полностью.
  @JsonValue('completed')
  completed,

  /// Ответ не получен (ошибка, оффлайн) — пузырь с retry.
  @JsonValue('failed')
  failed,
}

/// Сообщение чата (пузырь на главном экране).
@freezed
sealed class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required ChatRole role,
    @Default('') String text,
    @Default(ChatMessageStatus.thinking) ChatMessageStatus status,
    DateTime? sentAt,
    /// Контекст сообщения (например, обсуждаемая новость) —
    /// для подписи пузыря в UI.
    ChatContext? context,

    /// Варианты продолжения разговора
    /// (`suggested_actions` финального SSE-чанка / WS `stream_chunk`).
    @Default(<String>[]) List<String> suggestedReplies,

    /// Обнаруженные bias (metadata финального чанка).
    @Default(<String>[]) List<String> biasDetected,

    /// Связано ли сообщение с портфелем пользователя.
    bool? relatedToPortfolio,
  }) = _ChatMessage;

  const ChatMessage._();

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  bool get isCoach => role == ChatRole.coach;

  /// Ответ завершён (успехом или ошибкой) — подсказки
  /// и retry больше не меняются.
  bool get isFinal =>
      status == ChatMessageStatus.completed ||
      status == ChatMessageStatus.failed;
}
