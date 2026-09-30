import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import 'app_tabs.dart';

/// Каркас главного приложения: контент + нижняя навигация (5 вкладок).
class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.location,
    required this.child,
  });

  /// Текущий путь (передаётся из GoRouterState).
  final String location;

  final Widget child;

  int _selectedIndex() {
    for (var i = 0; i < AppTab.all.length; i++) {
      if (location.startsWith(AppTab.all[i].path)) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex(),
        onDestinationSelected: (index) =>
            context.go(AppTab.all[index].path),
        destinations: [
          for (final tab in AppTab.all)
            NavigationDestination(
              icon: Icon(tab.icon),
              selectedIcon: Icon(tab.selectedIcon),
              label: _labelFor(l10n, tab.labelKey),
            ),
        ],
      ),
    );
  }

  String _labelFor(AppLocalizations l10n, String key) => switch (key) {
        'tabCoach' => l10n.tabCoach,
        'tabNews' => l10n.tabNews,
        'tabPortfolio' => l10n.tabPortfolio,
        'tabLearning' => l10n.tabLearning,
        'tabProfile' => l10n.tabProfile,
        _ => key,
      };
}
