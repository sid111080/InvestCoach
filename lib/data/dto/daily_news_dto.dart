import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_news_dto.freezed.dart';
part 'daily_news_dto.g.dart';

/// Тело `GET /news/daily`.
@freezed
sealed class DailyNewsResponseDto with _$DailyNewsResponseDto {
  const factory DailyNewsResponseDto({
    @Default(<NewsItemDto>[]) List<NewsItemDto> news,
  }) = _DailyNewsResponseDto;

  factory DailyNewsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DailyNewsResponseDtoFromJson(json);
}

/// Одна новость (пример из ТЗ: `news_7843`, Сбер).
@freezed
sealed class NewsItemDto with _$NewsItemDto {
  const factory NewsItemDto({
    required String id,
    required String title,
    required String summary,
    @Default(false) bool impactOnPortfolio,
    double? portfolioImpactPercent,
    required DateTime publishedAt,
    @Default(<String>[]) List<String> tags,
  }) = _NewsItemDto;

  factory NewsItemDto.fromJson(Map<String, dynamic> json) =>
      _$NewsItemDtoFromJson(json);
}
