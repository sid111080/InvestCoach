import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_stream_event.freezed.dart';
part 'chat_stream_event.g.dart';

/// Подсказка-действие в финальном ответе (`suggested_actions`).
@freezed
sealed class SuggestedAction with _$SuggestedAction {
  const factory SuggestedAction({
    required String text,
    required String action,
  }) = _SuggestedAction;

  factory SuggestedAction.fromJson(Map<String, dynamic> json) =>
      _$SuggestedActionFromJson(json);
}

/// События потока ответа Coach.
///
/// Транспорт (SSE/WS) превращает сырые чанки в эту sealed-связку,
/// а notifier потребляет её независимо от способа доставки.
@freezed
sealed class ChatStreamEvent with _$ChatStreamEvent {
  /// Фрагмент текста (`{"type":"content","content":"…","is_final":…}`).
  const factory ChatStreamEvent.chunk({
    required String content,
    required bool isFinal,
  }) = ChatChunkEvent;

  /// Финальное сообщение (`{"type":"final", …}`):
  /// полный текст + подсказки + metadata.
  const factory ChatStreamEvent.completed({
    required String messageId,
    required String content,
    @Default(<SuggestedAction>[]) List<SuggestedAction> suggestedActions,
    @Default(<String>[]) List<String> biasDetected,
    bool? relatedToPortfolio,
  }) = ChatCompletedEvent;
}
