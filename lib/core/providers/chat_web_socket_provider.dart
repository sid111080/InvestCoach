import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth_token_provider.dart';
import '../di/injection_container.dart';
import '../network/chat_web_socket.dart';
import 'app_providers.dart';

/// Клиент real-time чата (WebSocket).
///
/// Подключается только в реальном режиме (`USE_REAL_SERVICES=true`);
/// в mock-режиме остаётся в состоянии `closed` — UI работает
/// через [chatRepositoryProvider] (mock стриминга).
final chatWebSocketProvider = Provider<ChatWebSocket>((ref) {
  final config = ref.watch(appConfigProvider);
  final webSocket = ChatWebSocket(
    config: config,
    tokenProvider: getIt<AuthTokenProvider>(),
  );
  if (config.useRealServices) {
    unawaited(webSocket.connect());
  }
  ref.onDispose(webSocket.close);
  return webSocket;
});
