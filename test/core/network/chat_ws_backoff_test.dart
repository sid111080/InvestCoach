import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/core/network/chat_ws_backoff.dart';

void main() {
  group('reconnectBackoff', () {
    test('экспоненциальный рост: 1с → 2с → 4с → 8с', () {
      expect(reconnectBackoff(attempt: 0), const Duration(seconds: 1));
      expect(reconnectBackoff(attempt: 1), const Duration(seconds: 2));
      expect(reconnectBackoff(attempt: 2), const Duration(seconds: 4));
      expect(reconnectBackoff(attempt: 3), const Duration(seconds: 8));
    });

    test('задержка не превышает потолок (30с)', () {
      expect(reconnectBackoff(attempt: 10), const Duration(seconds: 30));
      expect(reconnectBackoff(attempt: 100), const Duration(seconds: 30));
    });

    test('кастомные base и cap', () {
      const base = Duration(milliseconds: 100);
      const cap = Duration(seconds: 1);

      expect(
        reconnectBackoff(attempt: 0, base: base, cap: cap),
        base,
      );
      expect(
        reconnectBackoff(attempt: 2, base: base, cap: cap),
        const Duration(milliseconds: 400),
      );
      expect(
        reconnectBackoff(attempt: 5, base: base, cap: cap),
        cap,
      );
    });
  });
}
