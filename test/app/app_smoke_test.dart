import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/app.dart';
import 'package:investcoach/core/analytics/analytics_service.dart';
import 'package:investcoach/core/config/app_config.dart';
import 'package:investcoach/core/providers/app_providers.dart';
import 'package:investcoach/core/providers/repository_providers.dart';
import 'package:investcoach/features/coach/presentation/coach_home_screen.dart';
import 'package:investcoach/features/news/presentation/news_screen.dart';
import 'package:investcoach/features/portfolio/presentation/portfolio_screen.dart';
import 'package:investcoach/shared/onboarding/onboarding_state_repository.dart';

void main() {
  // Тестируем приложение в mock-режиме, как при штатном старте (см. main).
  // Онбординг считается пройденным — тесты проверяют главный экран.
  Widget buildApp() {
    final config = AppConfig.fromEnv();
    return ProviderScope(
      overrides: [
        appConfigProvider.overrideWithValue(config),
        onboardingStateRepositoryProvider.overrideWithValue(
          InMemoryOnboardingState(
            completed: true,
            storedName: 'Алексей',
          ),
        ),
        // В тесте DI (get_it) не инициализируется.
        analyticsServiceProvider
            .overrideWithValue(const DebugAnalyticsService()),
      ],
      child: const InvestCoachApp(),
    );
  }

  testWidgets(
    'Приложение стартует: 5 вкладок, активна Coach',
    (tester) async {
      await tester.pumpWidget(buildApp());
      await tester.pumpAndSettle();

      // Нижняя навигация с 5 вкладками.
      expect(find.byType(NavigationBar), findsOneWidget);
      expect(find.byType(CoachHomeScreen), findsOneWidget);
      // Метки вкладок ищем в рамках навигации: на самом экране
      // может дублироваться текст (например, заголовок-плейсхолдер).
      final navBar = find.byType(NavigationBar);
      for (final label in ['Коуч', 'Новости', 'Портфель', 'Обучение', 'Профиль']) {
        expect(
          find.descendant(of: navBar, matching: find.text(label)),
          findsOneWidget,
        );
      }
    },
  );

  testWidgets(
    'Переключение вкладок через нижнюю навигацию',
    (tester) async {
      await tester.pumpWidget(buildApp());
      await tester.pumpAndSettle();

      // Тапаем по меткам внутри нижней навигации: те же строки
      // дублируются заголовками экранов-плейсхолдеров.
      Finder tab(String label) => find.descendant(
            of: find.byType(NavigationBar),
            matching: find.text(label),
          );

      await tester.tap(tab('Новости'));
      await tester.pumpAndSettle();
      expect(find.byType(NewsScreen), findsOneWidget);

      await tester.tap(tab('Портфель'));
      await tester.pumpAndSettle();
      expect(find.byType(PortfolioScreen), findsOneWidget);

      await tester.tap(tab('Коуч'));
      await tester.pumpAndSettle();
      expect(find.byType(CoachHomeScreen), findsOneWidget);
    },
  );
}
