import '../../domain/entities/app_user.dart';
import '../../domain/entities/user_preferences.dart';
import '../../domain/repositories/auth_repository.dart';

/// Mock [AuthRepository]: локальный «аккаунт» без backend
/// и внешних сервисов. Аккуратные задержки, чтобы в демо
/// были видны состояния загрузки.
final class MockAuthRepository implements AuthRepository {
  MockAuthRepository({this.latency = const Duration(milliseconds: 500)});

  /// Имитация сетевого отклика.
  final Duration latency;

  int _sequence = 0;

  @override
  Future<AppUser> createAccount(String name) async {
    await Future<void>.delayed(latency);
    _sequence += 1;
    return AppUser(
      id: 'usr_mock_$_sequence',
      name: name,
      tier: UserTier.free,
      createdAt: DateTime.now(),
    );
  }

  @override
  Future<UserPreferences> updatePreferences(
    UserPreferences preferences,
  ) async {
    await Future<void>.delayed(latency);
    return preferences;
  }

  @override
  Future<AppUser?> fetchMe() async {
    await Future<void>.delayed(latency);
    // Демо-пользователь (имя из примера ТЗ), пока онбординг
    // остаётся плейсхолдером.
    return AppUser(
      id: 'usr_mock_me',
      name: 'Алексей',
      tier: UserTier.free,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      preferences: const UserPreferences(
        experienceLevel: ExperienceLevel.intermediate,
        mainGoals: [
          MainGoal.marketUnderstanding,
          MainGoal.biasControl,
        ],
        riskTolerance: RiskTolerance.moderate,
        communicationStyle: CommunicationStyle.detailed,
      ),
    );
  }
}
