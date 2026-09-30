import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/feature_placeholder.dart';

/// Экран «Обучение» (Сегодня / Weekly Reviews / Мои Кейсы / Прогресс).
///
/// Спринт 4: все 4 вкладки. Сейчас — плейсхолдер.
class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return FeaturePlaceholderScreen(
      icon: Icons.school_outlined,
      title: l10n.tabLearning,
      description: l10n.featureInDevelopmentDesc(
        l10n.tabLearning,
        l10n.sprint4,
      ),
    );
  }
}
