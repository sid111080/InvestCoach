import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/core/providers/repository_providers.dart';
import 'package:investcoach/data/services/mock_notification_service.dart';
import 'package:investcoach/data/services/mock_subscription_service.dart';
import 'package:investcoach/domain/entities/daily_news.dart';
import 'package:investcoach/features/news/presentation/news_screen.dart';
import 'package:investcoach/l10n/app_localizations.dart';
import 'package:investcoach/shared/widgets/shimmer_skeleton.dart';

void main() {
  group('NewsScreen', () {
    testWidgets('Loading: shimmer-скелетоны', (tester) async {
      // Future, который никогда не завершится — loading остаётся.
      final completer = Completer<List<DailyNews>>();
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            dailyNewsProvider.overrideWith((ref) => completer.future),
            subscriptionServiceProvider
                .overrideWithValue(MockSubscriptionService()),
            notificationServiceProvider
                .overrideWithValue(MockNotificationService()),
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
            home: const NewsScreen(),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShimmerSkeleton), findsWidgets);
    });

    testWidgets('Error: иконка + «Повторить»', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            dailyNewsProvider.overrideWith(
              (ref) async => throw Exception('Network error'),
            ),
            subscriptionServiceProvider
                .overrideWithValue(MockSubscriptionService()),
            notificationServiceProvider
                .overrideWithValue(MockNotificationService()),
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
            home: const NewsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Что-то пошло не так'), findsOneWidget);
      expect(find.text('Повторить'), findsOneWidget);
    });

    testWidgets('Empty: «Нет новостей на сегодня»', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            dailyNewsProvider.overrideWith(
              (ref) async => const <DailyNews>[],
            ),
            subscriptionServiceProvider
                .overrideWithValue(MockSubscriptionService()),
            notificationServiceProvider
                .overrideWithValue(MockNotificationService()),
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
            home: const NewsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.textContaining('Сегодня новостей пока нет'),
        findsOneWidget,
      );
    });

    testWidgets('Data: заголовок + карточки', (tester) async {
      final news = [
        DailyNews(
          id: 'n1',
          title: 'ЦБ сохранил ключевую ставку',
          summary: 'Банк России оставил ставку на уровне 16%.',
          publishedAt: DateTime(2026, 10, 9, 8),
          tags: const ['Ставка'],
        ),
        DailyNews(
          id: 'n2',
          title: 'Газпром отчитался за 3 квартал',
          summary: 'Чистая прибыль выросла на 12%.',
          publishedAt: DateTime(2026, 10, 9, 7, 30),
        ),
      ];

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            dailyNewsProvider.overrideWith((ref) async => news),
            subscriptionServiceProvider
                .overrideWithValue(MockSubscriptionService()),
            notificationServiceProvider
                .overrideWithValue(MockNotificationService()),
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
            home: const NewsScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Новости дня'), findsOneWidget);
      expect(find.text('ЦБ сохранил ключевую ставку'), findsOneWidget);
      expect(find.text('Газпром отчитался за 3 квартал'), findsOneWidget);
    });
  });
}
