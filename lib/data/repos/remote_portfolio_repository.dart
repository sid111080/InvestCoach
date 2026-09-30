import '../../core/errors/app_exception.dart';
import '../../core/network/api_client.dart';
import '../dto/portfolio_summary_dto.dart';
import '../../domain/entities/portfolio_summary.dart';
import '../../domain/repositories/portfolio_repository.dart';

/// Реальная реализация [PortfolioRepository] поверх REST API.
final class RemotePortfolioRepository implements PortfolioRepository {
  const RemotePortfolioRepository(this._api);

  final ApiClient _api;

  @override
  Future<PortfolioSummary?> fetchSummary() async {
    try {
      final response = await _api.dio.get('/portfolio/summary');
      final dto = PortfolioSummaryDto.fromJson(response.data);
      return PortfolioSummary(
        totalValueRub: dto.totalValueRub,
        dailyChangePercent: dto.dailyChangePercent,
        dailyChangeRub: dto.dailyChangeRub,
        allocation: dto.allocation,
      );
    } on AppException catch (error) {
      // Портфель ещё не создан — для мини-карточки это не ошибка.
      if (error is NotFoundException) return null;
      rethrow;
    } catch (error) {
      throw _api.toAppException(error);
    }
  }
}
