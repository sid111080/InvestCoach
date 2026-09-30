import 'dart:io';

import '../../core/errors/app_exception.dart';
import '../../core/network/api_client.dart';
import '../../domain/entities/chat_context.dart';
import '../../domain/entities/chat_stream_event.dart';
import '../../domain/entities/voice_response.dart';
import '../../domain/repositories/chat_repository.dart';
import '../mappers/chat_mapper.dart';
import '../sources/chat_stream_source.dart';
import '../sources/chat_voice_source.dart';

/// Реальная реализация [ChatRepository] поверх REST API.
final class RemoteChatRepository implements ChatRepository {
  const RemoteChatRepository(this._api);

  final ApiClient _api;

  @override
  Stream<ChatStreamEvent> sendMessage(
    String message, {
    ChatContext? context,
  }) {
    return _withAppExceptions(
      ChatStreamSource(_api)
          .stream(message: message, context: context)
          .map((dto) => dto.toDomain())
          .where((event) => event != null)
          .map((event) => event!),
    );
  }

  @override
  Future<VoiceChatResponse> sendVoice({
    String? transcript,
    String? audioBase64,
    ChatContext? context,
  }) async {
    try {
      final dto = await ChatVoiceSource(_api).request(
        transcript: transcript,
        audioBase64: audioBase64,
        context: context,
      );
      return dto.toDomain();
    } on SocketException {
      throw const NoInternetException();
    } catch (error) {
      throw _api.toAppException(error);
    }
  }

  /// Преобразует сырые ошибки потока (DioException, сбой сокета)
  /// в типизированные [AppException].
  Stream<ChatStreamEvent> _withAppExceptions(
    Stream<ChatStreamEvent> source,
  ) {
    return Stream<ChatStreamEvent>.multi((controller) {
      final subscription = source.listen(
        controller.add,
        onError: (Object error, StackTrace stackTrace) {
          controller.addError(_api.toAppException(error), stackTrace);
        },
        onDone: controller.close,
        cancelOnError: true,
      );
      controller.onCancel = () => subscription.cancel();
    });
  }
}
