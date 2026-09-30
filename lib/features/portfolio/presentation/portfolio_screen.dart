import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/feature_placeholder.dart';

/// Экран «Портфель» (учебный портфель, сделки, Instant Feedback).
///
/// Спринт 3: общая стоимость, pie chart, позиции, история сделок.
/// Сейчас — плейсхолдер.
class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return FeaturePlaceholderScreen(
      icon: Icons.pie_chart_outline,
      title: l10n.tabPortfolio,
      description: l10n.featureInDevelopmentDesc(
        l10n.tabPortfolio,
        l10n.sprint3,
      ),
    );
  }
}
