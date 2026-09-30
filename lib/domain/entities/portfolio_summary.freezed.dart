// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PortfolioSummary {

/// Стоимость портфеля в рублях (целое число, как в ТЗ).
 int get totalValueRub;/// Дневная доходность, в процентах (может быть отрицательной).
 double get dailyChangePercent;/// Изменение стоимости за день, в рублях.
 int? get dailyChangeRub;/// Долевая аллокация в процентах (сумма ≈ 100).
 Map<String, double> get allocation;
/// Create a copy of PortfolioSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioSummaryCopyWith<PortfolioSummary> get copyWith => _$PortfolioSummaryCopyWithImpl<PortfolioSummary>(this as PortfolioSummary, _$identity);

  /// Serializes this PortfolioSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PortfolioSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioSummary&&(identical(other.totalValueRub, _this.totalValueRub) || other.totalValueRub == _this.totalValueRub)&&(identical(other.dailyChangePercent, _this.dailyChangePercent) || other.dailyChangePercent == _this.dailyChangePercent)&&(identical(other.dailyChangeRub, _this.dailyChangeRub) || other.dailyChangeRub == _this.dailyChangeRub)&&const DeepCollectionEquality().equals(other.allocation, _this.allocation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PortfolioSummary;
  return Object.hash(runtimeType,_this.totalValueRub,_this.dailyChangePercent,_this.dailyChangeRub,const DeepCollectionEquality().hash(_this.allocation));
}

@override
String toString() {
  final _this = this as PortfolioSummary;
  return 'PortfolioSummary(totalValueRub: ${_this.totalValueRub}, dailyChangePercent: ${_this.dailyChangePercent}, dailyChangeRub: ${_this.dailyChangeRub}, allocation: ${_this.allocation})';
}


}

/// @nodoc
abstract mixin class $PortfolioSummaryCopyWith<$Res>  {
  factory $PortfolioSummaryCopyWith(PortfolioSummary value, $Res Function(PortfolioSummary) _then) = _$PortfolioSummaryCopyWithImpl;
@useResult
$Res call({
 int totalValueRub, double dailyChangePercent, int? dailyChangeRub, Map<String, double> allocation
});




}
/// @nodoc
class _$PortfolioSummaryCopyWithImpl<$Res>
    implements $PortfolioSummaryCopyWith<$Res> {
  _$PortfolioSummaryCopyWithImpl(this._self, this._then);

  final PortfolioSummary _self;
  final $Res Function(PortfolioSummary) _then;

/// Create a copy of PortfolioSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalValueRub = null,Object? dailyChangePercent = null,Object? dailyChangeRub = freezed,Object? allocation = null,}) {
  return _then(PortfolioSummary(
totalValueRub: null == totalValueRub ? _self.totalValueRub : totalValueRub // ignore: cast_nullable_to_non_nullable
as int,dailyChangePercent: null == dailyChangePercent ? _self.dailyChangePercent : dailyChangePercent // ignore: cast_nullable_to_non_nullable
as double,dailyChangeRub: freezed == dailyChangeRub ? _self.dailyChangeRub : dailyChangeRub // ignore: cast_nullable_to_non_nullable
as int?,allocation: null == allocation ? _self.allocation : allocation // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioSummary].
extension PortfolioSummaryPatterns on PortfolioSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioSummary value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioSummary value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalValueRub,  double dailyChangePercent,  int? dailyChangeRub,  Map<String, double> allocation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioSummary() when $default != null:
return $default(_that.totalValueRub,_that.dailyChangePercent,_that.dailyChangeRub,_that.allocation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalValueRub,  double dailyChangePercent,  int? dailyChangeRub,  Map<String, double> allocation)  $default,) {final _that = this;
switch (_that) {
case _PortfolioSummary():
return $default(_that.totalValueRub,_that.dailyChangePercent,_that.dailyChangeRub,_that.allocation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalValueRub,  double dailyChangePercent,  int? dailyChangeRub,  Map<String, double> allocation)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioSummary() when $default != null:
return $default(_that.totalValueRub,_that.dailyChangePercent,_that.dailyChangeRub,_that.allocation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioSummary implements PortfolioSummary {
  const _PortfolioSummary({required this.totalValueRub, required this.dailyChangePercent, this.dailyChangeRub,  Map<String, double> allocation = const <String, double>{}}): _allocation = allocation;
  factory _PortfolioSummary.fromJson(Map<String, dynamic> json) => _$PortfolioSummaryFromJson(json);

/// Стоимость портфеля в рублях (целое число, как в ТЗ).
@override final  int totalValueRub;
/// Дневная доходность, в процентах (может быть отрицательной).
@override final  double dailyChangePercent;
/// Изменение стоимости за день, в рублях.
@override final  int? dailyChangeRub;
/// Долевая аллокация в процентах (сумма ≈ 100).
 final  Map<String, double> _allocation;
/// Долевая аллокация в процентах (сумма ≈ 100).
@override@JsonKey() Map<String, double> get allocation {
  if (_allocation is EqualUnmodifiableMapView) return _allocation;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_allocation);
}


/// Create a copy of PortfolioSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioSummaryCopyWith<_PortfolioSummary> get copyWith => __$PortfolioSummaryCopyWithImpl<_PortfolioSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioSummary&&(identical(other.totalValueRub, totalValueRub) || other.totalValueRub == totalValueRub)&&(identical(other.dailyChangePercent, dailyChangePercent) || other.dailyChangePercent == dailyChangePercent)&&(identical(other.dailyChangeRub, dailyChangeRub) || other.dailyChangeRub == dailyChangeRub)&&const DeepCollectionEquality().equals(other.allocation, _allocation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,totalValueRub,dailyChangePercent,dailyChangeRub,const DeepCollectionEquality().hash(_allocation));
}

@override
String toString() {
    return 'PortfolioSummary(totalValueRub: $totalValueRub, dailyChangePercent: $dailyChangePercent, dailyChangeRub: $dailyChangeRub, allocation: $allocation)';
}


}

/// @nodoc
abstract mixin class _$PortfolioSummaryCopyWith<$Res> implements $PortfolioSummaryCopyWith<$Res> {
  factory _$PortfolioSummaryCopyWith(_PortfolioSummary value, $Res Function(_PortfolioSummary) _then) = __$PortfolioSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalValueRub, double dailyChangePercent, int? dailyChangeRub, Map<String, double> allocation
});




}
/// @nodoc
class __$PortfolioSummaryCopyWithImpl<$Res>
    implements _$PortfolioSummaryCopyWith<$Res> {
  __$PortfolioSummaryCopyWithImpl(this._self, this._then);

  final _PortfolioSummary _self;
  final $Res Function(_PortfolioSummary) _then;

/// Create a copy of PortfolioSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalValueRub = null,Object? dailyChangePercent = null,Object? dailyChangeRub = freezed,Object? allocation = null,}) {
  return _then(_PortfolioSummary(
totalValueRub: null == totalValueRub ? _self.totalValueRub : totalValueRub // ignore: cast_nullable_to_non_nullable
as int,dailyChangePercent: null == dailyChangePercent ? _self.dailyChangePercent : dailyChangePercent // ignore: cast_nullable_to_non_nullable
as double,dailyChangeRub: freezed == dailyChangeRub ? _self.dailyChangeRub : dailyChangeRub // ignore: cast_nullable_to_non_nullable
as int?,allocation: null == allocation ? _self._allocation : allocation // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

// dart format on
