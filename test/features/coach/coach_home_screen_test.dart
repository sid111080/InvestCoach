import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/core/analytics/analytics_service.dart';
import 'package:investcoach/core/config/app_config.dart';
import 'package:investcoach/core/providers/app_providers.dart';
import 'package:investcoach/core/providers/repository_providers.dart';
import 'package:investcoach/core/router/app_shell.dart';
import 'package:investcoach/data/services/mock_speech_services.dart';
import 'package:investcoach/features/coach/presentation/coach_home_screen.dart';
import 'package:investcoach/l10n/app_localizations.dart';
import 'package:investcoach/shared/onboarding/onboarding_state_repository.dart';

void main() {
  // Экран рендерим напрямую: контроллируем время (greeting)
  // и используем mock-репозитории, как при штатном старте.
  // `voice: true` — подменяет голосовые сервисы на mock (DI не инициализирован).
  Widget buildScreen({DateTime? now, bool voice = false}) {
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
        if (voice) ...[
          speechTranscriberProvider.overrideWithValue(
            MockSpeechTranscriber(),
          ),
          speechSynthesizerProvider.overrideWithValue(
            MockSpeechSynthesizer(),
          ),
        ],
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
        // Как в реальном приложении: экран — внутри AppShell
        // (Scaffold нужен для snackbar и Material-предков).
        home: AppShell(
          location: '/coach',
          child: CoachHomeScreen(now: now),
        ),
      ),
    );
  }

  /// 09:30 — «Доброе утро».
  final morning = DateTime(2026, 9, 30, 9, 30);

  /// Стандартный 800×600 не вмещает весь контент вертикального
  /// скролла: увеличиваем высоту, как в тесте онбординга.
  void enlargeViewport(WidgetTester tester) {
    tester.view.physicalSize = const Size(800, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
  }

  testWidgets(
    'First Launch: приветствие, карточка дня, quick actions, '
    'микрофон, портфель и приветствие Coach',
    (tester) async {
      enlargeViewport(tester);
      await tester.pumpWidget(buildScreen(now: morning));
      await tester.pumpAndSettle();

      // Шапка: приветствие по времени + аватар Coach «Онлайн».
      expect(find.text('Доброе утро, Алексей!'), findsOneWidget);
      expect(find.text('Онлайн'), findsOneWidget);

      // Карточка «Сегодня важно» (mock-новость Сбера).
      expect(find.text('СЕГОДНЯ ВАЖНО'), findsOneWidget);
      expect(find.textContaining('Сбер отчитался'), findsOneWidget);
      expect(find.textContaining('Влияет на твой портфель'), findsOneWidget);
      expect(find.text('Обсудить с Coach'), findsOneWidget);

      // Quick Actions.
      expect(find.text('Быстрые вопросы'), findsOneWidget);
      expect(find.text('Что сегодня на рынке?'), findsOneWidget);

      // Микрофон — главный CTA.
      expect(find.byIcon(Icons.mic), findsOneWidget);

      // Мини-карточка портфеля.
      expect(find.text('Твой портфель'), findsOneWidget);
      expect(find.textContaining('236'), findsOneWidget);

      // First Launch: приветственное сообщение Coach.
      expect(find.textContaining('Привет, Алексей!'), findsOneWidget);

      // Input-бар.
      expect(find.byType(TextField), findsOneWidget);
    },
  );

  testWidgets(
    'Greeting: вечернее время → «Добрый вечер»',
    (tester) async {
      enlargeViewport(tester);
      await tester.pumpWidget(
        buildScreen(now: DateTime(2026, 9, 30, 21, 0)),
      );
      await tester.pumpAndSettle();
      expect(find.text('Добрый вечер, Алексей!'), findsOneWidget);
    },
  );

  testWidgets(
    'Отправка вопроса: thinking → ответ с подсказками, поле очищается',
    (tester) async {
      enlargeViewport(tester);
      await tester.pumpWidget(buildScreen(now: morning));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byType(TextField),
        'Что сегодня на рынке?',
      );
      await tester.pump();
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      // Ответ Coach про рынок (mock) с подсказками.
      expect(
        find.textContaining('ни одна новость не ломает твой портфель'),
        findsOneWidget,
      );
      expect(find.text('Расскажи про Сбер подробнее'), findsOneWidget);
      expect(find.text('Что делает ключевую ставку?'), findsOneWidget);

      // Поле ввода очищено.
      final controller = tester
          .widget<TextField>(find.byType(TextField))
          .controller as TextEditingController;
      expect(controller.text, isEmpty);
    },
  );

  testWidgets(
    '«Обсудить с Coach»: вопрос о новости + контекст + bias',
    (tester) async {
      enlargeViewport(tester);
      await tester.pumpWidget(buildScreen(now: morning));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Обсудить с Coach'));
      await tester.pumpAndSettle();

      // Вопрос пользователя сформулирован из названия новости.
      expect(find.textContaining('Расскажи про новость'), findsOneWidget);

      // Ответ Coach (mock) с bias и подсказкой.
      expect(find.textContaining('Сбер показал сильный рост'), findsOneWidget);
      expect(find.textContaining('Заметил:'), findsOneWidget);
      expect(find.text('Что такое маржа?'), findsOneWidget);
    },
  );

  testWidgets(
    'Голос: микрофон → оверлей listening → done → закрытие пишет в чат',
    (tester) async {
      enlargeViewport(tester);
      await tester.pumpWidget(buildScreen(now: morning, voice: true));
      await tester.pumpAndSettle();

      // Тап по микрофону → fullscreen-оверлей, фаза listening.
      await tester.tap(find.byIcon(Icons.mic));
      await tester.pump();
      expect(find.text('Слушаю тебя…'), findsOneWidget);

      // Явно продвигаем виртуальное время: pumpAndSettle не подходит —
      // CircularProgressIndicator в processing-фазе держит бесконечную
      // анимацию (Ticker → scheduleFrame каждый тик).
      // final(1200) + sendVoice(1600) + speak(1500) = 4300ms.
      await tester.pump(const Duration(milliseconds: 1200));
      await tester.pump(const Duration(milliseconds: 1600));
      await tester.pump(const Duration(milliseconds: 1500));
      await tester.pump();

      // Готово: ответ Coach + кнопки «Спросить ещё» / «Закрыть».
      // Текст ответа в оверлее И в чате (recordVoiceExchange) → 2 шт.
      expect(find.textContaining('Сегодня рынок спокойный'), findsNWidgets(2));
      expect(find.text('Спросить ещё'), findsOneWidget);
      expect(find.text('Закрыть'), findsOneWidget);

      // Закрытие: оверлей исчезает, обмен записан в чат.
      await tester.tap(find.text('Закрыть'));
      await tester.pumpAndSettle();
      expect(find.text('Закрыть'), findsNothing);
      expect(
        find.textContaining('Какие сегодня новости по Селигдару?'),
        findsOneWidget,
      );
      expect(
        find.textContaining('Сегодня рынок спокойный'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Голос: лимит Free исчерпан → paywall, а не оверлей',
    (tester) async {
      enlargeViewport(tester);
      await tester.pumpWidget(buildScreen(now: morning, voice: true));
      await tester.pumpAndSettle();

      // Исчерпаем лимит (8 Pull-запросов) текстовыми вопросами.
      for (var i = 1; i <= 8; i++) {
        await tester.enterText(find.byType(TextField), 'Вопрос $i');
        await tester.pump();
        await tester.tap(find.byIcon(Icons.send));
        await tester.pumpAndSettle();
      }

      // Тап по микрофону при исчерпанном лимите → paywall.
      await tester.tap(find.byIcon(Icons.mic));
      // Флешем остаточные Timer'ы из mock-сервисов (pumpAndSettle может
      // остановиться до их срабатывания, если нет scheduled frame).
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
      expect(find.text('Вопросы на сегодня закончились'), findsOneWidget);
      expect(find.text('Слушаю тебя…'), findsNothing);
    },
  );

  testWidgets(
    'Free-лимит: 9-й вопрос → мягкий paywall, «Позже» закрывает',
    (tester) async {
      enlargeViewport(tester);
      await tester.pumpWidget(buildScreen(now: morning));
      await tester.pumpAndSettle();

      // 8 разрешённых Pull-запросов.
      for (var i = 1; i <= 8; i++) {
        await tester.enterText(
          find.byType(TextField),
          'Вопрос $i',
        );
        await tester.pump();
        await tester.tap(find.byIcon(Icons.send));
        await tester.pumpAndSettle();
      }

      // 9-й вопрос → paywall.
      await tester.enterText(
        find.byType(TextField),
        'Вопрос 9',
      );
      await tester.pump();
      await tester.tap(find.byIcon(Icons.send));
      await tester.pumpAndSettle();

      expect(find.text('Вопросы на сегодня закончились'), findsOneWidget);
      expect(find.text('Перейти на News+'), findsOneWidget);

      // «Позже» закрывает оверлей.
      await tester.tap(find.text('Позже'));
      await tester.pumpAndSettle();
      expect(find.text('Вопросы на сегодня закончились'), findsNothing);
    },
  );
}
