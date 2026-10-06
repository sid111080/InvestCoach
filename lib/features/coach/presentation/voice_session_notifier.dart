import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/app_exception.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/providers/repository_providers.dart';
import '../../../domain/entities/chat_session.dart';
import '../../../domain/entities/voice_session.dart';
import '../../../domain/repositories/chat_repository.dart';
import '../../../domain/services/speech_synthesizer.dart';
import '../../../domain/services/speech_transcriber.dart';
import 'chat_session_notifier.dart';

/// Провайдер голосовой сессии (fullscreen-оверлей).
///
/// Авто-dispose: живёт, пока оверлей в дереве. Повторный вход в
/// голосовой режим создаёт новую сессию (свежие потоки/состояние).
final voiceSessionProvider =
    NotifierProvider<VoiceSessionNotifier, VoiceSession>(
      VoiceSessionNotifier.new,
    );

/// Код сбоя «микрофон недоступен» (нет прав / SDK).
///
/// UI мапит его на локализированный текст (notifier не знает l10n).
const String kMicUnavailableCode = 'MIC_UNAVAILABLE';

/// Машина состояний голосового режима:
/// STT → запрос Coach → TTS → готово (с записью обмена в чат).
///
/// Не зависит от транспорта: STT/TTS — через доменные сервисы,
/// ответ Coach — через [ChatRepository.sendVoice].
final class VoiceSessionNotifier extends Notifier<VoiceSession> {
  late SpeechTranscriber _transcriber;
  late SpeechSynthesizer _synthesizer;
  StreamSubscription<String>? _partialSub;
  StreamSubscription<String>? _finalSub;
  bool _disposed = false;

  ChatRepository get _repository => ref.read(chatRepositoryProvider);

  @override
  VoiceSession build() {
    // Сервисы — синглтоны (get_it); фиксируем, чтобы [onDispose]
    // мог их остановить без обращения к ref после закрытия.
    _transcriber = ref.read(speechTranscriberProvider);
    _synthesizer = ref.read(speechSynthesizerProvider);
    ref.onDispose(() {
      _disposed = true;
      _partialSub?.cancel();
      _finalSub?.cancel();
      unawaited(_synthesizer.stop());
      unawaited(_transcriber.stop());
    });
    return const VoiceSession();
  }

  /// Открыть микрофон и начать слушать (вход + «Спросить ещё»).
  Future<void> start() async {
    if (_disposed) return;
    if (state.phase == VoiceSessionPhase.processing ||
        state.phase == VoiceSessionPhase.speaking) {
      return;
    }
    // Свежий раунд: пустые поля, фаза listening.
    state = const VoiceSession();
    _listenToTranscriber();
    final ok = await _transcriber.start();
    if (_disposed) return;
    if (!ok) {
      state = state.copyWith(
        phase: VoiceSessionPhase.failed,
        failure: const ChatFailure(
          errorCode: kMicUnavailableCode,
          userMessage: '',
        ),
      );
    }
  }

  /// Остановить слушание (тап по микрофону) — SDK шлёт финальный результат.
  Future<void> stopListening() => _transcriber.stop();

  /// Остановить озвучивание (тап по микрофону во время ответа).
  Future<void> stopSpeaking() => _synthesizer.stop();

  /// «Спросить ещё» — новый раунд слушания (сброс состояния).
  Future<void> askAgain() => start();

  /// Повтор после сбоя: нет транскрипции → заново слушать,
  /// есть транскрипция → повторить запрос к Coach.
  Future<void> retry() async {
    if (state.phase != VoiceSessionPhase.failed) return;
    final transcript = state.transcript.trim();
    if (transcript.isEmpty) {
      await start();
    } else {
      await _processTranscript(transcript);
    }
  }

  void _listenToTranscriber() {
    _partialSub?.cancel();
    _finalSub?.cancel();
    _partialSub = _transcriber.partialTranscripts.listen((text) {
      if (state.phase == VoiceSessionPhase.listening) {
        state = state.copyWith(transcript: text);
      }
    });
    _finalSub = _transcriber.finalTranscripts.listen((text) {
      final transcript = text.trim();
      if (transcript.isEmpty ||
          state.phase != VoiceSessionPhase.listening) {
        return;
      }
      unawaited(_processTranscript(transcript));
    });
  }

  Future<void> _processTranscript(String transcript) async {
    state = state.copyWith(
      phase: VoiceSessionPhase.processing,
      transcript: transcript,
    );
    final chat = ref.read(chatSessionProvider.notifier);
    // Голосовой запрос — это Pull-запрос: засчитываем в лимит Free.
    chat.registerPullRequest();
    try {
      final response = await _repository.sendVoice(transcript: transcript);
      if (_disposed || state.phase != VoiceSessionPhase.processing) return;
      state = state.copyWith(
        phase: VoiceSessionPhase.speaking,
        responseText: response.responseText,
        audioUrl: response.audioUrl,
        suggestedReplies: response.suggestedReplies,
        biasDetected: response.biasDetected,
      );
      await _synthesizer.speak(
        response.responseText,
        audioUrl: response.audioUrl,
      );
      if (_disposed || state.phase != VoiceSessionPhase.speaking) return;
      state = state.copyWith(phase: VoiceSessionPhase.done);
      chat.recordVoiceExchange(response);
    } on AppException catch (error) {
      if (_disposed) return;
      state = state.copyWith(
        phase: VoiceSessionPhase.failed,
        failure: ChatFailure(
          errorCode: error.errorCode,
          userMessage: error.userMessage,
        ),
      );
    }
  }
}
