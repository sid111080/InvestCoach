import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/core/errors/app_exception.dart';
import 'package:investcoach/core/providers/app_providers.dart';
import 'package:investcoach/core/providers/repository_providers.dart';
import 'package:investcoach/data/services/mock_speech_services.dart';
import 'package:investcoach/domain/entities/chat_context.dart';
import 'package:investcoach/domain/entities/chat_message.dart';
import 'package:investcoach/domain/entities/chat_stream_event.dart';
import 'package:investcoach/domain/entities/voice_response.dart';
import 'package:investcoach/domain/entities/voice_session.dart';
import 'package:investcoach/domain/repositories/chat_repository.dart';
import 'package:investcoach/domain/services/speech_transcriber.dart';
import 'package:investcoach/features/coach/presentation/chat_session_notifier.dart';
import 'package:investcoach/features/coach/presentation/voice_session_notifier.dart';

/// Быстрый mock репозитория: мгновенный ответ (без 800ms реального mock).
final class _FastChatRepository implements ChatRepository {
  const _FastChatRepository();

  @override
  Stream<ChatStreamEvent> sendMessage(
    String message, {
    ChatContext? context,
  }) =>
      const Stream.empty();

  @override
  Future<VoiceChatResponse> sendVoice({
    String? transcript,
    String? audioBase64,
    ChatContext? context,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 1));
    return VoiceChatResponse(
      transcript: transcript ?? '',
      responseText: 'Ответ Coach',
      suggestedReplies: const ['Подсказка 1'],
      biasDetected: const ['recency_bias'],
    );
  }
}

/// Репозиторий, который [failCount] раз падает с ошибкой сети.
final class _FailingChatRepository implements ChatRepository {
  _FailingChatRepository(this.failCount);

  int failCount;

  @override
  Stream<ChatStreamEvent> sendMessage(
    String message, {
    ChatContext? context,
  }) =>
      const Stream.empty();

  @override
  Future<VoiceChatResponse> sendVoice({
    String? transcript,
    String? audioBase64,
    ChatContext? context,
  }) async {
    if (failCount > 0) {
      failCount--;
      throw const NoInternetException();
    }
    return VoiceChatResponse(
      transcript: transcript ?? '',
      responseText: 'Ответ после retries',
    );
  }
}

ProviderContainer _buildContainer({
  SpeechTranscriber? transcriber,
  ChatRepository? repository,
}) {
  return ProviderContainer(
    overrides: [
      speechTranscriberProvider.overrideWithValue(
        transcriber ??
            MockSpeechTranscriber(
              partialDelay: const Duration(milliseconds: 1),
              finalDelay: const Duration(milliseconds: 2),
            ),
      ),
      speechSynthesizerProvider.overrideWithValue(
        MockSpeechSynthesizer(speakDuration: const Duration(milliseconds: 1)),
      ),
      chatRepositoryProvider.overrideWithValue(
        repository ?? const _FastChatRepository(),
      ),
    ],
  );
}

void main() {
  test('Полный флоу: listening → done, обмен записан в чат, +1 Pull', () async {
    final container = _buildContainer();
    addTearDown(container.dispose);

    await container.read(voiceSessionProvider.notifier).start();
    expect(
      container.read(voiceSessionProvider).phase,
      VoiceSessionPhase.listening,
    );

    // Ждём полный цикл (все задержки ~мс).
    await Future<void>.delayed(const Duration(milliseconds: 50));

    final session = container.read(voiceSessionProvider);
    expect(session.phase, VoiceSessionPhase.done);
    expect(session.transcript, kDemoVoiceTranscript);
    expect(session.responseText, 'Ответ Coach');
    expect(session.suggestedReplies, ['Подсказка 1']);
    expect(session.biasDetected, ['recency_bias']);

    // Обмен записан в чат: вопрос + ответ, засчитан Pull-запрос.
    final chat = container.read(chatSessionProvider);
    expect(chat.messages.length, 2);
    expect(chat.messages.first.role, ChatRole.user);
    expect(chat.messages.first.text, kDemoVoiceTranscript);
    expect(chat.messages.last.role, ChatRole.coach);
    expect(chat.pullRequestsUsed, 1);
  });

  test('Микрофон недоступен → failed с кодом MIC_UNAVAILABLE', () async {
    final container = _buildContainer(
      transcriber: const DisabledSpeechTranscriber(),
    );
    addTearDown(container.dispose);

    await container.read(voiceSessionProvider.notifier).start();

    final session = container.read(voiceSessionProvider);
    expect(session.phase, VoiceSessionPhase.failed);
    expect(session.failure?.errorCode, kMicUnavailableCode);
    // Pull-запрос не засчитан (микрофон не открыт).
    expect(container.read(chatSessionProvider).pullRequestsUsed, 0);
  });

  test('Сбой сети → failed; retry с транскрипцией → done', () async {
    final repository = _FailingChatRepository(1);
    final container = _buildContainer(repository: repository);
    addTearDown(container.dispose);

    final notifier = container.read(voiceSessionProvider.notifier);
    await notifier.start();
    await Future<void>.delayed(const Duration(milliseconds: 50));

    // Первый запрос упал → failed, транскрипция сохранена.
    var session = container.read(voiceSessionProvider);
    expect(session.phase, VoiceSessionPhase.failed);
    expect(session.failure?.errorCode, 'NO_INTERNET');
    expect(session.transcript, kDemoVoiceTranscript);

    // Retry: транскрипция есть → повторяем запрос → done.
    await notifier.retry();
    await Future<void>.delayed(const Duration(milliseconds: 50));

    session = container.read(voiceSessionProvider);
    expect(session.phase, VoiceSessionPhase.done);
    expect(session.responseText, 'Ответ после retries');
    // Два запроса → два Pull-запроса.
    expect(container.read(chatSessionProvider).pullRequestsUsed, 2);
  });

  test('«Спросить ещё»: новый раунд, состояние сброшено', () async {
    final container = _buildContainer();
    addTearDown(container.dispose);

    final notifier = container.read(voiceSessionProvider.notifier);
    await notifier.start();
    await Future<void>.delayed(const Duration(milliseconds: 50));
    expect(container.read(voiceSessionProvider).phase, VoiceSessionPhase.done);

    // «Спросить ещё» → сброс полей, фаза listening.
    await notifier.askAgain();
    final session = container.read(voiceSessionProvider);
    expect(session.phase, VoiceSessionPhase.listening);
    expect(session.responseText, isEmpty);
    expect(session.suggestedReplies, isEmpty);
    expect(session.failure, isNull);
  });
}
