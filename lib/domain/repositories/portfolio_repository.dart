import '../entities/portfolio_summary.dart';

/// Учебный портфель (`GET /portfolio`, `GET /portfolio/summary`).
abstract interface class PortfolioRepository {
  /// Сводка портфеля для плавающей мини-карточки
  /// на главном экране.
  ///
  /// Возвращает `null`, если портфель ещё не создан.
  Future<PortfolioSummary?> fetchSummary();
}
