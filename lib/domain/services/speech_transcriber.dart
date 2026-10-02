import 'dart:async';

/// Распознавание речи (STT) — абстракция над платформенным SDK.
///
/// Реализация: `speech_to_text` (режим) или демо-mock
/// (mock-режим, без backend). UI не зависит от конкретного SDK.
abstract interface class SpeechTranscriber {
  /// Доступно ли распознавание на этом устройстве.
  bool get isAvailable;

  /// Начать слушать. `true` — успешно (права получены,
  /// микрофон открыт), `false` — нельзя (нет прав/SDK).
  Future<bool> start();

  /// Промежуточные результаты: живой текст, пока человек говорит.
  Stream<String> get partialTranscripts;

  /// Финальный результат: фраза закончена (SDK сам решает,
  /// когда фраза готова, или вызван [stop]).
  Stream<String> get finalTranscripts;

  /// Остановить прослушивание. Если фраза уловлена —
  /// SDK шлёт один финальный результат.
  Future<void> stop();

  /// Освободить ресурсы (вызывать при закрытии оверлея).
  Future<void> dispose();
}

/// Заглушка: распознавание отключено.
final class DisabledSpeechTranscriber implements SpeechTranscriber {
  const DisabledSpeechTranscriber();

  @override
  bool get isAvailable => false;

  @override
  Future<bool> start() async => false;

  @override
  Stream<String> get partialTranscripts => const Stream.empty();

  @override
  Stream<String> get finalTranscripts => const Stream.empty();

  @override
  Future<void> stop() async {}

  @override
  Future<void> dispose() async {}
}
