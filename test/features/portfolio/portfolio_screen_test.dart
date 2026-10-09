import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:investcoach/core/providers/repository_providers.dart';
import 'package:investcoach/data/services/mock_notification_service.dart';
import 'package:investcoach/data/services/mock_subscription_service.dart';
import 'package:investcoach/domain/entities/portfolio_position.dart';
import 'package:investcoach/domain/entities/portfolio_summary.dart';
import 'package:investcoach/domain/entities/trade.dart';
import 'package:investcoach/domain/repositories/portfolio_repository.dart';
import 'package:investcoach/features/portfolio/presentation/portfolio_screen.dart';
import 'package:investcoach/l10n/app_localizations.dart';
import 'package:investcoach/shared/widgets/shimmer_skeleton.dart';

/// Mock репозитория с настраиваемыми данными.
final class _TestPortfolioRepository implements PortfolioRepository {
  const _TestPortfolioRepository({
    this.summary,
    this.positions = const [],
    this.trades = const [],
  });

  final PortfolioSummary? summary;
  final List<PortfolioPosition> positions;
  final List<Trade> trades;

  @override
  Future<PortfolioSummary?> fetchSummary() async => summary;

  @override
  Future<List<PortfolioPosition>> fetchPositions() async => positions;

  @override
  Future<List<Trade>> fetchTrades() async => trades;
}

void main() {
  Widget wrap(Widget child, {PortfolioRepository? repo}) {
    return ProviderScope(
      overrides: [
        if (repo != null)
          portfolioRepositoryProvider.overrideWithValue(repo),
        subscriptionServiceProvider
            .overrideWithValue(MockSubscriptionService()),
        notificationServiceProvider
            .overrideWithValue(MockNotificationService()),
      ],
      child: MaterialApp(
        locale: const Locale('ru'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: child,
      ),
    );
  }

  group('PortfolioScreen', () {
    testWidgets('Loading: shimmer-скелетоны', (tester) async {
      // Future, который никогда не завершится — loading остаётся.
      final completer = Completer<PortfolioSummary?>();
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            portfolioSummaryProvider.overrideWith(
              (ref) => completer.future,
            ),
            subscriptionServiceProvider
                .overrideWithValue(MockSubscriptionService()),
            notificationServiceProvider
                .overrideWithValue(MockNotificationService()),
          ],
          child: MaterialApp(
            locale: const Locale('ru'),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const PortfolioScreen(),
          ),
        ),
      );
      await tester.pump();
      expect(find.byType(ShimmerSkeleton), findsWidgets);
    });

    testWidgets('Empty: портфель не создан', (tester) async {
      await tester.pumpWidget(
        wrap(
          const PortfolioScreen(),
          repo: const _TestPortfolioRepository(summary: null),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.textContaining('Портфель ещё не создан'),
        findsOneWidget,
      );
    });

    testWidgets('Data: сводка + пирт-чарт', (tester) async {
      await tester.pumpWidget(
        wrap(
          const PortfolioScreen(),
          repo: _TestPortfolioRepository(
            summary: PortfolioSummary(
              totalValueRub: 105000,
              dailyChangePercent: 2.3,
              dailyChangeRub: 2300,
              allocation: {'stocks': 60, 'bonds': 30, 'etf': 10},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Общая стоимость (формат с разделителем тысяч).
      expect(find.textContaining('105'), findsOneWidget);
      expect(find.textContaining('₽'), findsWidgets);
      // Дневное изменение.
      expect(find.textContaining('+2.3%'), findsOneWidget);
    });

    testWidgets('Позиции: название, тикер', (tester) async {
      await tester.pumpWidget(
        wrap(
          const PortfolioScreen(),
          repo: _TestPortfolioRepository(
            summary: PortfolioSummary(
              totalValueRub: 80000,
              dailyChangePercent: 1.0,
              allocation: {'stocks': 100},
            ),
            positions: const [
              PortfolioPosition(
                ticker: 'SBER',
                name: 'Сбербанк',
                quantity: 100,
                avgPriceRub: 450,
                currentPriceRub: 500,
                dayChangePercent: 1.5,
              ),
              PortfolioPosition(
                ticker: 'GAZP',
                name: 'Газпром',
                quantity: 200,
                avgPriceRub: 160,
                currentPriceRub: 150,
                dayChangePercent: -0.8,
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Сбербанк'), findsOneWidget);
      expect(find.text('SBER'), findsOneWidget);
      expect(find.text('Газпром'), findsOneWidget);
      expect(find.text('GAZP'), findsOneWidget);
    });

    testWidgets('Сделки: Instant Trade Feedback', (tester) async {
      await tester.pumpWidget(
        wrap(
          const PortfolioScreen(),
          repo: _TestPortfolioRepository(
            summary: PortfolioSummary(
              totalValueRub: 105000,
              dailyChangePercent: 0.5,
              allocation: {'stocks': 100},
            ),
            trades: [
              Trade(
                id: 't1',
                ticker: 'GAZP',
                name: 'Газпром',
                side: TradeSide.buy,
                quantity: 200,
                priceRub: 150,
                executedAt: DateTime(2026, 10, 8, 14, 30),
                coachFeedback: 'Хорошее решение: дивидендная доходность 8%',
                feedbackTone: 'positive',
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Газпром'), findsOneWidget);
      expect(find.text('Покупка'), findsOneWidget);
      expect(
        find.text('Хорошее решение: дивидендная доходность 8%'),
        findsOneWidget,
      );
    });
  });
}

