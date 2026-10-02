/// Синтез речи (TTS) — абстракция над платформенным синтезатором.
///
/// Реализация: `flutter_tts` (системный голос) или демо-mock
/// (mock-режим). Если [speak] получает [audioUrl] (голос
/// ElevenLabs с backend) — реализация решает, как его проиграть.
abstract interface class SpeechSynthesizer {
  /// Озвучить [text]. Фьючер завершается, когда речь закончена
  /// (сама закончилась или вызван [stop]).
  ///
  /// [audioUrl] — опциональное аудио ответа (ElevenLabs);
  /// пока его проигрывание не подключено, озвучиваем текст.
  Future<void> speak(String text, {String? audioUrl});

  /// Остановить озвучивание.
  Future<void> stop();

  /// Освободить ресурсы (вызывать при закрытии оверлея).
  Future<void> dispose();
}

/// Заглушка: синтез отключён (озвучивание мгновенно «готово»).
final class DisabledSpeechSynthesizer implements SpeechSynthesizer {
  const DisabledSpeechSynthesizer();

  @override
  Future<void> speak(String text, {String? audioUrl}) async {}

  @override
  Future<void> stop() async {}

  @override
  Future<void> dispose() async {}
}
