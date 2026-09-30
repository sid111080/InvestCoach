import 'package:flutter/material.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/entities/user_preferences.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/coach_avatar.dart';
import '../widgets/onboarding_option_card.dart';

/// Заголовок шага: крупный тайтл + вторичный подзаголовок.
class _StepHeader extends StatelessWidget {
  const _StepHeader({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.titleLarge,
          ),
          const SizedBox(height: AppDimensions.spaceXs),
          Text(
            subtitle,
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}

/// Ошибка последнего запроса: красный текст + «Повторить».
class _RequestError extends StatelessWidget {
  const _RequestError({
    required this.error,
    required this.onRetry,
  });

  final AppException error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppDimensions.spaceSm),
        Text(
          error.userMessage,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.error),
        ),
        const SizedBox(height: AppDimensions.spaceXs),
        AppButton(
          label: l10n.retry,
          icon: Icons.refresh,
          variant: AppButtonVariant.ghost,
          onPressed: onRetry,
        ),
      ],
    );
  }
}

/// Шаг 1: «Познакомься с Coach».
///
/// [pulse] — пульсация аватара; в widget-тестах не запускается,
/// чтобы `pumpAndSettle` стабилизировался.
class OnboardingWelcomePage extends StatelessWidget {
  const OnboardingWelcomePage({
    super.key,
    required this.pulse,
    required this.onStart,
  });

  final Animation<double> pulse;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spaceXl,
              ),
              child: Column(
                children: [
                  const SizedBox(height: AppDimensions.spaceXxl),
                  AnimatedBuilder(
                    animation: pulse,
                    builder: (context, child) => Transform.scale(
                      scale: 1 + 0.06 * pulse.value,
                      child: child,
                    ),
                    child: const CoachAvatar(size: 96, isOnline: false),
                  ),
                  const SizedBox(height: AppDimensions.spaceXl),
                  Text(
                    l10n.onbWelcomeTitle,
                    style: AppTextStyles.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spaceSm),
                  Text(
                    l10n.onbWelcomeText,
                    style: AppTextStyles.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spaceXl),
          child: AppButton(
            label: l10n.onbWelcomeStart,
            expand: true,
            onPressed: onStart,
          ),
        ),
      ],
    );
  }
}

/// Шаг 2: имя (создание аккаунта, `POST /auth/firebase`).
class OnboardingNamePage extends StatefulWidget {
  const OnboardingNamePage({
    super.key,
    required this.name,
    required this.creatingAccount,
    required this.error,
    required this.onNameChanged,
    required this.onSubmit,
  });

  final String name;
  final bool creatingAccount;

  /// Сбой `createAccount` (показывается с «Повторить»).
  final AppException? error;

  /// Обновление имени по мере ввода.
  final ValueChanged<String> onNameChanged;

  final VoidCallback onSubmit;

  @override
  State<OnboardingNamePage> createState() => _OnboardingNamePageState();
}

class _OnboardingNamePageState extends State<OnboardingNamePage> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.name);

  /// Пользователь уже пытался продолжить с коротким именем.
  bool _showNameError = false;

  bool get _nameIsValid => _controller.text.trim().length >= 2;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_nameIsValid) {
      setState(() => _showNameError = false);
      widget.onSubmit();
      return;
    }
    setState(() => _showNameError = true);
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        borderSide: BorderSide(color: color),
      );

  @override
  Widget build(BuildContext context) {
    // Внешнее обновление имени (например, после возврата на шаг).
    if (_controller.text != widget.name) {
      _controller.text = widget.name;
    }
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceXl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppDimensions.spaceXxl),
                _StepHeader(
                  title: l10n.onbNameTitle,
                  subtitle: l10n.onbNameSubtitle,
                ),
                const SizedBox(height: AppDimensions.spaceLg),
                TextField(
                  key: const Key('onboardingNameField'),
                  controller: _controller,
                  onChanged: (value) {
                    // Ошибка гаснет, как только имя стало валидным.
                    if (_showNameError && _nameIsValid) {
                      setState(() => _showNameError = false);
                    }
                    widget.onNameChanged(value);
                  },
                  style: AppTextStyles.labelLarge,
                  decoration: InputDecoration(
                    hintText: l10n.onbNameHint,
                    filled: true,
                    fillColor: AppColors.surface,
                    enabledBorder: _border(
                      _showNameError && !_nameIsValid
                          ? AppColors.error
                          : AppColors.outline,
                    ),
                    focusedBorder: _border(AppColors.primary),
                  ),
                ),
                if (_showNameError && !_nameIsValid) ...[
                  const SizedBox(height: AppDimensions.spaceXs),
                  Text(
                    l10n.onbNameError,
                    style: AppTextStyles.bodySmall
                        .copyWith(color: AppColors.error),
                  ),
                ],
                if (widget.error != null)
                  _RequestError(
                    error: widget.error!,
                    onRetry: widget.onSubmit,
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spaceXl),
          child: AppButton(
            label: widget.error != null ? l10n.retry : l10n.onbContinue,
            icon: widget.error != null ? Icons.refresh : null,
            expand: true,
            isLoading: widget.creatingAccount,
            onPressed: _submit,
          ),
        ),
      ],
    );
  }
}

/// Шаг 3: опыт (одинарный выбор).
class OnboardingExperiencePage extends StatelessWidget {
  const OnboardingExperiencePage({
    super.key,
    required this.experienceLevel,
    required this.onSelect,
    required this.onNext,
  });

  final ExperienceLevel experienceLevel;
  final ValueChanged<ExperienceLevel> onSelect;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceXl,
            ),
            child: Column(
              children: [
                const SizedBox(height: AppDimensions.spaceXxl),
                _StepHeader(
                  title: l10n.onbExperienceTitle,
                  subtitle: l10n.onbExperienceSubtitle,
                ),
                const SizedBox(height: AppDimensions.spaceLg),
                OnboardingOptionCard(
                  icon: Icons.explore,
                  title: l10n.onbExpBeginner,
                  description: l10n.onbExpBeginnerDesc,
                  selected: experienceLevel == ExperienceLevel.beginner,
                  onTap: () => onSelect(ExperienceLevel.beginner),
                ),
                const SizedBox(height: AppDimensions.spaceSm),
                OnboardingOptionCard(
                  icon: Icons.trending_up,
                  title: l10n.onbExpIntermediate,
                  description: l10n.onbExpIntermediateDesc,
                  selected:
                      experienceLevel == ExperienceLevel.intermediate,
                  onTap: () => onSelect(ExperienceLevel.intermediate),
                ),
                const SizedBox(height: AppDimensions.spaceSm),
                OnboardingOptionCard(
                  icon: Icons.insights,
                  title: l10n.onbExpAdvanced,
                  description: l10n.onbExpAdvancedDesc,
                  selected: experienceLevel == ExperienceLevel.advanced,
                  onTap: () => onSelect(ExperienceLevel.advanced),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spaceXl),
          child: AppButton(
            label: l10n.onbContinue,
            expand: true,
            onPressed: onNext,
          ),
        ),
      ],
    );
  }
}

/// Шаг 4: цели (мульти-выбор, минимум одна).
class OnboardingGoalsPage extends StatelessWidget {
  const OnboardingGoalsPage({
    super.key,
    required this.goals,
    required this.onToggle,
    required this.onNext,
  });

  final List<MainGoal> goals;
  final ValueChanged<MainGoal> onToggle;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceXl,
            ),
            child: Column(
              children: [
                const SizedBox(height: AppDimensions.spaceXxl),
                _StepHeader(
                  title: l10n.onbGoalsTitle,
                  subtitle: l10n.onbGoalsSubtitle,
                ),
                const SizedBox(height: AppDimensions.spaceLg),
                OnboardingOptionCard(
                  icon: Icons.newspaper_outlined,
                  title: l10n.onbGoalNews,
                  selected: goals.contains(MainGoal.marketUnderstanding),
                  onTap: () => onToggle(MainGoal.marketUnderstanding),
                ),
                const SizedBox(height: AppDimensions.spaceSm),
                OnboardingOptionCard(
                  icon: Icons.psychology_outlined,
                  title: l10n.onbGoalBias,
                  selected: goals.contains(MainGoal.biasControl),
                  onTap: () => onToggle(MainGoal.biasControl),
                ),
                const SizedBox(height: AppDimensions.spaceSm),
                OnboardingOptionCard(
                  icon: Icons.pie_chart_outline,
                  title: l10n.onbGoalPortfolio,
                  selected:
                      goals.contains(MainGoal.portfolioManagement),
                  onTap: () => onToggle(MainGoal.portfolioManagement),
                ),
                const SizedBox(height: AppDimensions.spaceSm),
                OnboardingOptionCard(
                  icon: Icons.savings,
                  title: l10n.onbGoalSaving,
                  selected: goals.contains(MainGoal.regularSaving),
                  onTap: () => onToggle(MainGoal.regularSaving),
                ),
                if (goals.isEmpty) ...[
                  const SizedBox(height: AppDimensions.spaceSm),
                  Text(
                    l10n.onbGoalsError,
                    style: AppTextStyles.bodySmall
                        .copyWith(color: AppColors.error),
                  ),
                ],
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spaceXl),
          child: AppButton(
            label: l10n.onbContinue,
            expand: true,
            onPressed: goals.isEmpty ? null : onNext,
          ),
        ),
      ],
    );
  }
}

/// Шаг 5: отношение к риску + стиль общения Coach.
class OnboardingRiskStylePage extends StatelessWidget {
  const OnboardingRiskStylePage({
    super.key,
    required this.riskTolerance,
    required this.communicationStyle,
    required this.error,
    required this.onSelectRisk,
    required this.onSelectStyle,
    required this.onCreate,
  });

  final RiskTolerance riskTolerance;
  final CommunicationStyle communicationStyle;

  /// Сбой `updatePreferences` (показывается с «Повторить»).
  final AppException? error;

  final ValueChanged<RiskTolerance> onSelectRisk;
  final ValueChanged<CommunicationStyle> onSelectStyle;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceXl,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppDimensions.spaceXxl),
                _StepHeader(
                  title: l10n.onbRiskTitle,
                  subtitle: l10n.onbRiskSubtitle,
                ),
                const SizedBox(height: AppDimensions.spaceLg),
                OnboardingOptionCard(
                  icon: Icons.shield_outlined,
                  title: l10n.onbRiskConservative,
                  description: l10n.onbRiskConservativeDesc,
                  selected: riskTolerance == RiskTolerance.conservative,
                  onTap: () => onSelectRisk(RiskTolerance.conservative),
                ),
                const SizedBox(height: AppDimensions.spaceSm),
                OnboardingOptionCard(
                  icon: Icons.balance,
                  title: l10n.onbRiskModerate,
                  description: l10n.onbRiskModerateDesc,
                  selected: riskTolerance == RiskTolerance.moderate,
                  onTap: () => onSelectRisk(RiskTolerance.moderate),
                ),
                const SizedBox(height: AppDimensions.spaceSm),
                OnboardingOptionCard(
                  icon: Icons.rocket_launch,
                  title: l10n.onbRiskAggressive,
                  description: l10n.onbRiskAggressiveDesc,
                  selected: riskTolerance == RiskTolerance.aggressive,
                  onTap: () => onSelectRisk(RiskTolerance.aggressive),
                ),
                const SizedBox(height: AppDimensions.spaceXl),
                Text(
                  l10n.onbStyleTitle,
                  style: AppTextStyles.titleMedium,
                ),
                const SizedBox(height: AppDimensions.spaceLg),
                OnboardingOptionCard(
                  icon: Icons.chat_bubble_outline,
                  title: l10n.onbStyleDetailed,
                  selected:
                      communicationStyle == CommunicationStyle.detailed,
                  onTap: () => onSelectStyle(CommunicationStyle.detailed),
                ),
                const SizedBox(height: AppDimensions.spaceSm),
                OnboardingOptionCard(
                  icon: Icons.flash_on,
                  title: l10n.onbStyleConcise,
                  selected:
                      communicationStyle == CommunicationStyle.concise,
                  onTap: () => onSelectStyle(CommunicationStyle.concise),
                ),
                if (error != null)
                  _RequestError(error: error!, onRetry: onCreate),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spaceXl),
          // При ошибке основной CTA блокируется — повтор через
          // «Повторить» над ошибкой.
          child: AppButton(
            label: l10n.onbCreateCoach,
            expand: true,
            onPressed: error == null ? onCreate : null,
          ),
        ),
      ],
    );
  }
}

/// Финальный экран: «Создаём твоего Coach…» (≥ 2 секунд).
///
/// [pulse] — «вдыхание» аватара; в тестах статичен.
class OnboardingCreatingPage extends StatelessWidget {
  const OnboardingCreatingPage({super.key, required this.pulse});

  final Animation<double> pulse;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spaceXl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppDimensions.spaceXxl),
            AnimatedBuilder(
              animation: pulse,
              builder: (context, child) => Transform.scale(
                scale: 1 + 0.08 * pulse.value,
                child: child,
              ),
              child: const CoachAvatar(size: 112, isOnline: true),
            ),
            const SizedBox(height: AppDimensions.spaceXl),
            Text(
              l10n.onbCreatingTitle,
              style: AppTextStyles.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spaceXs),
            Text(
              l10n.onbCreatingText,
              style: AppTextStyles.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
