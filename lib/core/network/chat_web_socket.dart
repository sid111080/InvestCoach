import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../auth/auth_token_provider.dart';
import '../config/app_config.dart';
import 'chat_ws_backoff.dart';
import 'chat_ws_event.dart';

/// Клиент WebSocket real-time чата.
///
/// URL — из [AppConfig.wsUrl], токен — в query-параметре
/// (WS-спецификация). Автоматическое переподключение
/// с exponential backoff, ping каждые 30 секунд.
///
/// Используется при `AppConfig.useRealServices`; в mock-режиме
/// [connect] не вызывается.
final class ChatWebSocket {
  ChatWebSocket({
    required this._config,
    required this._tokenProvider,
  });

  final AppConfig _config;
  final AuthTokenProvider _tokenProvider;
  final StreamController<ChatWsEvent> _controller =
      StreamController<ChatWsEvent>.broadcast();

  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;
  Timer? _pingTimer;
  bool _intentionallyClosed = false;
  int _reconnectAttempt = 0;
  ChatWsConnectionState _state = ChatWsConnectionState.closed;

  /// Поток событий (broadcast: несколько слушателей).
  Stream<ChatWsEvent> get events => _controller.stream;

  /// Текущее состояние соединения.
  ChatWsConnectionState get state => _state;

  /// Подключиться и авторизоваться. Повторные вызовы игнорируются,
  /// пока соединение активно.
  Future<void> connect() async {
    if (_intentionallyClosed) return;
    if (_state == ChatWsConnectionState.active ||
        _state == ChatWsConnectionState.connecting) {
      return;
    }
    await _open();
  }

  /// Закрывает соединение навсегда (без автопереподключения).
  void close() {
    _intentionallyClosed = true;
    _pingTimer?.cancel();
    _subscription?.cancel();
    _channel?.sink.close();
    _channel = null;
    _setState(ChatWsConnectionState.closed);
    _controller.close();
  }

  // Клиентские события (раздел 3 WS-спецификации).

  void sendMessage({
    required String content,
    String? contextType,
    String? newsId,
    String? parentMessageId,
  }) {
    _sendRaw({
      'type': 'send_message',
      'payload': {
        'content': content,
        'context_type': ?contextType,
        'news_id': ?newsId,
        'parent_message_id': parentMessageId,
      },
    });
  }

  void startVoiceSession({String contextType = 'general'}) {
    _sendRaw({
      'type': 'start_voice_session',
      'payload': {'context_type': contextType},
    });
  }

  void sendVoiceChunk({
    required String voiceSessionId,
    required String audioBase64Chunk,
    required int sequence,
    required bool isFinal,
  }) {
    _sendRaw({
      'type': 'send_voice_chunk',
      'payload': {
        'voice_session_id': voiceSessionId,
        'audio_base64_chunk': audioBase64Chunk,
        'sequence': sequence,
        'is_final': isFinal,
      },
    });
  }

  // ───────────────────────── Внутреннее ─────────────────────────

  void _sendRaw(Map<String, Object?> message) {
    if (_state != ChatWsConnectionState.active) return;
    _channel?.sink.add(jsonEncode(message));
  }

  Future<void> _open() async {
    _setState(ChatWsConnectionState.connecting);
    _stopPing();

    final token = await _tokenProvider.token();
    final uri = Uri.parse(_config.wsUrl);
    final channel = WebSocketChannel.connect(
      uri.replace(
        queryParameters: {
          ...uri.queryParameters,
          'token': ?token,
        },
      ),
    );
    _channel = channel;

    _subscription = channel.stream.listen(
      (data) => _onData(data),
      onDone: _onClosed,
      onError: (Object error, StackTrace stackTrace) => _onClosed(),
    );

    // Авторизация дублируется сообщением (раздел 3, событие `auth`).
    if (token != null) {
      _channel?.sink.add(
        jsonEncode({'type': 'auth', 'payload': {'token': token}}),
      );
    }
  }

  void _onData(dynamic data) {
    if (data is! String) return;
    Map<String, dynamic> json;
    try {
      final decoded = jsonDecode(data);
      if (decoded is! Map<String, dynamic>) return;
      json = decoded;
    } on FormatException {
      return;
    }

    // auth_success переводит соединение в рабочий режим.
    if (json['type'] == 'auth_success') {
      _reconnectAttempt = 0;
      _setState(ChatWsConnectionState.authenticated);
      _setState(ChatWsConnectionState.active);
      _startPing();
    }
    final event = parseChatWsMessage(json);
    if (event != null) _emit(event);
  }

  void _onClosed() {
    _stopPing();
    _subscription?.cancel();
    _subscription = null;
    _channel?.sink.close();
    _channel = null;

    if (_intentionallyClosed) {
      _setState(ChatWsConnectionState.closed);
      return;
    }

    _setState(ChatWsConnectionState.reconnecting);
    final delay = reconnectBackoff(attempt: _reconnectAttempt);
    _reconnectAttempt++;
    Timer(delay, () {
      if (!_intentionallyClosed) unawaited(_open());
    });
  }

  void _startPing() {
    _stopPing();
    _pingTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      _sendRaw({'type': 'ping'});
    });
  }

  void _stopPing() {
    _pingTimer?.cancel();
    _pingTimer = null;
  }

  void _setState(ChatWsConnectionState newState) {
    if (_state == newState) return;
    _state = newState;
    _emit(ChatWsEvent.state(newState));
  }

  void _emit(ChatWsEvent event) {
    if (!_controller.isClosed) _controller.add(event);
  }
}
