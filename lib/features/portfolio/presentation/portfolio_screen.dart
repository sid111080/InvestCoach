import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../../core/providers/repository_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/portfolio_position.dart';
import '../../../domain/entities/portfolio_summary.dart';
import '../../../domain/entities/trade.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_card.dart';
import '../../../shared/widgets/shimmer_skeleton.dart';

/// Экран «Портфель»: сводка, пирт-чарт аллокации,
/// позиции, история сделок с Instant Trade Feedback.
class PortfolioScreen extends ConsumerWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(portfolioSummaryProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.surface,
        onRefresh: () async => ref.invalidate(portfolioSummaryProvider),
        child: summaryAsync.when(
          loading: () => const _PortfolioLoading(),
          error: (error, _) => _PortfolioError(
            onRetry: () => ref.invalidate(portfolioSummaryProvider),
          ),
          data: (summary) {
            if (summary == null) return const _PortfolioEmpty();
            return _PortfolioContent(summary: summary);
          },
        ),
      ),
    );
  }
}

class _PortfolioContent extends ConsumerWidget {
  const _PortfolioContent({required this.summary});

  final PortfolioSummary summary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final positionsAsync =
        ref.watch(_positionsProvider).when(
              loading: () => const SizedBox.shrink(),
              error: (_, _) => const SizedBox.shrink(),
              data: (positions) => positions.isEmpty
                  ? const SizedBox.shrink()
                  : _PositionsSection(positions: positions),
            );
    final tradesAsync = ref.watch(_tradesProvider).when(
          loading: () => const SizedBox.shrink(),
          error: (_, _) => const SizedBox.shrink(),
          data: (trades) => trades.isEmpty
              ? const SizedBox.shrink()
              : _TradesSection(trades: trades),
        );

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      children: [
        Text(l10n.tabPortfolio, style: AppTextStyles.titleLarge),
        const SizedBox(height: AppDimensions.spaceLg),
        _SummaryHeader(summary: summary),
        const SizedBox(height: AppDimensions.spaceLg),
        _AllocationChart(allocation: summary.allocation),
        const SizedBox(height: AppDimensions.spaceLg),
        positionsAsync,
        const SizedBox(height: AppDimensions.spaceLg),
        tradesAsync,
      ],
    );
  }
}

final _positionsProvider = FutureProvider<List<PortfolioPosition>>(
  (ref) => ref.watch(portfolioRepositoryProvider).fetchPositions(),
);

final _tradesProvider = FutureProvider<List<Trade>>(
  (ref) => ref.watch(portfolioRepositoryProvider).fetchTrades(),
);

/// Шапка: общая стоимость + дневное изменение.
class _SummaryHeader extends StatelessWidget {
  const _SummaryHeader({required this.summary});

  final PortfolioSummary summary;

  static final _fmt = NumberFormat('#,##0', 'ru_RU');

  @override
  Widget build(BuildContext context) {
    final change = summary.dailyChangePercent;
    final isPositive = change >= 0;
    final changeColor = isPositive ? AppColors.success : AppColors.error;

    return AppCard(
      color: AppColors.surface,
      radius: AppDimensions.radiusLg,
      padding: const EdgeInsets.all(AppDimensions.spaceLg),
      child: Column(
        children: [
          Text(
            '${_fmt.format(summary.totalValueRub)} ₽',
            style: AppTextStyles.display,
          ),
          const SizedBox(height: AppDimensions.spaceXs),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                size: 18,
                color: changeColor,
              ),
              const SizedBox(width: AppDimensions.space2xs),
              Text(
                '${isPositive ? '+' : ''}${change.toStringAsFixed(1)}%',
                style: AppTextStyles.titleSmall.copyWith(color: changeColor),
              ),
              if (summary.dailyChangeRub != null) ...[
                const SizedBox(width: AppDimensions.spaceXs),
                Text(
                  '(${isPositive ? '+' : ''}'
                  '${_fmt.format(summary.dailyChangeRub!)} ₽)',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: changeColor.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// Пирт-чарт аллокации + легенда.
class _AllocationChart extends StatelessWidget {
  const _AllocationChart({required this.allocation});

  final Map<String, double> allocation;

  static const _colors = [
    AppColors.primary,
    Color(0xFF3B82F6),
    Color(0xFFF59E0B),
    Color(0xFF8B5CF6),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final entries = allocation.entries.toList();
    if (entries.isEmpty) return const SizedBox.shrink();

    final pieData = [
      for (var i = 0; i < entries.length; i++)
        PieChartSectionData(
          value: entries[i].value,
          color: _colors[i % _colors.length],
          title: '${entries[i].value.toStringAsFixed(0)}%',
          radius: 60,
          titleStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
    ];

    final labels = {
      'stocks': l10n.allocStocks,
      'bonds': l10n.allocBonds,
      'etf': l10n.allocEtf,
    };

    return AppCard(
      padding: const EdgeInsets.all(AppDimensions.spaceLg),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < entries.length; i++) ...[
                if (i > 0) const SizedBox(width: AppDimensions.spaceMd),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _colors[i % _colors.length],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      labels[entries[i].key] ?? entries[i].key,
                      style: AppTextStyles.labelSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ],
          ),
          const SizedBox(height: AppDimensions.spaceMd),
          SizedBox(
            height: 160,
            child: PieChart(
              PieChartData(
                sections: pieData,
                sectionsSpace: 2,
                centerSpaceRadius: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Секция позиций.
class _PositionsSection extends StatelessWidget {
  const _PositionsSection({required this.positions});

  final List<PortfolioPosition> positions;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.portfolioPositions, style: AppTextStyles.titleMedium),
        const SizedBox(height: AppDimensions.spaceSm),
        for (final pos in positions) _PositionRow(position: pos),
      ],
    );
  }
}

class _PositionRow extends StatelessWidget {
  const _PositionRow({required this.position});

  final PortfolioPosition position;

  static final _fmt = NumberFormat('#,##0', 'ru_RU');

  @override
  Widget build(BuildContext context) {
    final isPositive = position.dayChangePercent >= 0;
    final changeColor = isPositive ? AppColors.success : AppColors.error;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.spaceSm),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  position.name,
                  style: AppTextStyles.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  position.ticker,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${_fmt.format(position.currentValueRub.toInt())} ₽',
                  style: AppTextStyles.bodyMedium,
                ),
                Text(
                  '${position.quantity} шт',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppDimensions.spaceSm),
          SizedBox(
            width: 72,
            child: Text(
              '${isPositive ? '+' : ''}'
              '${position.dayChangePercent.toStringAsFixed(1)}%',
              style: AppTextStyles.labelMedium.copyWith(color: changeColor),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

/// Секция сделок с Instant Trade Feedback.
class _TradesSection extends StatelessWidget {
  const _TradesSection({required this.trades});

  final List<Trade> trades;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.portfolioTrades, style: AppTextStyles.titleMedium),
        const SizedBox(height: AppDimensions.spaceSm),
        for (final trade in trades) _TradeCard(trade: trade),
      ],
    );
  }
}

class _TradeCard extends StatelessWidget {
  const _TradeCard({required this.trade});

  final Trade trade;

  static final _fmt = NumberFormat('#,##0', 'ru_RU');

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isBuy = trade.side == TradeSide.buy;
    final sideColor = isBuy ? AppColors.success : AppColors.error;

    final toneColor = switch (trade.feedbackTone) {
      'positive' => AppColors.success,
      'caution' => AppColors.warning,
      _ => AppColors.textSecondary,
    };

    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.spaceMd),
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: sideColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  isBuy ? l10n.tradeBuy : l10n.tradeSell,
                  style: AppTextStyles.labelSmall.copyWith(color: sideColor),
                ),
              ),
              const SizedBox(width: AppDimensions.spaceSm),
              Expanded(
                child: Text(
                  trade.name,
                  style: AppTextStyles.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${trade.quantity} × ${_fmt.format(trade.priceRub.toInt())} ₽',
                style: AppTextStyles.labelMedium,
              ),
            ],
          ),
          if (trade.coachFeedback != null) ...[
            const SizedBox(height: AppDimensions.spaceSm),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppDimensions.spaceSm),
              decoration: BoxDecoration(
                color: toneColor.withValues(alpha: 0.08),
                borderRadius:
                    BorderRadius.circular(AppDimensions.radiusSm),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.psychology_outlined, size: 16, color: toneColor),
                  const SizedBox(width: AppDimensions.spaceXs),
                  Expanded(
                    child: Text(
                      trade.coachFeedback!,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Loading.
class _PortfolioLoading extends StatelessWidget {
  const _PortfolioLoading();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      physics: const AlwaysScrollableScrollPhysics(),
      children: const [
        ShimmerSkeleton(
          child: SizedBox(
            height: 100,
            child: AppCard(
              padding: EdgeInsets.all(16),
              child: Center(child: _GhostBar()),
            ),
          ),
        ),
        SizedBox(height: 16),
        ShimmerSkeleton(
          child: SizedBox(
            height: 200,
            child: AppCard(
              padding: EdgeInsets.all(16),
              child: Center(child: _GhostBar()),
            ),
          ),
        ),
        SizedBox(height: 16),
        ShimmerSkeleton(
          child: SizedBox(
            height: 300,
            child: AppCard(
              padding: EdgeInsets.all(16),
              child: Center(child: _GhostBar()),
            ),
          ),
        ),
      ],
    );
  }
}

/// Error.
class _PortfolioError extends StatelessWidget {
  const _PortfolioError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 120),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: AppColors.error, size: 40),
              const SizedBox(height: AppDimensions.spaceMd),
              Text(
                l10n.somethingWentWrong,
                style: AppTextStyles.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.spaceLg),
              AppButton(
                label: l10n.retry,
                icon: Icons.refresh,
                onPressed: onRetry,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Empty (портфель не создан).
class _PortfolioEmpty extends StatelessWidget {
  const _PortfolioEmpty();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 120),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.pie_chart_outline,
                color: AppColors.textSecondary,
                size: 40,
              ),
              const SizedBox(height: AppDimensions.spaceMd),
              Text(
                l10n.portfolioEmpty,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GhostBar extends StatelessWidget {
  const _GhostBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 16,
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
      ),
    );
  }
}
