import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/data/dto/chat_dto.dart';
import 'package:investcoach/data/mappers/chat_mapper.dart';
import 'package:investcoach/domain/entities/chat_stream_event.dart';

void main() {
  group('ChatCompletionEventDto.toDomain', () {
    test('событие content → ChatChunkEvent', () {
      const dto = ChatCompletionEventDto(
        type: 'content',
        content: 'Привет',
        isFinal: false,
      );
      final event = dto.toDomain();
      expect(event, isA<ChatChunkEvent>());
      final chunk = event! as ChatChunkEvent;
      expect(chunk.content, 'Привет');
      expect(chunk.isFinal, isFalse);
    });

    test('content с пустым текстом → null (UI игнорирует)', () {
      expect(
        const ChatCompletionEventDto(type: 'content', content: '')
            .toDomain(),
        isNull,
      );
      expect(
        const ChatCompletionEventDto(type: 'content').toDomain(),
        isNull,
      );
    });

    test('событие final → ChatCompletedEvent со всеми полями', () {
      const dto = ChatCompletionEventDto(
        type: 'final',
        messageId: 'msg_1',
        content: 'Готово',
        suggestedActions: [
          SuggestedActionDto(text: 'Дальше', action: 'follow_up'),
        ],
        biasDetected: ['recency_bias'],
        relatedToPortfolio: true,
      );
      final event = dto.toDomain();
      expect(event, isA<ChatCompletedEvent>());
      final completed = event! as ChatCompletedEvent;
      expect(completed.messageId, 'msg_1');
      expect(completed.content, 'Готово');
      expect(completed.suggestedActions.single.text, 'Дальше');
      expect(completed.suggestedActions.single.action, 'follow_up');
      expect(completed.biasDetected, ['recency_bias']);
      expect(completed.relatedToPortfolio, isTrue);
    });

    test('неизвестный тип события → null', () {
      expect(
        const ChatCompletionEventDto(type: 'keepalive').toDomain(),
        isNull,
      );
    });

    test('snake_case-JSON → final-событие (контракт backend)', () {
      final dto = ChatCompletionEventDto.fromJson({
        'type': 'final',
        'message_id': 'm1',
        'content': 'text',
        'is_final': true,
        'suggested_actions': [
          {'text': 'q', 'action': 'follow_up'},
        ],
        'bias_detected': ['b'],
        'related_to_portfolio': false,
      });
      final event = dto.toDomain()! as ChatCompletedEvent;
      expect(event.messageId, 'm1');
      expect(event.content, 'text');
      expect(event.suggestedActions.single.text, 'q');
      expect(event.biasDetected, ['b']);
      expect(event.relatedToPortfolio, isFalse);
    });
  });

  group('ChatVoiceResponseDto.toDomain', () {
    test('все поля переносятся в сущность', () {
      const dto = ChatVoiceResponseDto(
        transcript: 'question',
        responseText: 'answer',
        audioUrl: 'https://x/a.mp3',
        suggestedReplies: ['r1'],
        biasDetected: ['b1'],
      );
      final domain = dto.toDomain();
      expect(domain.transcript, 'question');
      expect(domain.responseText, 'answer');
      expect(domain.audioUrl, 'https://x/a.mp3');
      expect(domain.suggestedReplies, ['r1']);
      expect(domain.biasDetected, ['b1']);
    });

    test('audioUrl может быть null (TTS не подключён)', () {
      const dto = ChatVoiceResponseDto(transcript: 'q', responseText: 'a');
      expect(dto.toDomain().audioUrl, isNull);
    });
  });
}
