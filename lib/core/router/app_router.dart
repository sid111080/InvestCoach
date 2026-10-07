import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/daily_news.dart';
import '../../domain/entities/micro_lesson.dart';
import '../../features/auth/presentation/onboarding/onboarding_flow_screen.dart';
import '../../features/coach/presentation/coach_home_screen.dart';
import '../../features/learning/presentation/learning_screen.dart';
import '../../features/news/presentation/news_screen.dart';
import '../../features/portfolio/presentation/portfolio_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import 'app_shell.dart';
import 'onboarding_state_flag.dart';

/// Роутер приложения.
///
/// [onboardingFlag] управляет redirect: пользователи, которые ещё не
/// прошли онбординг, всегда попадают на `/onboarding`, прошедшие —
/// на главную. Флаг — `Listenable`, поэтому при его смене
/// роутер перепроверяет маршрут сам (после завершения онбординга).
GoRouter createAppRouter({
  required OnboardingStateFlag onboardingFlag,
}) {
  return GoRouter(
    initialLocation: '/coach',
    debugLogDiagnostics: kDebugMode,
    refreshListenable: onboardingFlag,
    redirect: (context, state) {
      final atOnboarding = state.matchedLocation == '/onboarding';
      if (atOnboarding) {
        // Прошедшие не могут остаться в онбординге
        // (например, при возврате по back-stack).
        return onboardingFlag.completed ? '/coach' : null;
      }
      return onboardingFlag.completed ? null : '/onboarding';
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingFlowScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) =>
            AppShell(location: state.uri.toString(), child: child),
        routes: [
          GoRoute(
            path: '/coach',
            name: 'coach',
            builder: (context, state) {
              final extra = state.extra;
              return CoachHomeScreen(
                initialNews: extra is DailyNews ? extra : null,
                initialLesson: extra is MicroLesson ? extra : null,
              );
            },
          ),
          GoRoute(
            path: '/news',
            name: 'news',
            builder: (context, state) => const NewsScreen(),
          ),
          GoRoute(
            path: '/portfolio',
            name: 'portfolio',
            builder: (context, state) => const PortfolioScreen(),
          ),
          GoRoute(
            path: '/learning',
            name: 'learning',
            builder: (context, state) => const LearningScreen(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
