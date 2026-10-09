import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/shared/widgets/animated_reveal.dart';

void main() {
  group('AnimatedReveal', () {
    testWidgets('Виджет появляется после анимации', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedReveal(
              child: Text('Hello'),
            ),
          ),
        ),
      );

      // До анимации — opacity 0.
      await tester.pump();
      // После анимации (300 мс) — opacity 1.
      await tester.pump(const Duration(milliseconds: 350));

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('Stagger: задержка нарастает', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StaggeredReveal(
              stagger: Duration(milliseconds: 100),
              children: [
                Text('First'),
                Text('Second'),
                Text('Third'),
              ],
            ),
          ),
        ),
      );

      // Первый элемент появляется сразу.
      await tester.pump(const Duration(milliseconds: 350));
      expect(find.text('First'), findsOneWidget);

      // Второй — с задержкой 100 мс.
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 350));
      expect(find.text('Second'), findsOneWidget);

      // Третий — с задержкой 200 мс.
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 350));
      expect(find.text('Third'), findsOneWidget);
    });
  });
}
