import 'dart:async';

import 'package:speech_to_text/speech_to_text.dart';

import '../../domain/services/speech_transcriber.dart';

/// STT на платформенном распознавателе (`speech_to_text` 7.x).
///
/// Язык — русский (`ru_RU`), режим диктовки: SDK сам завершает
/// фразу после паузы и шлёт финальный результат.
final class SpeechTranscriberImpl implements SpeechTranscriber {
  SpeechTranscriberImpl({SpeechToText? stt})
    : _stt = stt ?? SpeechToText();

  final SpeechToText _stt;

  /// Кэш результата проверки прав (синхронный getter [isAvailable]).
  bool _available = false;

  final StreamController<String> _partial =
      StreamController<String>.broadcast();
  final StreamController<String> _final =
      StreamController<String>.broadcast();

  @override
  bool get isAvailable => _available;

  @override
  Future<bool> start() async {
    _available = await _stt.hasPermission;
    if (!_available) return false;
    final ok = await _stt.initialize(
      onStatus: (status) {
        // Таймаут тишины: распознавание остановилось — пустой
        // финальный результат не шлём.
        if (status == 'notListening' || status == 'done') _finalize('');
      },
      onError: (error) {
        _finalize('');
      },
    );
    if (!ok) return false;
    await _stt.listen(
      onResult: (result) {
        final text = result.recognizedWords.trim();
        if (result.finalResult) {
          _finalize(text);
        } else if (text.isNotEmpty) {
          _safeAdd(_partial, text);
        }
      },
      // Диктовка: пауза после фразы = финальный результат.
      listenOptions: SpeechListenOptions(
        listenMode: ListenMode.dictation,
        partialResults: true,
        localeId: 'ru_RU',
      ),
    );
    return _available;
  }

  void _finalize(String text) {
    if (text.isEmpty) return;
    if (!_final.isClosed) _final.add(text);
    // Микрофон закрываем, а потоки держим: «Спросить ещё»
    // снова открывает микрофон — потоки закрываются только в [dispose].
    unawaited(_stt.stop());
  }

  @override
  Stream<String> get partialTranscripts => _partial.stream;

  @override
  Stream<String> get finalTranscripts => _final.stream;

  @override
  Future<void> stop() async {
    // Финальный результат придёт асинхронно через onResult
    // (finalResult); потоки не закрываем — только в [dispose].
    await _stt.stop();
  }

  @override
  Future<void> dispose() async {
    await _stt.stop();
    if (!_partial.isClosed) await _partial.close();
    if (!_final.isClosed) await _final.close();
  }

  void _safeAdd(StreamController<String> controller, String value) {
    if (!controller.isClosed) controller.add(value);
  }
}
