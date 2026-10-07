import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/core/providers/repository_providers.dart';
import 'package:investcoach/domain/entities/micro_lesson.dart';
import 'package:investcoach/domain/entities/saved_case.dart';
import 'package:investcoach/domain/entities/user_stats.dart';
import 'package:investcoach/domain/entities/weekly_review.dart';
import 'package:investcoach/features/learning/presentation/learning_screen.dart';
import 'package:investcoach/l10n/app_localizations.dart';

void main() {
  Widget wrap(Widget child) {
    return ProviderScope(
      overrides: [
        recommendedLessonsProvider.overrideWith((ref) async => [
          const MicroLesson(
            id: 'l1',
            title: 'FOMO: как заметить',
            durationSeconds: 45,
            biasTag: 'FOMO',
          ),
          const MicroLesson(
            id: 'l2',
            title: 'Диверсификация',
            durationSeconds: 60,
          ),
        ]),
        currentReviewProvider.overrideWith((ref) async => const WeeklyReview(
              week: '2026-W37',
              processScore: 7.4,
              insights: ['Хорошая диверсификация', 'FOMO: 3 раза'],
            )),
        reviewHistoryProvider.overrideWith((ref) async => const [
          WeeklyReview(
            week: '2026-W37',
            processScore: 7.4,
            insights: ['Хорошая диверсификация'],
          ),
          WeeklyReview(
            week: '2026-W36',
            processScore: 6.8,
            insights: ['Много сделок на эмоциях'],
          ),
        ]),
        savedCasesProvider.overrideWith((ref) async => [
          SavedCase(
            id: 'c1',
            topic: 'Сбер: отчёт',
            excerpt: 'Разобрали прибыль +34%',
            savedAt: DateTime.now(),
          ),
        ]),
        userStatsProvider.overrideWith((ref) async => const UserStats(
              currentStreak: 12,
              avgInteractionsPerDay: 6.3,
              topTopics: ['Акции', 'Облигации'],
              biasPatterns: ['FOMO'],
            )),
      ],
      child: MaterialApp(
        locale: const Locale('ru'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: child,
      ),
    );
  }

  group('LearningScreen', () {
    testWidgets('показывает 4 вкладки', (tester) async {
      await tester.pumpWidget(wrap(const LearningScreen()));
      await tester.pump();

      expect(find.text('Сегодня'), findsOneWidget);
      expect(find.text('Weekly Reviews'), findsOneWidget);
      expect(find.text('Мои Кейсы'), findsOneWidget);
      expect(find.text('Прогресс'), findsOneWidget);
    });

    testWidgets('вкладка «Сегодня»: показывает уроки', (tester) async {
      await tester.pumpWidget(wrap(const LearningScreen()));
      await tester.pump();

      expect(find.text('FOMO: как заметить'), findsOneWidget);
      expect(find.text('Диверсификация'), findsOneWidget);
      expect(find.text('45 сек'), findsOneWidget);
      expect(find.text('FOMO'), findsOneWidget);
    });

    testWidgets('вкладка «Сегодня»: кнопка «Пройти»', (tester) async {
      await tester.pumpWidget(wrap(const LearningScreen()));
      await tester.pump();

      expect(find.text('Пройти'), findsWidgets);
    });

    testWidgets('вкладка «Reviews»: показывает Process Score', (tester) async {
      await tester.pumpWidget(wrap(const LearningScreen()));
      await tester.pumpAndSettle();

      // Переключаемся на вкладку Reviews
      await tester.tap(find.text('Weekly Reviews'));
      await tester.pumpAndSettle();

      expect(find.text('7.4'), findsOneWidget);
      expect(find.text('/ 10'), findsOneWidget);
      expect(find.text('Process Score'), findsOneWidget);
    });

    testWidgets('вкладка «Reviews»: показывает инсайты', (tester) async {
      await tester.pumpWidget(wrap(const LearningScreen()));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Weekly Reviews'));
      await tester.pumpAndSettle();

      expect(find.text('Хорошая диверсификация'), findsOneWidget);
      expect(find.text('FOMO: 3 раза'), findsOneWidget);
    });

    testWidgets('вкладка «Кейсы»: показывает сохранённые', (tester) async {
      await tester.pumpWidget(wrap(const LearningScreen()));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Мои Кейсы'));
      await tester.pumpAndSettle();

      expect(find.text('Сбер: отчёт'), findsOneWidget);
    });

    testWidgets('вкладка «Прогресс»: показывает стрик и темы', (tester) async {
      await tester.pumpWidget(wrap(const LearningScreen()));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Прогресс'));
      await tester.pumpAndSettle();

      expect(find.text('12 дн.'), findsOneWidget);
      expect(find.text('Акции'), findsOneWidget);
      expect(find.text('Облигации'), findsOneWidget);
      expect(find.text('FOMO'), findsOneWidget);
    });
  });
}
