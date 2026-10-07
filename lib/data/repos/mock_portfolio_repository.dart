import '../../domain/entities/portfolio_position.dart';
import '../../domain/entities/portfolio_summary.dart';
import '../../domain/entities/trade.dart';
import '../../domain/repositories/portfolio_repository.dart';

/// Mock [PortfolioRepository]: учебный портфель на ~10 000 ₽
/// с разумной стартовой аллокацией.
final class MockPortfolioRepository implements PortfolioRepository {
  const MockPortfolioRepository({
    this.latency = const Duration(milliseconds: 600),
  });

  final Duration latency;

  @override
  Future<PortfolioSummary?> fetchSummary() async {
    await Future<void>.delayed(latency);
    return const PortfolioSummary(
      totalValueRub: 10236,
      dailyChangePercent: 1.8,
      dailyChangeRub: 182,
      allocation: {
        'stocks': 50,
        'bonds': 30,
        'etf': 20,
      },
    );
  }

  @override
  Future<List<PortfolioPosition>> fetchPositions() async {
    await Future<void>.delayed(latency);
    return const [
      PortfolioPosition(
        ticker: 'SBER',
        name: 'Сбербанк',
        quantity: 120,
        avgPriceRub: 265,
        currentPriceRub: 278,
        dayChangePercent: 2.4,
      ),
      PortfolioPosition(
        ticker: 'GAZP',
        name: 'Газпром',
        quantity: 80,
        avgPriceRub: 132,
        currentPriceRub: 128,
        dayChangePercent: -1.2,
      ),
      PortfolioPosition(
        ticker: 'BND1',
        name: 'ОФЗ 26238',
        quantity: 10,
        avgPriceRub: 980,
        currentPriceRub: 1002,
        dayChangePercent: 0.3,
      ),
      PortfolioPosition(
        ticker: 'FXUSBF',
        name: 'БКС Фонд США',
        quantity: 8,
        avgPriceRub: 1250,
        currentPriceRub: 1290,
        dayChangePercent: 0.8,
      ),
    ];
  }

  @override
  Future<List<Trade>> fetchTrades() async {
    await Future<void>.delayed(latency);
    final now = DateTime.now();
    return [
      Trade(
        id: 'trade_001',
        ticker: 'SBER',
        name: 'Сбербанк',
        side: TradeSide.buy,
        quantity: 20,
        priceRub: 275,
        executedAt: now.subtract(const Duration(hours: 2)),
        coachFeedback:
            'Хорошее решение: Сбер отчитался о росте прибыли +34%. '
            'Позиция остаётся в пределах 30% портфеля — диверсификация в норме.',
        feedbackTone: 'positive',
      ),
      Trade(
        id: 'trade_002',
        ticker: 'GAZP',
        name: 'Газпром',
        side: TradeSide.sell,
        quantity: 10,
        priceRub: 130,
        executedAt: now.subtract(const Duration(days: 1)),
        coachFeedback:
            'Продажа после падения — стоит проверить, не «реализуешь ли» '
            'потери из-за эмоции. Фундаментально Газпром не изменился.',
        feedbackTone: 'caution',
      ),
      Trade(
        id: 'trade_003',
        ticker: 'BND1',
        name: 'ОФЗ 26238',
        side: TradeSide.buy,
        quantity: 5,
        priceRub: 995,
        executedAt: now.subtract(const Duration(days: 3)),
        coachFeedback:
            'Облигации — «якорь» портфеля. При ставке 16% дают стабильный '
            'доход без волатильности акций.',
        feedbackTone: 'positive',
      ),
    ];
  }
}
