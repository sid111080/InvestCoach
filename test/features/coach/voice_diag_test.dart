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
  final morning = DateTime(2026, 9, 30, 9, 30);

  Widget buildScreen({DateTime? now}) {
    final config = AppConfig.fromEnv();
    return ProviderScope(
      overrides: [
        appConfigProvider.overrideWithValue(config),
        onboardingStateRepositoryProvider.overrideWithValue(
          InMemoryOnboardingState(completed: true, storedName: 'Алексей'),
        ),
        analyticsServiceProvider.overrideWithValue(const DebugAnalyticsService()),
        speechTranscriberProvider.overrideWithValue(MockSpeechTranscriber()),
        speechSynthesizerProvider.overrideWithValue(MockSpeechSynthesizer()),
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
        home: AppShell(location: '/coach', child: CoachHomeScreen(now: now)),
      ),
    );
  }

  testWidgets('diag', (tester) async {
    tester.view.physicalSize = const Size(800, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(buildScreen(now: morning));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.mic));
    await tester.pump();
    debugPrint('STEP after tap: listening=${find.text('Слушаю тебя…').evaluate().length} '
        'processing=${find.text('Coach разбирает вопрос…').evaluate().length} '
        'speaking=${find.text('Coach отвечает').evaluate().length} '
        'done=${find.text('Спросить ещё').evaluate().length}');

    await tester.pump(const Duration(milliseconds: 1200));
    debugPrint('STEP +1200 (final): processing=${find.text('Coach разбирает вопрос…').evaluate().length} '
        'speaking=${find.text('Coach отвечает').evaluate().length} '
        'done=${find.text('Спросить ещё').evaluate().length}');

    await tester.pump(const Duration(milliseconds: 1700));
    debugPrint('STEP +2900 (resp): speaking=${find.text('Coach отвечает').evaluate().length} '
        'done=${find.text('Спросить ещё').evaluate().length}');

    await tester.pump(const Duration(milliseconds: 1500));
    debugPrint('STEP +4400 (tts): done=${find.text('Спросить ещё').evaluate().length} '
        'close=${find.text('Закрыть').evaluate().length}');
  });
}
