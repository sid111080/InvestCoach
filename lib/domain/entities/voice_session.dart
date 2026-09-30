import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_session.dart';

part 'voice_session.freezed.dart';

/// Фаза голосовой сессии (fullscreen-оверлей).
enum VoiceSessionPhase {
  /// Микрофон открыт: идёт распознавание речи.
  listening,

  /// Вопрос отправлен: Coach думает.
  processing,

  /// Ответ получен: озвучиваем + показываем текст.
  speaking,

  /// Готово: финальный текст + suggested replies.
  done,

  /// Сбой (ошибка сети / LLM / лимит) — экран с retry.
  failed,
}

/// Состояние голосовой сессии.
@freezed
sealed class VoiceSession with _$VoiceSession {
  const factory VoiceSession({
    @Default(VoiceSessionPhase.listening) VoiceSessionPhase phase,

    /// Распознанный текст (в mock-режиме — демо-транскрипция).
    @Default('') String transcript,

    /// Текст ответа Coach (пока пуст до `speaking`).
    @Default('') String responseText,

    String? audioUrl,
    @Default(<String>[]) List<String> suggestedReplies,
    @Default(<String>[]) List<String> biasDetected,
    ChatFailure? failure,
  }) = _VoiceSession;

  const VoiceSession._();
}
