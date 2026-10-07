import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_context.freezed.dart';
part 'chat_context.g.dart';

/// Тип контекста запроса (поле `context_type` API).
enum ChatContextType {
  /// Обычный вопрос.
  @JsonValue('general')
  general,

  /// Обсуждение конкретной новости (`news_id`).
  @JsonValue('news')
  news,

  /// Обсуждение микро-урока (`lesson_id`).
  @JsonValue('lesson')
  lesson,
}

/// Контекст запроса к Coach: обычный вопрос,
/// обсуждение новости или микро-урока.
@freezed
sealed class ChatContext with _$ChatContext {
  const factory ChatContext({
    @Default(ChatContextType.general) ChatContextType type,
    String? newsId,
    // Только для подписи пузыря в UI (в API не уходит).
    String? newsTitle,
    String? lessonId,
    String? lessonTitle,
  }) = _ChatContext;

  const ChatContext._();

  factory ChatContext.fromJson(Map<String, dynamic> json) =>
      _$ChatContextFromJson(json);
}
