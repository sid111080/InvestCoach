import 'package:flutter_tts/flutter_tts.dart';

import '../../domain/services/speech_synthesizer.dart';

/// TTS на системном синтезаторе (`flutter_tts`).
///
/// Аудио ElevenLabs ([audioUrl]) пока не проигрываем
/// (нет audio-плеера в стеке): озвучиваем текст,
/// а URL храним в сессии для будущей реализации.
final class FlutterTtsSynthesizer implements SpeechSynthesizer {
  FlutterTtsSynthesizer({FlutterTts? tts})
    : _tts = tts ?? FlutterTts();

  final FlutterTts _tts;

  @override
  Future<void> speak(String text, {String? audioUrl}) async {
    if (text.trim().isEmpty) return;
    await _tts.setLanguage('ru-RU');
    await _tts.setSpeechRate(0.95);
    await _tts.setVolume(1.0);
    // Фьючер завершается при окончании озвучивания.
    await _tts.speak(text);
  }

  @override
  Future<void> stop() async {
    await _tts.stop();
  }

  @override
  Future<void> dispose() async {
    await _tts.stop();
  }
}
