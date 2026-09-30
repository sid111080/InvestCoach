import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/app_exception.dart';
import '../../../domain/entities/app_user.dart';
import '../../../domain/entities/chat_context.dart';
import '../../../domain/entities/chat_message.dart';
import '../../../domain/entities/chat_session.dart';
import '../../../domain/entities/chat_stream_event.dart';
import '../../../core/providers/repository_providers.dart';

/// Провайдер сессии чата (главный экран Coach).
final chatSessionProvider =
    NotifierProvider<ChatSessionNotifier, ChatSession>(
      ChatSessionNotifier.new,
    );

/// Дневной лимит Pull-запросов Free-тарифа (ТЗ: 8/сутки).
const int kFreeDailyPullLimit = 8;

/// Управление сессией чата: отправка вопроса, streaming ответов,
/// лимиты Free, обработка ошибок.
final class ChatSessionNotifier extends Notifier<ChatSession> {
  int _uidCounter = 0;

  @override
  ChatSession build() {
    ref.keepAlive(); // сессия переживает перезабег экрана
    return const ChatSession();
  }

  /// Имя пользователя для приветствия (`null` до онбординга).
  String get userName =>
      ref.read(currentUserProvider).value?.name ?? '';

  /// Отправляет текстовый вопрос Coach.
  Future<void> sendText(String text, {ChatContext? context}) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    if (_isBusy) return;

    // Лимит Free-тарифа: мягкий paywall вместо запроса.
    final tier = ref.read(currentUserProvider).value?.tier ?? UserTier.free;
    if (tier == UserTier.free &&
        state.pullRequestsUsed >= kFreeDailyPullLimit) {
      state = state.copyWith(phase: ChatSessionPhase.limitReached);
      return;
    }

    final userMessage = ChatMessage(
      id: _nextId('user'),
      role: ChatRole.user,
      text: trimmed,
      status: ChatMessageStatus.completed,
      sentAt: DateTime.now(),
      context: context,
    );
    final thinking = ChatMessage(
      id: _nextId('coach'),
      role: ChatRole.coach,
      status: ChatMessageStatus.thinking,
      context: context,
    );
    state = state.copyWith(
      messages: [...state.messages, userMessage, thinking],
      phase: ChatSessionPhase.thinking,
      pullRequestsUsed: state.pullRequestsUsed + 1,
      failure: null,
    );

    try {
      final repository = ref.read(chatRepositoryProvider);
      await for (final event
          in repository.sendMessage(trimmed, context: context)) {
        switch (event) {
          case ChatChunkEvent(:final content, :final isFinal):
            state = state.copyWith(
              messages: [
                for (final message in state.messages)
                  if (message.id == thinking.id)
                    message.copyWith(
                      text: message.text.isEmpty
                          ? content
                          : '${message.text} $content',
                      status:
                          isFinal
                              ? ChatMessageStatus.completed
                              : ChatMessageStatus.streaming,
                    )
                  else
                    message,
              ],
              phase:
                  isFinal
                      ? ChatSessionPhase.idle
                      : ChatSessionPhase.streaming,
            );
          case ChatCompletedEvent(
            :final messageId,
            :final content,
            :final suggestedActions,
            :final biasDetected,
            :final relatedToPortfolio,
          ):
            state = state.copyWith(
              messages: [
                for (final message in state.messages)
                  if (message.id == thinking.id)
                    message.copyWith(
                      id: messageId.isEmpty ? message.id : messageId,
                      text: content,
                      status: ChatMessageStatus.completed,
                      suggestedReplies: [
                        for (final action in suggestedActions) action.text,
                      ],
                      biasDetected: biasDetected,
                      relatedToPortfolio: relatedToPortfolio,
                    )
                  else
                    message,
              ],
              phase: ChatSessionPhase.idle,
            );
        }
      }
    } on AppException catch (error) {
      state = state.copyWith(
        messages: [
          for (final message in state.messages)
            if (message.id == thinking.id)
              message.copyWith(
                status: ChatMessageStatus.failed,
                text: error.userMessage,
              )
            else
              message,
        ],
        phase: error is RateLimitExceededException
            ? ChatSessionPhase.limitReached
            : ChatSessionPhase.idle,
        failure: ChatFailure(
          errorCode: error.errorCode,
          userMessage: error.userMessage,
        ),
      );
    }
  }

  /// Повтор последнего вопроса (после ошибки).
  Future<void> retryLast() async {
    final lastUser = [
      for (final message in state.messages.reversed)
        if (message.role == ChatRole.user) message,
    ].firstOrNull;
    if (lastUser == null) return;
    await sendText(lastUser.text, context: lastUser.context);
  }

  /// Быстрый вопрос (чип Quick Actions) — без контекста.
  Future<void> sendQuickAction(String question) => sendText(question);

  /// Подсказка после ответа Coach — вопрос без контекста.
  Future<void> sendSuggestedReply(String question) => sendText(question);

  /// Скрыть paywall («Позже»); лимит при этом остаётся.
  void dismissLimitReached() {
    if (state.phase == ChatSessionPhase.limitReached) {
      state = state.copyWith(phase: ChatSessionPhase.idle);
    }
  }

  /// Голосовой режим активен — текстовый ввод блокируем.
  bool get _isBusy {
    final phase = state.phase;
    return phase == ChatSessionPhase.thinking ||
        phase == ChatSessionPhase.streaming ||
        phase == ChatSessionPhase.voice;
  }

  String _nextId(String prefix) =>
      '${prefix}_${DateTime.now().millisecondsSinceEpoch}_${_uidCounter++}';
}
