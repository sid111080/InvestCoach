import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/providers/app_providers.dart';
import 'core/router/app_router.dart';
import 'core/router/onboarding_state_flag.dart';
import 'core/router/theme_selected_flag.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'l10n/app_localizations.dart';

/// Корневой виджет InvestCoach: тёмная тема + GoRouter.
class InvestCoachApp extends ConsumerWidget {
  const InvestCoachApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appConfigProvider); // фиксируем конфиг в дереве
    final onboardingFlag = ref.watch(onboardingStateFlagProvider);
    final themeFlag = ref.watch(themeSelectedFlagProvider);
    final palette = ref.watch(themePaletteProvider);

    final theme = buildAppTheme(palette);

    return ThemeProvider(
      palette: palette,
      child: MaterialApp.router(
        title: 'InvestCoach',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: theme,
        themeMode: ThemeMode.dark,
        locale: const Locale('ru'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: createAppRouter(
          onboardingFlag: onboardingFlag,
          themeFlag: themeFlag,
        ),
      ),
    );
  }
}
