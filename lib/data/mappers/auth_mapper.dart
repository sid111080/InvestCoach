import '../../domain/entities/app_user.dart';
import '../../domain/entities/user_preferences.dart';
import '../dto/auth_dto.dart';

/// Маппинг DTO → сущности domain.
///
/// Backend может вернуть неизвестные значения перечислений —
/// вместо падения маппер подставляет дефолты.
extension AuthMapper on UserDto {
  AppUser toEntity() {
    return AppUser(
      id: id,
      name: name,
      tier: const {
        'free': UserTier.free,
        'news_plus': UserTier.newsPlus,
        'pro': UserTier.pro,
      }[tier] ?? UserTier.free,
      createdAt: createdAt,
      preferences: preferences?.toEntity(),
    );
  }
}

extension UserPreferencesMapper on UserPreferencesDto {
  UserPreferences toEntity() {
    const experience = {
      'beginner': ExperienceLevel.beginner,
      'intermediate': ExperienceLevel.intermediate,
      'advanced': ExperienceLevel.advanced,
    };
    const goals = {
      'market_understanding': MainGoal.marketUnderstanding,
      'bias_control': MainGoal.biasControl,
      'portfolio_management': MainGoal.portfolioManagement,
      'regular_saving': MainGoal.regularSaving,
    };
    const risk = {
      'conservative': RiskTolerance.conservative,
      'moderate': RiskTolerance.moderate,
      'aggressive': RiskTolerance.aggressive,
    };
    const style = {
      'detailed': CommunicationStyle.detailed,
      'concise': CommunicationStyle.concise,
    };
    return UserPreferences(
      experienceLevel: experience[experienceLevel] ??
          ExperienceLevel.beginner,
      mainGoals: mainGoals
          .map((goal) => goals[goal])
          .whereType<MainGoal>()
          .toList(),
      riskTolerance: risk[riskTolerance] ?? RiskTolerance.moderate,
      communicationStyle: style[communicationStyle],
    );
  }
}
