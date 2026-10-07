import '../entities/portfolio_position.dart';
import '../entities/portfolio_summary.dart';
import '../entities/trade.dart';

/// Учебный портфель (`GET /portfolio`, `GET /portfolio/summary`,
/// `GET /portfolio/history`).
abstract interface class PortfolioRepository {
  /// Сводка портфеля для плавающей мини-карточки
  /// на главном экране.
  ///
  /// Возвращает `null`, если портфель ещё не создан.
  Future<PortfolioSummary?> fetchSummary();

  /// Позиции портфеля (активы + стоимость).
  Future<List<PortfolioPosition>> fetchPositions();

  /// История сделок (с Instant Trade Feedback).
  Future<List<Trade>> fetchTrades();
}
