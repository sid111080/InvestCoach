import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repos/mock_auth_repository.dart';
import '../../data/repos/mock_chat_repository.dart';
import '../../data/repos/mock_learning_repository.dart';
import '../../data/repos/mock_news_repository.dart';
import '../../data/repos/mock_portfolio_repository.dart';
import '../../data/repos/mock_profile_repository.dart';
import '../../data/repos/remote_auth_repository.dart';
import '../../data/repos/remote_chat_repository.dart';
import '../../data/repos/remote_learning_repository.dart';
import '../../data/repos/remote_news_repository.dart';
import '../../data/repos/remote_portfolio_repository.dart';
import '../../data/repos/remote_profile_repository.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/entities/daily_news.dart';
import '../../domain/entities/micro_lesson.dart';
import '../../domain/entities/portfolio_summary.dart';
import '../../domain/entities/saved_case.dart';
import '../../domain/entities/subscription_status.dart';
import '../../domain/entities/user_stats.dart';
import '../../domain/entities/weekly_review.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../domain/repositories/learning_repository.dart';
import '../../domain/repositories/news_repository.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../shared/onboarding/onboarding_state_repository.dart';
import '../config/app_config.dart';
import '../di/injection_container.dart';
import '../network/api_client.dart';
import 'app_providers.dart';

/// HTTP-клиент (зарегистрирован в get_it).
final apiClientProvider =
    Provider<ApiClient>((ref) => getIt<ApiClient>());

/// Выбор реализации: mock (без backend) или remote.
bool _mock(AppConfig config) => !config.useRealServices;

/// Авторизация и предпочтения (онбординг, профиль).
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final config = ref.watch(appConfigProvider);
  if (_mock(config)) return MockAuthRepository();
  return RemoteAuthRepository(ref.watch(apiClientProvider));
});

/// Новости дня (главный экран, лента).
final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final config = ref.watch(appConfigProvider);
  if (_mock(config)) return const MockNewsRepository();
  return RemoteNewsRepository(ref.watch(apiClientProvider));
});

/// Персонализированные новости дня (карточка «Сегодня важно»).
final dailyNewsProvider =
    FutureProvider<List<DailyNews>>((ref) {
  return ref.watch(newsRepositoryProvider).fetchDaily();
});

/// Сводка портфеля (мини-карточка на главном).
final portfolioRepositoryProvider = Provider<PortfolioRepository>((ref) {
  final config = ref.watch(appConfigProvider);
  if (_mock(config)) return const MockPortfolioRepository();
  return RemotePortfolioRepository(ref.watch(apiClientProvider));
});

/// Сводка портфеля (плавающая мини-карточка на главном).
final portfolioSummaryProvider =
    FutureProvider<PortfolioSummary?>((ref) {
  return ref.watch(portfolioRepositoryProvider).fetchSummary();
});

/// Чат и голосовой режим (главный экран Coach).
final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final config = ref.watch(appConfigProvider);
  if (_mock(config)) return const MockChatRepository();
  return RemoteChatRepository(ref.watch(apiClientProvider));
});

/// Текущий пользователь (`GET /users/me`; `null` до онбординга).
final currentUserProvider = FutureProvider<AppUser?>((ref) {
  return ref.watch(authRepositoryProvider).fetchMe();
});

/// Локальное состояние онбординга (флаг + имя + предпочтения).
///
/// Реальная реализация создаётся в main после init SharedPreferences;
/// здесь подхватываем её из get_it.
final onboardingStateRepositoryProvider =
    Provider<OnboardingStateRepository>((ref) =>
        getIt<OnboardingStateRepository>());

/// Флаг «онбординг пройден» — источник redirect в роутере.
final onboardingCompletedProvider = FutureProvider<bool>((ref) {
  ref.keepAlive();
  return ref.watch(onboardingStateRepositoryProvider).isCompleted;
});

/// Обучение: уроки, Weekly Reviews, кейсы.
final learningRepositoryProvider = Provider<LearningRepository>((ref) {
  final config = ref.watch(appConfigProvider);
  if (_mock(config)) return const MockLearningRepository();
  return RemoteLearningRepository(ref.watch(apiClientProvider));
});

/// Рекомендованные микро-уроки на сегодня.
final recommendedLessonsProvider = FutureProvider<List<MicroLesson>>((ref) {
  return ref.watch(learningRepositoryProvider).fetchRecommendedLessons();
});

/// Текущий Weekly Review.
final currentReviewProvider = FutureProvider<WeeklyReview?>((ref) {
  return ref.watch(learningRepositoryProvider).fetchCurrentReview();
});

/// История Weekly Reviews.
final reviewHistoryProvider = FutureProvider<List<WeeklyReview>>((ref) {
  return ref.watch(learningRepositoryProvider).fetchReviewHistory();
});

/// Сохранённые кейсы.
final savedCasesProvider = FutureProvider<List<SavedCase>>((ref) {
  return ref.watch(learningRepositoryProvider).fetchCases();
});

/// Профиль: статистика, подписка, настройка Coach.
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final config = ref.watch(appConfigProvider);
  if (_mock(config)) return const MockProfileRepository();
  return RemoteProfileRepository(ref.watch(apiClientProvider));
});

/// Статистика пользователя за 30 дней.
final userStatsProvider = FutureProvider<UserStats>((ref) {
  return ref.watch(profileRepositoryProvider).fetchStats();
});

/// Статус подписки и лимиты.
final subscriptionStatusProvider =
    FutureProvider<SubscriptionStatus>((ref) {
  return ref.watch(profileRepositoryProvider).fetchSubscriptionStatus();
});

