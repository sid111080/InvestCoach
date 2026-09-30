import '../../domain/entities/portfolio_summary.dart';
import '../../domain/repositories/portfolio_repository.dart';

/// Mock [PortfolioRepository]: учебный портфель на ~10 000 ₽
/// с разумной стартовой аллокацией (см. acceptance criteria онбординга).
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
}
