import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/data/sources/sse_event_parser.dart';

void main() {
  group('SseEventParser.feed', () {
    test('целое событие с завершающей пустой строкой', () {
      final parser = SseEventParser();
      expect(parser.feed('data: {"type":"content"}\n\n'), [
        {'type': 'content'},
      ]);
    });

    test('событие, разрезанное по границе чанков', () {
      final parser = SseEventParser();
      expect(parser.feed('data: {"type":'), isEmpty);
      expect(parser.feed('"content"}\n\n'), [
        {'type': 'content'},
      ]);
    });

    test('CRLF как допустимый разделитель строк', () {
      final parser = SseEventParser();
      expect(parser.feed('data: {"x":1}\r\n\r\n'), [
        {'x': 1},
      ]);
    });

    test('многострочное data склеивается через \\n', () {
      final parser = SseEventParser();
      expect(parser.feed('data: {"a":\ndata: 1}\n\n'), [
        {'a': 1},
      ]);
    });

    test('[DONE] и не-JSON данные игнорируются', () {
      final parser = SseEventParser();
      expect(parser.feed('data: [DONE]\n\ndata: not-json\n\n'), isEmpty);
    });

    test('комментарии и прочие поля протокола пропускаются', () {
      final parser = SseEventParser();
      expect(
        parser.feed(': ping\nid: 5\nevent: message\ndata: {"ok":true}\n\n'),
        [
          {'ok': true},
        ],
      );
    });

    test('несколько событий в одном чанке', () {
      final parser = SseEventParser();
      expect(parser.feed('data: {"n":1}\n\ndata: {"n":2}\n\n'), [
        {'n': 1},
        {'n': 2},
      ]);
    });
  });

  group('SseEventParser.finish', () {
    test('отдаёт событие, дописанное без завершающей пустой строки', () {
      final parser = SseEventParser();
      expect(parser.feed('data: {"n":3}\n'), isEmpty);
      expect(parser.finish(), [
        {'n': 3},
      ]);
    });

    test('без накопленных данных возвращает пустой список', () {
      expect(SseEventParser().finish(), isEmpty);
    });
  });
}
