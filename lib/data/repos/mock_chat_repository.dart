import 'dart:async';

import '../../domain/entities/chat_context.dart';
import '../../domain/entities/chat_stream_event.dart';
import '../../domain/entities/voice_response.dart';
import '../../domain/repositories/chat_repository.dart';

/// Ответ Coach: текст + подсказки для продолжения разговора.
final class _MockAnswer {
  const _MockAnswer({
    required this.text,
    required this.suggestedReplies,
    this.biasDetected = const <String>[],
    this.relatedToPortfolio = false,
  });

  final String text;
  final List<String> suggestedReplies;
  final List<String> biasDetected;
  final bool relatedToPortfolio;
}

/// Mock [ChatRepository]: реалистичные ответы Coach
/// без backend, с имитацией стриминга (чанки слов).
final class MockChatRepository implements ChatRepository {
  const MockChatRepository({
    this.latency = const Duration(milliseconds: 800),
    this.chunkLatency = const Duration(milliseconds: 90),
  });

  /// Пауза «Coach думает» перед первым чанком.
  final Duration latency;

  /// Пауза между чанками стрима.
  final Duration chunkLatency;

  @override
  Stream<ChatStreamEvent> sendMessage(
    String message, {
    ChatContext? context,
  }) {
    return Stream<ChatStreamEvent>.multi((controller) {
      var cancelled = false;
      unawaited(
        () async {
          try {
            final answer = _answerFor(message, context);
            await Future<void>.delayed(latency);
            if (cancelled) return;

            final words = answer.text.split(' ');
            final wordsPerChunk = 4;
            var text = '';
            for (var i = 0; i < words.length; i += wordsPerChunk) {
              await Future<void>.delayed(chunkLatency);
              if (cancelled) return;
              final end = (i + wordsPerChunk) > words.length
                  ? words.length
                  : i + wordsPerChunk;
              final chunk = words.sublist(i, end).join(' ');
              text = text.isEmpty ? chunk : '$text $chunk';
              controller.add(
                ChatStreamEvent.chunk(content: chunk, isFinal: false),
              );
            }
            if (cancelled) return;
            controller.add(
              ChatStreamEvent.completed(
                messageId:
                    'msg_mock_${DateTime.now().millisecondsSinceEpoch}',
                content: text,
                suggestedActions: [
                  for (final reply in answer.suggestedReplies)
                    SuggestedAction(text: reply, action: 'follow_up'),
                ],
                biasDetected: answer.biasDetected,
                relatedToPortfolio: answer.relatedToPortfolio,
              ),
            );
            controller.close();
          } catch (error, stackTrace) {
            if (cancelled) return;
            controller.addError(error, stackTrace);
            controller.close();
          }
        }(),
      );

      controller.onCancel = () => cancelled = true;
    });
  }

  @override
  Future<VoiceChatResponse> sendVoice({
    String? transcript,
    String? audioBase64,
    ChatContext? context,
  }) async {
    // Демо-режим: имитируем, что Coach «послушал» вопрос
    // про Селигдар (пример из ТЗ).
    await Future<void>.delayed(
      latency + const Duration(milliseconds: 800),
    );
    final question = transcript ?? 'Какие сегодня новости по Селигдару?';
    final answer = _answerFor(question, context);
    return VoiceChatResponse(
      transcript: question,
      responseText: answer.text,
      audioUrl: null, // ElevenLabs подключим с реальным голосом.
      suggestedReplies: answer.suggestedReplies,
      biasDetected: answer.biasDetected,
    );
  }

  _MockAnswer _answerFor(String message, ChatContext? context) {
    final text = message.trim().toLowerCase();

    // Обсуждение новости из карточки «Сегодня важно».
    if (text.contains('сбер') ||
        (context != null &&
            context.type == ChatContextType.news &&
            context.newsId == 'news_7843')) {
      return _MockAnswer(
        text:
            'Сбер показал сильный рост после отчётности: чистая прибыль +34%, '
            'но маржа сократилась на 1.8 п.п. Это значит, что банк заработал '
            'больше, но каждая операция приносит ему чуть меньше. Для твоего '
            'портфеля это позитивный сигнал: влияние на стоимость — около 8%.',
        suggestedReplies: [
          'Как это влияет на мой портфель?',
          'Что такое маржа?',
        ],
        biasDetected: const ['recency_bias'],
        relatedToPortfolio: true,
      );
    }
    if (text.contains('рынок') || text.contains('сегодня')) {
      return _MockAnswer(
        text:
            'Сегодня рынок спокойный. Главное: Сбер отчитался сильнее ожиданий, '
            'а ЦБ сохранил ключевую ставку — значит, депозиты остаются '
            'доходными. Волнения нет: ни одна новость не ломает твой портфель.',
        suggestedReplies: [
          'Расскажи про Сбер подробнее',
          'Что делает ключевую ставку?',
        ],
      );
    }
    if (text.contains('портфел')) {
      return _MockAnswer(
        text:
            'Твой портфель — 10 236 ₽, за день +1.8%. Структура выглядит '
            'здорово: 50% акции, 30% облигации, 20% фонд. Такой баланс '
            'защищает от резких движений рынка. Могу показать, как он менялся '
            'за неделю.',
        suggestedReplies: [
          'Как он менялся за неделю?',
          'Стоит ли перераспределить?',
        ],
        relatedToPortfolio: true,
      );
    }
    if (text.contains('диверсификац')) {
      return _MockAnswer(
        text:
            'Диверсификация — это «не класть все яйца в одну корзину». '
            'Если бумаги из разных отраслей и типов, падение одной '
            'компенсируется ростом других. В твоём портфеле это уже '
            'сделано: акции, облигации и фонд работают как три опоры.',
        suggestedReplies: const [
          'Объясни ещё проще',
          'Какие отрасли в моём портфеле?',
        ],
      );
    }
    return _MockAnswer(
      text:
          'Хороший вопрос. Давай разберём по шагам: сначала посмотрим, '
          'что говорит рынок, потом — что это значит для твоего портфеля, '
          'и в конце я подскажу, на что обратить внимание, чтобы не '
          'попасться на частых ошибках.',
      suggestedReplies: const [
        'А что это значит для моего портфеля?',
        'Какие ошибки я могу совершить?',
      ],
    );
  }
}
