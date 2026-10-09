import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/l10n/app_localizations.dart';
import 'package:investcoach/shared/widgets/offline_banner.dart';

void main() {
  Widget wrap(Widget child, {bool online = true}) {
    return ProviderScope(
      overrides: [
        isOnlineProvider.overrideWith((ref) => Stream.value(online)),
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
        home: Scaffold(body: child),
      ),
    );
  }

  group('OfflineBanner', () {
    testWidgets('Online: баннер не показывается', (tester) async {
      await tester.pumpWidget(wrap(const OfflineBanner(), online: true));
      await tester.pumpAndSettle();

      expect(find.textContaining('Вы оффлайн'), findsNothing);
    });

    testWidgets('Offline: баннер показывается', (tester) async {
      await tester.pumpWidget(wrap(const OfflineBanner(), online: false));
      await tester.pumpAndSettle();

      expect(find.textContaining('Вы оффлайн'), findsOneWidget);
      expect(find.byIcon(Icons.cloud_off), findsOneWidget);
    });
  });
}
