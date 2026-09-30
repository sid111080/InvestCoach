import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/app.dart';
import 'package:investcoach/core/analytics/analytics_service.dart';
import 'package:investcoach/core/config/app_config.dart';
import 'package:investcoach/core/providers/app_providers.dart';
import 'package:investcoach/core/providers/repository_providers.dart';
import 'package:investcoach/data/repos/mock_auth_repository.dart';
import 'package:investcoach/domain/entities/user_preferences.dart';
import 'package:investcoach/features/auth/presentation/onboarding/onboarding_flow_screen.dart';
import 'package:investcoach/features/coach/presentation/coach_home_screen.dart';
import 'package:investcoach/shared/onboarding/onboarding_state_repository.dart';

/// Запускает приложение с подменёнными репозиториями.
Widget buildApp({required OnboardingStateRepository onboarding}) {
  final config = AppConfig.fromEnv();
  return ProviderScope(
    overrides: [
      appConfigProvider.overrideWithValue(config),
      onboardingStateRepositoryProvider.overrideWithValue(onboarding),
      // Нулевая задержка, чтобы mock «создавал» аккаунт мгновенно.
      authRepositoryProvider.overrideWithValue(
        MockAuthRepository(latency: Duration.zero),
      ),
      // В тесте DI (get_it) не инициализируется.
      analyticsServiceProvider.overrideWithValue(
        const DebugAnalyticsService(),
      ),
    ],
    child: const InvestCoachApp(),
  );
}

void main() {
  /// Шаг «риск + стиль» не влезает в стандартные 800×600:
  /// увеличиваем высоту, чтобы карточки были видны без скролла.
  void enlargeViewport(WidgetTester tester) {
    tester.view.physicalSize = const Size(800, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
  }

  testWidgets(
    'новое приложение открывается на онбординге (шаг 1)',
    (tester) async {
      enlargeViewport(tester);
      await tester.pumpWidget(
        buildApp(onboarding: InMemoryOnboardingState()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(OnboardingFlowScreen), findsOneWidget);
      expect(find.text('Познакомься со своим Coach'), findsOneWidget);
      expect(find.text('Шаг 1 из 5'), findsOneWidget);
      // Кнопка назад на первом шаге скрыта.
      expect(find.byKey(const Key('onboardingBack')), findsNothing);
    },
  );

  testWidgets(
    'короткое имя не пускает дальше и показывает ошибку',
    (tester) async {
      enlargeViewport(tester);
      await tester.pumpWidget(
        buildApp(onboarding: InMemoryOnboardingState()),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Давай начнём'));
      await tester.pumpAndSettle();
      expect(find.text('Как тебя зовут?'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'А');
      await tester.tap(find.text('Продолжить'));
      await tester.pumpAndSettle();

      expect(find.text('Введи имя — минимум 2 символа'), findsOneWidget);
      expect(find.text('Твой опыт в инвестициях'), findsNothing);
    },
  );

  testWidgets(
    'кнопка «Назад» возвращает на предыдущий шаг',
    (tester) async {
      enlargeViewport(tester);
      await tester.pumpWidget(
        buildApp(onboarding: InMemoryOnboardingState()),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Давай начнём'));
      await tester.pumpAndSettle();
      expect(find.text('Как тебя зовут?'), findsOneWidget);

      await tester.tap(find.byKey(const Key('onboardingBack')));
      await tester.pumpAndSettle();

      expect(find.text('Познакомься со своим Coach'), findsOneWidget);
      expect(find.text('Шаг 1 из 5'), findsOneWidget);
    },
  );

  testWidgets(
    'полный прогон: имя → опыт → цели → риск/стиль → Coach создан, '
    'флаг сохранён и приложение переходит на главный экран',
    (tester) async {
      enlargeViewport(tester);
      final onboarding = InMemoryOnboardingState();
      await tester.pumpWidget(buildApp(onboarding: onboarding));
      await tester.pumpAndSettle();

      // Шаг 2: имя.
      await tester.tap(find.text('Давай начнём'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'Алексей');
      await tester.tap(find.text('Продолжить'));
      await tester.pumpAndSettle();
      expect(find.text('Твой опыт в инвестициях'), findsOneWidget);
      expect(find.text('Шаг 3 из 5'), findsOneWidget);

      // Шаг 3: опыт (выбираем «Понимаю основы»).
      await tester.tap(find.text('Понимаю основы'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Продолжить'));
      await tester.pumpAndSettle();
      expect(find.text('Что тренируем?'), findsOneWidget);

      // Шаг 4: цели (мультивыбор из двух).
      await tester.tap(find.text('Понимать новости рынка'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Замечать свои ошибки'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Продолжить'));
      await tester.pumpAndSettle();
      expect(find.text('Насколько ты смелый?'), findsOneWidget);
      expect(find.text('Шаг 5 из 5'), findsOneWidget);

      // Шаг 5: риск + стиль.
      await tester.tap(find.text('Смелый'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Кратко, по сути'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Создать Coach'));
      await tester.pumpAndSettle();

      // Анимация «Создаём твоего Coach…» (≥ 2 с):
      // pumpAndSettle чистые таймеры не двигает — проматываем явно.
      expect(find.text('Создаём твоего Coach…'), findsOneWidget);
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      // Сохранённые локально ответы.
      expect(onboarding.completed, isTrue);
      expect(onboarding.storedName, 'Алексей');
      final prefs = onboarding.storedPreferences;
      expect(
        prefs,
        const UserPreferences(
          experienceLevel: ExperienceLevel.intermediate,
          mainGoals: [MainGoal.marketUnderstanding, MainGoal.biasControl],
          riskTolerance: RiskTolerance.aggressive,
          communicationStyle: CommunicationStyle.concise,
        ),
      );

      // Роутер перенаправил на главный экран.
      expect(find.byType(CoachHomeScreen), findsOneWidget);
      expect(find.byType(OnboardingFlowScreen), findsNothing);
    },
  );
}
