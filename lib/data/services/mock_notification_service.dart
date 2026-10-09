import 'dart:async';

import '../../domain/services/notification_service.dart';

/// Mock [NotificationService] для тестов и mock-режима.
final class MockNotificationService implements NotificationService {
  MockNotificationService({this.mockToken = 'mock-fcm-token'});

  final String? mockToken;
  final Map<String, bool> _categories = {
    'daily_news': true,
    'weekly_review': true,
    'new_lesson': true,
  };

  String? _token;
  final StreamController<String> _tokenController =
      StreamController<String>.broadcast();

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
    _token = mockToken;
    if (_token != null) {
      _tokenController.add(_token!);
    }
  }

  @override
  Future<void> setCategoryEnabled(String category, bool enabled) async {
    _categories[category] = enabled;
  }

  @override
  bool isCategoryEnabled(String category) => _categories[category] ?? false;

  /// Симулировать входящее уведомление (для тестов).
  void simulateNotification(Map<String, String> payload) {
    _onTapped?.call(payload);
  }

  void dispose() {
    _tokenController.close();
  }
}
