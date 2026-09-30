import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/core/config/app_config.dart';
import 'package:investcoach/core/errors/app_exception.dart';
import 'package:investcoach/core/providers/app_providers.dart';
import 'package:investcoach/core/providers/repository_providers.dart';
import 'package:investcoach/domain/entities/app_user.dart';
import 'package:investcoach/domain/entities/user_preferences.dart';
import 'package:investcoach/domain/repositories/auth_repository.dart';
import 'package:investcoach/features/auth/presentation/onboarding/onboarding_flow_notifier.dart';
import 'package:investcoach/features/auth/presentation/onboarding/onboarding_flow_state.dart';
import 'package:investcoach/shared/onboarding/onboarding_state_repository.dart';

/// Фейк [AuthRepository]: записывает обращения, умеет падать.
final class RecordingAuthRepository implements AuthRepository {
  List<String> createdAccounts = [];
  List<UserPreferences> updatedPreferences = [];
  AppException? createAccountError;
  AppException? updatePreferencesError;

  @override
  Future<AppUser> createAccount(String name) async {
    if (createAccountError != null) throw createAccountError!;
    createdAccounts.add(name);
    return AppUser(id: 'u1', name: name, createdAt: DateTime(2026));
  }

  @override
  Future<UserPreferences> updatePreferences(
    UserPreferences preferences,
  ) async {
    if (updatePreferencesError != null) throw updatePreferencesError!;
    updatedPreferences.add(preferences);
    return preferences;
  }

  @override
  Future<AppUser?> fetchMe() async => null;
}

void main() {
  late RecordingAuthRepository auth;
  late InMemoryOnboardingState onboarding;
  late ProviderContainer container;
  late OnboardingFlowNotifier notifier;

  OnboardingFlowState state() => notifier.state;

  setUp(() {
    auth = RecordingAuthRepository();
    onboarding = InMemoryOnboardingState();
    container = ProviderContainer(
      overrides: [
        appConfigProvider.overrideWithValue(
          const AppConfig(
            environment: AppEnvironment.dev,
            useRealServices: false,
          ),
        ),
        authRepositoryProvider.overrideWithValue(auth),
        onboardingStateRepositoryProvider.overrideWithValue(onboarding),
      ],
    );
    notifier = container.read(onboardingFlowProvider.notifier);
    // Без реальных двух секунд анимации в юнит-тестах.
    notifier.creatingDuration = Duration.zero;
  });

  tearDown(() => container.dispose());

  group('Начальное состояние', () {
    test('старт на шаге 0 со значениями по умолчанию', () {
      final s = state();
      expect(s.step, 0);
      expect(s.name, isEmpty);
      expect(s.experienceLevel, ExperienceLevel.beginner);
      expect(s.mainGoals, isEmpty);
      expect(s.riskTolerance, RiskTolerance.moderate);
      expect(s.communicationStyle, CommunicationStyle.detailed);
      expect(s.creatingAccount, isFalse);
      expect(s.creatingCoach, isFalse);
      expect(s.completed, isFalse);
      expect(s.error, isNull);
    });
  });

  group('Навигация', () {
    test('start() переводит на шаг имени', () {
      notifier.start();
      expect(state().step, 1);
    });

    test('goBack() возвращается на предыдущий шаг', () {
      notifier.start();
      notifier.goBack();
      expect(state().step, 0);
    });

    test('goBack() на шаге 0 ничего не делает', () {
      notifier.goBack();
      expect(state().step, 0);
    });

    test('moveToStep() пускает только назад', () {
      notifier.start();
      expect(state().step, 1);
      notifier.moveToStep(3); // вперёд — запрещено
      expect(state().step, 1);
      notifier.moveToStep(0); // назад — можно
      expect(state().step, 0);
    });

    test('moveToStep() с некорректным индексом игнорируется', () {
      notifier.start();
      notifier.moveToStep(99);
      expect(state().step, 1);
      notifier.moveToStep(-1);
      expect(state().step, 1);
    });
  });

  group('Имя', () {
    test('setName() обновляет имя; trim учитывается в nameIsValid', () {
      notifier.setName('Алексей');
      expect(state().name, 'Алексей');
      expect(notifier.nameIsValid, isTrue);
      notifier.setName('  А  ');
      expect(notifier.nameIsValid, isFalse);
    });

    test('submitName() с невалидным именем не создаёт аккаунт', () async {
      notifier.start();
      notifier.setName('А');
      await notifier.submitName();
      expect(auth.createdAccounts, isEmpty);
      expect(state().step, 1);
      expect(state().creatingAccount, isFalse);
    });

    test('submitName() с валидным именем создаёт аккаунт и идёт дальше',
        () async {
      notifier.setName('Алексей');
      await notifier.submitName();
      expect(auth.createdAccounts, ['Алексей']);
      expect(state().step, 2);
      expect(state().creatingAccount, isFalse);
      expect(state().error, isNull);
    });

    test('submitName() при ошибке бэкенда ставит error и остаётся на шаге',
        () async {
      notifier.start();
      auth.createAccountError = const NoInternetException();
      notifier.setName('Алексей');
      await notifier.submitName();
      expect(auth.createdAccounts, isEmpty);
      expect(state().step, 1);
      expect(state().creatingAccount, isFalse);
      expect(state().error, isA<NoInternetException>());
    });

    test('повторный submitName() во время запроса игнорируется', () async {
      notifier.setName('Алексей');
      notifier.submitName();
      notifier.submitName();
      await Future<void>.delayed(Duration.zero);
      // Guard `creatingAccount` блокирует двойное создание.
      expect(auth.createdAccounts, hasLength(1));
    });
  });

  group('Опыт', () {
    test('selectExperience() переключает уровень', () {
      notifier.selectExperience(ExperienceLevel.advanced);
      expect(state().experienceLevel, ExperienceLevel.advanced);
      notifier.selectExperience(ExperienceLevel.beginner);
      expect(state().experienceLevel, ExperienceLevel.beginner);
    });

    test('повторный выбор того же уровня не меняет состояние', () {
      final before = state();
      notifier.selectExperience(before.experienceLevel);
      expect(state(), before);
    });
  });

  group('Цели', () {
    test('toggleGoal() добавляет и убирает цель', () {
      notifier.toggleGoal(MainGoal.marketUnderstanding);
      notifier.toggleGoal(MainGoal.biasControl);
      expect(state().mainGoals,
          [MainGoal.marketUnderstanding, MainGoal.biasControl]);
      notifier.toggleGoal(MainGoal.marketUnderstanding);
      expect(state().mainGoals, [MainGoal.biasControl]);
    });

    test('goalsAreValid становится true при наличии цели', () {
      expect(notifier.goalsAreValid, isFalse);
      notifier.toggleGoal(MainGoal.regularSaving);
      expect(notifier.goalsAreValid, isTrue);
    });

    test('advance() со шага 3 требует хотя бы одну цель', () async {
      notifier.start();
      notifier.setName('Алексей');
      await notifier.submitName();
      notifier.advance();
      expect(state().step, 3);
      notifier.advance(); // целей нет — остаёмся
      expect(state().step, 3);
      notifier.toggleGoal(MainGoal.portfolioManagement);
      notifier.advance();
      expect(state().step, 4);
    });
  });

  group('Риск и стиль', () {
    test('selectRisk() переключает уровень риска', () {
      notifier.selectRisk(RiskTolerance.aggressive);
      expect(state().riskTolerance, RiskTolerance.aggressive);
      notifier.selectRisk(RiskTolerance.conservative);
      expect(state().riskTolerance, RiskTolerance.conservative);
    });

    test('selectStyle() переключает стиль общения', () {
      notifier.selectStyle(CommunicationStyle.concise);
      expect(state().communicationStyle, CommunicationStyle.concise);
      notifier.selectStyle(CommunicationStyle.detailed);
      expect(state().communicationStyle, CommunicationStyle.detailed);
    });
  });

  group('Сборка предпочтений', () {
    test('preferences отражает выбранные ответы', () {
      notifier.setName('Алексей');
      notifier.selectExperience(ExperienceLevel.advanced);
      notifier.toggleGoal(MainGoal.biasControl);
      notifier.toggleGoal(MainGoal.regularSaving);
      notifier.selectRisk(RiskTolerance.aggressive);
      notifier.selectStyle(CommunicationStyle.concise);

      expect(notifier.preferences,
          const UserPreferences(
            experienceLevel: ExperienceLevel.advanced,
            mainGoals: [MainGoal.biasControl, MainGoal.regularSaving],
            riskTolerance: RiskTolerance.aggressive,
            communicationStyle: CommunicationStyle.concise,
          ));
    });
  });

  group('Создание Coach', () {
    test('createCoach() без целей — no-op', () async {
      await notifier.createCoach();
      expect(state().creatingCoach, isFalse);
      expect(auth.updatedPreferences, isEmpty);
    });

    test('createCoach() шлёт предпочтения и ставит локальный флаг',
        () async {
      notifier.setName('Алексей');
      notifier.selectExperience(ExperienceLevel.intermediate);
      notifier.toggleGoal(MainGoal.marketUnderstanding);
      notifier.selectRisk(RiskTolerance.aggressive);
      notifier.selectStyle(CommunicationStyle.concise);

      await notifier.createCoach();

      expect(auth.updatedPreferences, hasLength(1));
      expect(onboarding.storedName, 'Алексей');
      expect(
        onboarding.storedPreferences,
        const UserPreferences(
          experienceLevel: ExperienceLevel.intermediate,
          mainGoals: [MainGoal.marketUnderstanding],
          riskTolerance: RiskTolerance.aggressive,
          communicationStyle: CommunicationStyle.concise,
        ),
      );
      expect(onboarding.completed, isTrue);
      expect(state().completed, isTrue);
      expect(state().creatingCoach, isFalse);
      expect(state().error, isNull);
    });

    test('createCoach() при ошибке backend не ставит флаг и держит error',
        () async {
      notifier.setName('Алексей');
      notifier.toggleGoal(MainGoal.biasControl);
      auth.updatePreferencesError = const NoInternetException();

      await notifier.createCoach();

      expect(onboarding.completed, isFalse);
      expect(onboarding.storedName, isNull);
      expect(state().completed, isFalse);
      expect(state().creatingCoach, isFalse);
      expect(state().error, isA<NoInternetException>());
    });
  });
}
