import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/core/providers/repository_providers.dart';
import 'package:investcoach/data/services/mock_notification_service.dart';
import 'package:investcoach/data/services/mock_subscription_service.dart';
import 'package:investcoach/domain/entities/app_user.dart';
import 'package:investcoach/domain/entities/subscription_status.dart';
import 'package:investcoach/domain/entities/user_stats.dart';
import 'package:investcoach/features/profile/presentation/profile_screen.dart';
import 'package:investcoach/l10n/app_localizations.dart';

void main() {
  Widget wrap(Widget child) {
    return ProviderScope(
      overrides: [
        currentUserProvider.overrideWith((ref) async => AppUser(
              id: 'usr_test',
              name: 'Алексей',
              tier: UserTier.free,
              createdAt: DateTime(2026, 9, 1),
            )),
        userStatsProvider.overrideWith((ref) async => const UserStats(
              currentStreak: 12,
              avgInteractionsPerDay: 6.3,
              topTopics: ['Акции', 'Облигации', 'Дивиденды'],
              biasPatterns: ['FOMO', 'Loss Aversion'],
              activeDays: 23,
            )),
        subscriptionStatusProvider.overrideWith((ref) async =>
            const SubscriptionStatus(
              tier: UserTier.free,
              pullRequestsLeft: 3,
              pullRequestsLimit: 8,
              canUpgradeTo: UserTier.newsPlus,
            )),
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
        home: child,
      ),
    );
  }

  group('ProfileScreen', () {
    testWidgets('показывает имя и бейдж тарифа', (tester) async {
      await tester.pumpWidget(wrap(const ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Алексей'), findsOneWidget);
      expect(find.text('Free'), findsOneWidget);
    });

    testWidgets('показывает статистику', (tester) async {
      await tester.pumpWidget(wrap(const ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Статистика за 30 дней'), findsOneWidget);
      expect(find.text('12 дн. подряд'), findsOneWidget);
      expect(find.text('6 взаимодействий'), findsOneWidget);
    });

    testWidgets('показывает любимые темы', (tester) async {
      await tester.pumpWidget(wrap(const ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Любимые темы'), findsOneWidget);
      expect(find.text('Акции'), findsOneWidget);
      expect(find.text('Облигации'), findsOneWidget);
      expect(find.text('Дивиденды'), findsOneWidget);
    });

    testWidgets('показывает секцию «Мой Coach»', (tester) async {
      await tester.pumpWidget(wrap(const ProfileScreen()));
      await tester.pumpAndSettle();

      // Скроллим вниз, чтобы увидеть секцию Coach
      await tester.drag(find.byType(ListView), const Offset(0, -400));
      await tester.pumpAndSettle();

      expect(find.text('Мой Coach'), findsOneWidget);
      expect(find.text('Стиль общения'), findsOneWidget);
      expect(find.text('Подробно, с примерами'), findsOneWidget);
      expect(find.text('Кратко, по сути'), findsOneWidget);
    });

    testWidgets('показывает лимиты Free', (tester) async {
      await tester.pumpWidget(wrap(const ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Осталось вопросов: 3 из 8'), findsOneWidget);
    });

    testWidgets('показывает кнопку апгрейда для Free', (tester) async {
      await tester.pumpWidget(wrap(const ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.text('News+ за 149 ₽/мес'), findsOneWidget);
      expect(find.text('Перейти на News+'), findsOneWidget);
    });

    testWidgets('показывает фичи News+', (tester) async {
      await tester.pumpWidget(wrap(const ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Безлимитные Pull-запросы'), findsOneWidget);
      expect(find.text('Все микро-уроки и разборы'), findsOneWidget);
      expect(find.text('Приоритетная очередь Coach'), findsOneWidget);
    });

    testWidgets('показывает push-настройки', (tester) async {
      await tester.pumpWidget(wrap(const ProfileScreen()));
      await tester.pumpAndSettle();

      // Скроллим вниз
      await tester.drag(find.byType(ListView), const Offset(0, -600));
      await tester.pumpAndSettle();

      expect(find.text('Push-уведомления'), findsOneWidget);
      expect(find.text('Новость дня'), findsOneWidget);
      expect(find.text('Weekly Review готов'), findsOneWidget);
      expect(find.text('Новый урок'), findsOneWidget);
    });

    testWidgets('показывает «О приложении»', (tester) async {
      await tester.pumpWidget(wrap(const ProfileScreen()));
      await tester.pumpAndSettle();

      // Скроллим до конца
      await tester.drag(find.byType(ListView), const Offset(0, -800));
      await tester.pumpAndSettle();

      expect(find.text('О приложении'), findsOneWidget);
      expect(find.text('Версия 1.0.0'), findsOneWidget);
    });
  });
}
