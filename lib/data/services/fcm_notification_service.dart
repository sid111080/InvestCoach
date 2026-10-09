import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../domain/services/notification_service.dart';

/// Реальная реализация [NotificationService] через Firebase Cloud Messaging.
///
/// - Регистрация FCM-токена при старте.
/// - Foreground-уведомления: показываются через callback.
/// - Background: обрабатываются через `onBackgroundMessage` (top-level).
/// - Категории: `daily_news`, `weekly_review`, `new_lesson`.
final class FcmNotificationService implements NotificationService {
  FcmNotificationService() : _firebaseMessaging = FirebaseMessaging.instance;

  final FirebaseMessaging _firebaseMessaging;
  final Map<String, bool> _categories = {
    'daily_news': true,
    'weekly_review': true,
    'new_lesson': true,
  };

  String? _token;
  final StreamController<String> _tokenController =
      StreamController<String>.broadcast();
  StreamSubscription<String>? _tokenSub;
  StreamSubscription<RemoteMessage>? _messageSub;
  StreamSubscription<RemoteMessage>? _openedAppSub;

  void Function(Map<String, String> payload)? _onTapped;

  @override
  String? get token => _token;

  @override
  Stream<String> get tokenStream => _tokenController.stream;

  @override
  set onNotificationTapped(void Function(Map<String, String>) callback) {
    _onTapped = callback;
  }

  @override
  Future<void> initialize() async {
    // Запрос разрешения.
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Текущий токен.
    _token = await _firebaseMessaging.getToken();
    if (_token != null && !_tokenController.isClosed) {
      _tokenController.add(_token!);
    }

    // Ротация токена.
    _tokenSub = _firebaseMessaging.onTokenRefresh.listen((newToken) {
      _token = newToken;
      if (!_tokenController.isClosed) {
        _tokenController.add(newToken);
      }
    });

    // Foreground-уведомления.
    _messageSub = FirebaseMessaging.onMessage.listen((remoteMessage) {
      final payload = <String, String>{
        ...remoteMessage.data,
        'title': remoteMessage.notification?.title ?? '',
        'body': remoteMessage.notification?.body ?? '',
      };
      _onTapped?.call(payload);
    });

    // Tap по уведомлению (foreground).
    _openedAppSub = FirebaseMessaging.onMessageOpenedApp.listen(
      (remoteMessage) {
        final payload = <String, String>{
          ...remoteMessage.data,
          'title': remoteMessage.notification?.title ?? '',
          'body': remoteMessage.notification?.body ?? '',
        };
        _onTapped?.call(payload);
      },
    );
  }

  @override
  Future<void> setCategoryEnabled(String category, bool enabled) async {
    _categories[category] = enabled;
  }

  @override
  bool isCategoryEnabled(String category) => _categories[category] ?? false;

  void dispose() {
    _tokenSub?.cancel();
    _messageSub?.cancel();
    _openedAppSub?.cancel();
    _tokenController.close();
  }
}
