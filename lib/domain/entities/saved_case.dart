import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_case.freezed.dart';
part 'saved_case.g.dart';

/// Сохранённый разговор по новости из `GET /cases`.
@freezed
sealed class SavedCase with _$SavedCase {
  const factory SavedCase({
    required String id,
    required String topic,

    /// Короткая выдержка из разговора.
    required String excerpt,

    /// Дата сохранения.
    required DateTime savedAt,

    /// Связанный news_id (для перехода в чат с контекстом).
    String? newsId,
  }) = _SavedCase;

  factory SavedCase.fromJson(Map<String, dynamic> json) =>
      _$SavedCaseFromJson(json);
}
