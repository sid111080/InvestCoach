import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_message.dart';

part 'chat_session.freezed.dart';

/// Фаза сессии чата — состояния экрана из ТЗ (раздел 5.2).
enum ChatSessionPhase {
  /// First Launch: только приветственное сообщение Coach.
  firstLaunch,

  /// Обычный чат, активного ответа нет.
  idle,

  /// Loading Response: «Coach думает» (ожидание первого чанка).
  thinking,

  /// Streaming ответа Coach.
  streaming,

  /// Активен голосовой режим (fullscreen-оверлей).
  voice,

  /// Limit Reached: исчерпан дневной лимит Free-тарифа —
  /// показываем мягкий paywall.
  limitReached,
}

/// Типизированный сбой последнего запроса чата.
///
/// Держим собственный (не `AppException` из core), чтобы
/// domain-слой не зависел от транспортного уровня; UI берёт
/// [userMessage] для пузыря-ошибки.
final class ChatFailure {
  const ChatFailure({
    required this.errorCode,
    required this.userMessage,
  });

  /// Код ошибки backend, например `RATE_LIMIT_EXCEEDED`.
  final String errorCode;

  /// Готовый текст для UI (в поддерживающем тоне).
  final String userMessage;

  @override
  bool operator ==(Object other) =>
      other is ChatFailure &&
      other.errorCode == errorCode &&
      other.userMessage == userMessage;

  @override
  int get hashCode => Object.hash(errorCode, userMessage);
}

/// Состояние сессии чата (управляется Riverpod-notifier).
@freezed
sealed class ChatSession with _$ChatSession {
  const factory ChatSession({
    @Default(<ChatMessage>[]) List<ChatMessage> messages,
    @Default(ChatSessionPhase.firstLaunch) ChatSessionPhase phase,
    ChatFailure? failure,

    /// Использовано Pull-запросов за день (Free-лимит: 8).
    @Default(0) int pullRequestsUsed,
  }) = _ChatSession;

  const ChatSession._();

  /// Есть ли у сессии хоть одно сообщение.
  bool get isEmpty => messages.isEmpty;
}
