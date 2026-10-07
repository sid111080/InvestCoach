import '../../core/errors/app_exception.dart';
import '../../core/network/api_client.dart';
import '../dto/portfolio_summary_dto.dart';
import '../../domain/entities/portfolio_position.dart';
import '../../domain/entities/portfolio_summary.dart';
import '../../domain/entities/trade.dart';
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
      if (error is NotFoundException) return null;
      rethrow;
    } catch (error) {
      throw _api.toAppException(error);
    }
  }

  @override
  Future<List<PortfolioPosition>> fetchPositions() async {
    try {
      final response = await _api.dio.get('/portfolio');
      final list = (response.data['positions'] as List<dynamic>? ?? [])
          .map((e) => PortfolioPosition.fromJson(e as Map<String, dynamic>))
          .toList();
      return list;
    } on AppException catch (error) {
      if (error is NotFoundException) return const [];
      rethrow;
    } catch (error) {
      throw _api.toAppException(error);
    }
  }

  @override
  Future<List<Trade>> fetchTrades() async {
    try {
      final response = await _api.dio.get('/portfolio/history');
      final list = (response.data['trades'] as List<dynamic>? ?? [])
          .map((e) => Trade.fromJson(e as Map<String, dynamic>))
          .toList();
      return list;
    } on AppException catch (error) {
      if (error is NotFoundException) return const [];
      rethrow;
    } catch (error) {
      throw _api.toAppException(error);
    }
  }
}
