import 'dart:convert';

/// Построчный парсер Server-Sent Events.
///
/// Протокол SSE: событие заканчивается пустой строкой; данные
/// передаются строками `data: …` (несколько строк — склеиваются
/// через `\n`). Комментарии (`: …`) и прочие поля (`event:`,
/// `id:`, `retry:`) не используются и пропускаются.
///
/// Чистый класс без зависимостей — удобный для юнит-тестов
/// фрагмент конвейера `SSE → JSON → DTO`.
final class SseEventParser {
  /// Не завершённая строка на границе чанков.
  final StringBuffer _lineBuffer = StringBuffer();

  /// Строки `data` текущего события.
  final List<String> _dataLines = [];

  /// Покормить чанком текста; вернуть разобранные JSON-объекты.
  List<Map<String, dynamic>> feed(String chunk) {
    final events = <Map<String, dynamic>>[];
    final text = _lineBuffer.toString() + chunk;
    _lineBuffer.clear();

    final lines = text.split(RegExp(r'\r\n|\r|\n'));
    // Последний фрагмент может быть строкой, дописанной
    // следующим чанком, — держим в буфере.
    _lineBuffer.write(lines.last);

    for (final line in _linesExceptLast(lines)) {
      if (line.isEmpty) {
        _dispatch(events);
        continue;
      }
      if (line.startsWith(':')) continue; // комментарий
      if (line.startsWith('data:')) {
        final value = line.substring('data:'.length);
        _dataLines.add(value.startsWith(' ') ? value.substring(1) : value);
      }
      // Остальные поля протокола (event/id/retry) не нужны.
    }
    return events;
  }

  /// Завершение потока: отдать событие, дописанное
  /// без завершающей пустой строки.
  List<Map<String, dynamic>> finish() {
    final events = <Map<String, dynamic>>[];
    _dispatch(events);
    return events;
  }

  Iterable<String> _linesExceptLast(List<String> lines) {
    if (lines.length <= 1) return const <String>[];
    return lines.sublist(0, lines.length - 1);
  }

  void _dispatch(List<Map<String, dynamic>> events) {
    if (_dataLines.isEmpty) return;
    final data = _dataLines.join('\n');
    _dataLines.clear();

    final trimmed = data.trim();
    if (trimmed.isEmpty || trimmed == '[DONE]') return;
    try {
      final decoded = json.decode(trimmed);
      if (decoded is Map<String, dynamic>) events.add(decoded);
    } on FormatException {
      // Не JSON — событие пропускаем (защита от гадостей потока).
    }
  }
}
