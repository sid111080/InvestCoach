import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/feature_placeholder.dart';

/// Экран «Новости» (лента + Push-карточки).
///
/// Спринт 3: лента с фильтрами, Pull-to-Refresh,
/// переход к обсуждению с Coach. Сейчас — плейсхолдер.
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return FeaturePlaceholderScreen(
      icon: Icons.newspaper_outlined,
      title: l10n.tabNews,
      description: l10n.featureInDevelopmentDesc(
        l10n.tabNews,
        l10n.sprint3,
      ),
    );
  }
}
