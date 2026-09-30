import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/user_preferences.dart';

/// Локальное состояние онбординга.
///
/// Храним флаг «онбординг пройден» + имя пользователя
/// (нужно для приветствия на главном экране) + последние
/// предпочтения. SharedPreferences достаточно лёгкого
/// объёма данных; при росте (кеши пользовательских данных)
/// перенесём в Hive.
abstract interface class OnboardingStateRepository {
  /// Пройдён ли онбординг.
  Future<bool> get isCompleted;

  /// Пройдён ли онбординг — синхронно.
  ///
  /// SharedPreferences отдаёт данные из памяти после `getInstance`,
  /// поэтому чтение безопасно. Нужно для синхронного redirect
  /// в роутере без «мигания» экранов.
  bool get isCompletedNow;

  /// Имя пользователя (для приветствия), если онбординг пройден.
  Future<String?> get userName;

  /// Имя синхронно (SharedPreferences читает из памяти) —
  /// для приветствия на главном экране без лишнего build-цикла.
  String? get currentUserName;

  /// Последние сохранённые предпочтения.
  Future<UserPreferences?> get preferences;

  /// Отмечает онбординг завершённым и кэширует данные пользователя.
  Future<void> complete({
    required String userName,
    required UserPreferences preferences,
  });
}

/// Реализация на [SharedPreferences].
final class SharedPreferencesOnboardingState
    implements OnboardingStateRepository {
  SharedPreferencesOnboardingState(this._prefs);

  final SharedPreferences _prefs;

  static const String _completedKey = 'onboarding_completed';
  static const String _nameKey = 'onboarding_user_name';
  static const String _preferencesKey = 'onboarding_preferences';

  @override
  Future<bool> get isCompleted async =>
      _prefs.getBool(_completedKey) ?? false;

  @override
  bool get isCompletedNow => _prefs.getBool(_completedKey) ?? false;

  @override
  Future<String?> get userName async {
    if (!await isCompleted) return null;
    return _prefs.getString(_nameKey);
  }

  @override
  String? get currentUserName {
    if (!(_prefs.getBool(_completedKey) ?? false)) return null;
    return _prefs.getString(_nameKey);
  }

  @override
  Future<UserPreferences?> get preferences async {
    final raw = _prefs.getString(_preferencesKey);
    if (raw == null) return null;
    return UserPreferences.fromJson(jsonDecode(raw));
  }

  @override
  Future<void> complete({
    required String userName,
    required UserPreferences preferences,
  }) async {
    await _prefs.setBool(_completedKey, true);
    await _prefs.setString(_nameKey, userName);
    await _prefs.setString(_preferencesKey, jsonEncode(preferences.toJson()));
  }
}

/// В-памяти реализация для тестов.
final class InMemoryOnboardingState implements OnboardingStateRepository {
  InMemoryOnboardingState({
    this.completed = false,
    this.storedName,
    this.storedPreferences,
  });

  bool completed;
  String? storedName;
  UserPreferences? storedPreferences;

  @override
  Future<bool> get isCompleted async => completed;

  @override
  bool get isCompletedNow => completed;

  @override
  Future<String?> get userName async => completed ? storedName : null;

  @override
  String? get currentUserName => completed ? storedName : null;

  @override
  Future<UserPreferences?> get preferences async => storedPreferences;

  @override
  Future<void> complete({
    required String userName,
    required UserPreferences preferences,
  }) async {
    storedName = userName;
    storedPreferences = preferences;
    completed = true;
  }
}
