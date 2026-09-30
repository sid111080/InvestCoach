import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/feature_placeholder.dart';

/// Экран «Профиль» (статистика, стиль Coach, тарифы).
///
/// Спринт 4: header с бейджем тарифа, статистика 30 дней,
/// выбор стиля общения, кнопка News+. Сейчас — плейсхолдер.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return FeaturePlaceholderScreen(
      icon: Icons.person_outline,
      title: l10n.tabProfile,
      description: l10n.featureInDevelopmentDesc(
        l10n.tabProfile,
        l10n.sprint4,
      ),
    );
  }
}
