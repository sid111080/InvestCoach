import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stats.freezed.dart';
part 'user_stats.g.dart';

/// Статистика пользователя за последние 30 дней (из `GET /users/me`).
@freezed
sealed class UserStats with _$UserStats {
  const factory UserStats({
    /// Текущий streak (дней подряд общения с Coach).
    @Default(0) int currentStreak,

    /// Среднее количество взаимодействий в день.
    @Default(0.0) double avgInteractionsPerDay,

    /// Топ-3 темы, которые пользователь чаще всего обсуждает.
    @Default(<String>[]) List<String> topTopics,

    /// Мягкая визуализация bias-паттернов (без негатива).
    @Default(<String>[]) List<String> biasPatterns,

    /// Общее количество дней активности.
    @Default(0) int activeDays,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
}
