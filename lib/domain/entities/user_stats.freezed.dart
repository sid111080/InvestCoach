// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserStats {

/// Текущий streak (дней подряд общения с Coach).
 int get currentStreak;/// Среднее количество взаимодействий в день.
 double get avgInteractionsPerDay;/// Топ-3 темы, которые пользователь чаще всего обсуждает.
 List<String> get topTopics;/// Мягкая визуализация bias-паттернов (без негатива).
 List<String> get biasPatterns;/// Общее количество дней активности.
 int get activeDays;
/// Create a copy of UserStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStatsCopyWith<UserStats> get copyWith => _$UserStatsCopyWithImpl<UserStats>(this as UserStats, _$identity);

  /// Serializes this UserStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserStats;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStats&&(identical(other.currentStreak, _this.currentStreak) || other.currentStreak == _this.currentStreak)&&(identical(other.avgInteractionsPerDay, _this.avgInteractionsPerDay) || other.avgInteractionsPerDay == _this.avgInteractionsPerDay)&&const DeepCollectionEquality().equals(other.topTopics, _this.topTopics)&&const DeepCollectionEquality().equals(other.biasPatterns, _this.biasPatterns)&&(identical(other.activeDays, _this.activeDays) || other.activeDays == _this.activeDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserStats;
  return Object.hash(runtimeType,_this.currentStreak,_this.avgInteractionsPerDay,const DeepCollectionEquality().hash(_this.topTopics),const DeepCollectionEquality().hash(_this.biasPatterns),_this.activeDays);
}

@override
String toString() {
  final _this = this as UserStats;
  return 'UserStats(currentStreak: ${_this.currentStreak}, avgInteractionsPerDay: ${_this.avgInteractionsPerDay}, topTopics: ${_this.topTopics}, biasPatterns: ${_this.biasPatterns}, activeDays: ${_this.activeDays})';
}


}

/// @nodoc
abstract mixin class $UserStatsCopyWith<$Res>  {
  factory $UserStatsCopyWith(UserStats value, $Res Function(UserStats) _then) = _$UserStatsCopyWithImpl;
@useResult
$Res call({
 int currentStreak, double avgInteractionsPerDay, List<String> topTopics, List<String> biasPatterns, int activeDays
});




}
/// @nodoc
class _$UserStatsCopyWithImpl<$Res>
    implements $UserStatsCopyWith<$Res> {
  _$UserStatsCopyWithImpl(this._self, this._then);

  final UserStats _self;
  final $Res Function(UserStats) _then;

/// Create a copy of UserStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStreak = null,Object? avgInteractionsPerDay = null,Object? topTopics = null,Object? biasPatterns = null,Object? activeDays = null,}) {
  return _then(UserStats(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,avgInteractionsPerDay: null == avgInteractionsPerDay ? _self.avgInteractionsPerDay : avgInteractionsPerDay // ignore: cast_nullable_to_non_nullable
as double,topTopics: null == topTopics ? _self.topTopics : topTopics // ignore: cast_nullable_to_non_nullable
as List<String>,biasPatterns: null == biasPatterns ? _self.biasPatterns : biasPatterns // ignore: cast_nullable_to_non_nullable
as List<String>,activeDays: null == activeDays ? _self.activeDays : activeDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserStats].
extension UserStatsPatterns on UserStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStats value)  $default,){
final _that = this;
switch (_that) {
case _UserStats():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStats value)?  $default,){
final _that = this;
switch (_that) {
case _UserStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStreak,  double avgInteractionsPerDay,  List<String> topTopics,  List<String> biasPatterns,  int activeDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStats() when $default != null:
return $default(_that.currentStreak,_that.avgInteractionsPerDay,_that.topTopics,_that.biasPatterns,_that.activeDays);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStreak,  double avgInteractionsPerDay,  List<String> topTopics,  List<String> biasPatterns,  int activeDays)  $default,) {final _that = this;
switch (_that) {
case _UserStats():
return $default(_that.currentStreak,_that.avgInteractionsPerDay,_that.topTopics,_that.biasPatterns,_that.activeDays);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStreak,  double avgInteractionsPerDay,  List<String> topTopics,  List<String> biasPatterns,  int activeDays)?  $default,) {final _that = this;
switch (_that) {
case _UserStats() when $default != null:
return $default(_that.currentStreak,_that.avgInteractionsPerDay,_that.topTopics,_that.biasPatterns,_that.activeDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserStats implements UserStats {
  const _UserStats({this.currentStreak = 0, this.avgInteractionsPerDay = 0.0,  List<String> topTopics = const <String>[],  List<String> biasPatterns = const <String>[], this.activeDays = 0}): _topTopics = topTopics,_biasPatterns = biasPatterns;
  factory _UserStats.fromJson(Map<String, dynamic> json) => _$UserStatsFromJson(json);

/// Текущий streak (дней подряд общения с Coach).
@override@JsonKey() final  int currentStreak;
/// Среднее количество взаимодействий в день.
@override@JsonKey() final  double avgInteractionsPerDay;
/// Топ-3 темы, которые пользователь чаще всего обсуждает.
 final  List<String> _topTopics;
/// Топ-3 темы, которые пользователь чаще всего обсуждает.
@override@JsonKey() List<String> get topTopics {
  if (_topTopics is EqualUnmodifiableListView) return _topTopics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topTopics);
}

/// Мягкая визуализация bias-паттернов (без негатива).
 final  List<String> _biasPatterns;
/// Мягкая визуализация bias-паттернов (без негатива).
@override@JsonKey() List<String> get biasPatterns {
  if (_biasPatterns is EqualUnmodifiableListView) return _biasPatterns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_biasPatterns);
}

/// Общее количество дней активности.
@override@JsonKey() final  int activeDays;

/// Create a copy of UserStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStatsCopyWith<_UserStats> get copyWith => __$UserStatsCopyWithImpl<_UserStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserStatsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStats&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.avgInteractionsPerDay, avgInteractionsPerDay) || other.avgInteractionsPerDay == avgInteractionsPerDay)&&const DeepCollectionEquality().equals(other.topTopics, _topTopics)&&const DeepCollectionEquality().equals(other.biasPatterns, _biasPatterns)&&(identical(other.activeDays, activeDays) || other.activeDays == activeDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,currentStreak,avgInteractionsPerDay,const DeepCollectionEquality().hash(_topTopics),const DeepCollectionEquality().hash(_biasPatterns),activeDays);
}

@override
String toString() {
    return 'UserStats(currentStreak: $currentStreak, avgInteractionsPerDay: $avgInteractionsPerDay, topTopics: $topTopics, biasPatterns: $biasPatterns, activeDays: $activeDays)';
}


}

/// @nodoc
abstract mixin class _$UserStatsCopyWith<$Res> implements $UserStatsCopyWith<$Res> {
  factory _$UserStatsCopyWith(_UserStats value, $Res Function(_UserStats) _then) = __$UserStatsCopyWithImpl;
@override @useResult
$Res call({
 int currentStreak, double avgInteractionsPerDay, List<String> topTopics, List<String> biasPatterns, int activeDays
});




}
/// @nodoc
class __$UserStatsCopyWithImpl<$Res>
    implements _$UserStatsCopyWith<$Res> {
  __$UserStatsCopyWithImpl(this._self, this._then);

  final _UserStats _self;
  final $Res Function(_UserStats) _then;

/// Create a copy of UserStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStreak = null,Object? avgInteractionsPerDay = null,Object? topTopics = null,Object? biasPatterns = null,Object? activeDays = null,}) {
  return _then(_UserStats(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,avgInteractionsPerDay: null == avgInteractionsPerDay ? _self.avgInteractionsPerDay : avgInteractionsPerDay // ignore: cast_nullable_to_non_nullable
as double,topTopics: null == topTopics ? _self._topTopics : topTopics // ignore: cast_nullable_to_non_nullable
as List<String>,biasPatterns: null == biasPatterns ? _self._biasPatterns : biasPatterns // ignore: cast_nullable_to_non_nullable
as List<String>,activeDays: null == activeDays ? _self.activeDays : activeDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
