import 'package:flutter/material.dart';

/// Вкладка нижней навигации (5 вкладок — ShellRoute).
class AppTab {
  const AppTab({
    required this.path,
    required this.name,
    required this.icon,
    required this.selectedIcon,
    required this.labelKey,
  });

  /// Маршрут вкладки, например `/coach`.
  final String path;

  /// Имя маршрута (для GoRouter).
  final String name;

  final IconData icon;

  final IconData selectedIcon;

  /// Ключ строки в arb-файле (см. [AppShell._labelFor]).
  final String labelKey;

  static const List<AppTab> all = [
    AppTab(
      path: '/coach',
      name: 'coach',
      icon: Icons.chat_bubble_outline,
      selectedIcon: Icons.chat_bubble,
      labelKey: 'tabCoach',
    ),
    AppTab(
      path: '/news',
      name: 'news',
      icon: Icons.newspaper_outlined,
      selectedIcon: Icons.newspaper,
      labelKey: 'tabNews',
    ),
    AppTab(
      path: '/portfolio',
      name: 'portfolio',
      icon: Icons.pie_chart_outline,
      selectedIcon: Icons.pie_chart,
      labelKey: 'tabPortfolio',
    ),
    AppTab(
      path: '/learning',
      name: 'learning',
      icon: Icons.school_outlined,
      selectedIcon: Icons.school,
      labelKey: 'tabLearning',
    ),
    AppTab(
      path: '/profile',
      name: 'profile',
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      labelKey: 'tabProfile',
    ),
  ];
}
