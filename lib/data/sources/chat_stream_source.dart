import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../core/network/api_client.dart';
import '../../domain/entities/chat_context.dart';
import '../dto/chat_dto.dart';
import 'sse_event_parser.dart';

/// Источник стриминга ответов Coach: `POST /chat/completion` (SSE).
///
/// Токен Firebase подставляет Dio-интерцептор; ошибки транслируются
/// как [DioException] — типизированный `AppException` делает
/// вызывающий репозиторий.
final class ChatStreamSource {
  const ChatStreamSource(this._api);

  final ApiClient _api;

  static final RequestOptions _requestOptions = RequestOptions(
    path: '/chat/completion',
  );

  /// Поток DTO-событий ответа.
  ///
  /// Бросает [DioException] при ошибке запроса или разрыве
  /// соединения во время стрима.
  Stream<ChatCompletionEventDto> stream({
    required String message,
    ChatContext? context,
  }) {
    return Stream<ChatCompletionEventDto>.multi((controller) {
      var cancelled = false;

      unawaited(
        _request(message, context).then((body) {
          if (cancelled) return;
          final parser = SseEventParser();
          final decoder = const Utf8Decoder(allowMalformed: true);
          final pending = <Map<String, dynamic>>[];

          final sub = body.stream.listen(
            (bytes) {
              pending.addAll(parser.feed(decoder.convert(bytes)));
              for (final json in pending) {
                controller.add(ChatCompletionEventDto.fromJson(json));
              }
              pending.clear();
            },
            onDone: () {
              if (cancelled) return;
              // Финальное событие, дописанное без завершающей
              // пустой строки, отдаём при закрытии потока.
              pending.addAll(parser.finish());
              for (final json in pending) {
                controller.add(ChatCompletionEventDto.fromJson(json));
              }
              pending.clear();
              controller.close();
            },
            onError: (Object error, StackTrace stackTrace) {
              if (cancelled) return;
              controller.addError(
                error is DioException
                    ? error
                    : DioException(
                        requestOptions: _requestOptions,
                        error: error,
                        type: DioExceptionType.connectionError,
                      ),
                stackTrace,
              );
              controller.close();
            },
            cancelOnError: true,
          );

          controller.onCancel = () {
            cancelled = true;
            sub.cancel();
          };
        }, onError: (Object error, StackTrace stackTrace) {
          if (cancelled) return;
          controller.addError(
            error is DioException
                ? error
                : DioException(
                    requestOptions: _requestOptions,
                    error: error,
                    type: DioExceptionType.unknown,
                  ),
            stackTrace,
          );
          controller.close();
        }),
      );

      controller.onCancel = () => cancelled = true;
    });
  }

  /// Отправляет запрос с `ResponseType.stream`; возвращает тело.
  Future<ResponseBody> _request(
    String message,
    ChatContext? context,
  ) {
    return _api.dio
        .post<ResponseBody>(
          _requestOptions.path,
          data: {
            'message': message,
            'context_type':
                context?.type.name ?? ChatContextType.general.name,
            'news_id': ?context?.newsId,
            'stream': true,
          },
          options: Options(
            responseType: ResponseType.stream,
            headers: const {'Accept': 'text/event-stream'},
            // LLM генерирует ответ долго: общий receiveTimeout
            // (30 с) отключаем — чанки идут постоянно.
            receiveTimeout: Duration.zero,
            sendTimeout: const Duration(seconds: 15),
          ),
        )
        .then((response) => response.data!);
  }
}
