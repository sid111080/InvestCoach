import 'dart:async';

import '../../domain/services/speech_synthesizer.dart';
import '../../domain/services/speech_transcriber.dart';

/// Демо-вопрос голосового режима (из ТЗ).
const String kDemoVoiceTranscript = 'Какие сегодня новости по Селигдару?';

/// Demo-mock распознавания: «слышит» вопрос в течение
/// [partialDelay], затем возвращает демо-транскрипцию.
///
/// Работает без микрофона — для mock-режима
/// (во флаг `useRealServices`) и widget-тестов.
final class MockSpeechTranscriber implements SpeechTranscriber {
  MockSpeechTranscriber({
    this.partialDelay = const Duration(milliseconds: 500),
    this.finalDelay = const Duration(milliseconds: 1200),
    this.transcript = kDemoVoiceTranscript,
  });

  final Duration partialDelay;
  final Duration finalDelay;
  final String transcript;

  final StreamController<String> _partial =
      StreamController<String>.broadcast();
  final StreamController<String> _final =
      StreamController<String>.broadcast();
  Timer? _partialTimer;
  Timer? _finalTimer;
  bool _active = false;

  @override
  bool get isAvailable => true;

  @override
  Future<bool> start() async {
    if (_active) return true;
    _active = true;
    _partialTimer = Timer(partialDelay, () => _safeAdd(_partial, transcript));
    _finalTimer = Timer(finalDelay, () => _emitFinal());
    return true;
  }

  void _emitFinal() {
    _active = false;
    _partialTimer?.cancel();
    _finalTimer?.cancel();
    if (!_final.isClosed) _final.add(transcript);
  }

  @override
  Stream<String> get partialTranscripts => _partial.stream;

  @override
  Stream<String> get finalTranscripts => _final.stream;

  @override
  Future<void> stop() async {
    // Если «фраза» уже началась — считаем её уловленной.
    _emitFinal();
  }

  @override
  Future<void> dispose() async {
    _active = false;
    _partialTimer?.cancel();
    _finalTimer?.cancel();
    if (!_partial.isClosed) await _partial.close();
    if (!_final.isClosed) await _final.close();
  }

  void _safeAdd(StreamController<String> controller, String value) {
    if (!controller.isClosed) controller.add(value);
  }
}

/// Demo-mock синтеза: «озвучивает» ответ [speakDuration],
/// после чего фьючер завершается (или раньше — при [stop]).
final class MockSpeechSynthesizer implements SpeechSynthesizer {
  MockSpeechSynthesizer({
    this.speakDuration = const Duration(milliseconds: 1500),
  });

  final Duration speakDuration;

  Completer<void>? _done;
  Timer? _timer;
  bool _stopped = false;

  @override
  Future<void> speak(String text, {String? audioUrl}) async {
    if (text.trim().isEmpty || _stopped) return;
    final done = Completer<void>();
    _done = done;
    _timer = Timer(speakDuration, _complete);
    return done.future;
  }

  void _complete() {
    _timer?.cancel();
    final done = _done;
    if (done != null && !done.isCompleted) done.complete();
  }

  @override
  Future<void> stop() async {
    _stopped = true;
    _complete();
  }

  @override
  Future<void> dispose() async {
    _stopped = true;
    _complete();
  }
}
