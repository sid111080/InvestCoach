import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

/// Сервис мониторинга сети.
///
/// Поток [isOnline] обновляется при смене типа соединения.
/// В mock-режиме всегда `true`.
final class ConnectivityService {
  ConnectivityService({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _sub;
  bool _online = true;
  final StreamController<bool> _controller =
      StreamController<bool>.broadcast();

  /// Текущий статус сети.
  bool get isOnline => _online;

  /// Поток изменений (true = онлайн, false = оффлайн).
  Stream<bool> get onlineChanged => _controller.stream;

  Future<void> initialize() async {
    final result = await _connectivity.checkConnectivity();
    _online = !result.contains(ConnectivityResult.none);
    if (!_controller.isClosed) _controller.add(_online);

    _sub = _connectivity.onConnectivityChanged.listen((results) {
      final online = !results.contains(ConnectivityResult.none);
      if (online != _online) {
        _online = online;
        if (!_controller.isClosed) _controller.add(online);
      }
    });
  }

  void dispose() {
    _sub?.cancel();
    _controller.close();
  }
}
