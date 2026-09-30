// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PortfolioSummaryDto {

 int get totalValueRub; double get dailyChangePercent; int? get dailyChangeRub; Map<String, double> get allocation;
/// Create a copy of PortfolioSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioSummaryDtoCopyWith<PortfolioSummaryDto> get copyWith => _$PortfolioSummaryDtoCopyWithImpl<PortfolioSummaryDto>(this as PortfolioSummaryDto, _$identity);

  /// Serializes this PortfolioSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PortfolioSummaryDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioSummaryDto&&(identical(other.totalValueRub, _this.totalValueRub) || other.totalValueRub == _this.totalValueRub)&&(identical(other.dailyChangePercent, _this.dailyChangePercent) || other.dailyChangePercent == _this.dailyChangePercent)&&(identical(other.dailyChangeRub, _this.dailyChangeRub) || other.dailyChangeRub == _this.dailyChangeRub)&&const DeepCollectionEquality().equals(other.allocation, _this.allocation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PortfolioSummaryDto;
  return Object.hash(runtimeType,_this.totalValueRub,_this.dailyChangePercent,_this.dailyChangeRub,const DeepCollectionEquality().hash(_this.allocation));
}

@override
String toString() {
  final _this = this as PortfolioSummaryDto;
  return 'PortfolioSummaryDto(totalValueRub: ${_this.totalValueRub}, dailyChangePercent: ${_this.dailyChangePercent}, dailyChangeRub: ${_this.dailyChangeRub}, allocation: ${_this.allocation})';
}


}

/// @nodoc
abstract mixin class $PortfolioSummaryDtoCopyWith<$Res>  {
  factory $PortfolioSummaryDtoCopyWith(PortfolioSummaryDto value, $Res Function(PortfolioSummaryDto) _then) = _$PortfolioSummaryDtoCopyWithImpl;
@useResult
$Res call({
 int totalValueRub, double dailyChangePercent, int? dailyChangeRub, Map<String, double> allocation
});




}
/// @nodoc
class _$PortfolioSummaryDtoCopyWithImpl<$Res>
    implements $PortfolioSummaryDtoCopyWith<$Res> {
  _$PortfolioSummaryDtoCopyWithImpl(this._self, this._then);

  final PortfolioSummaryDto _self;
  final $Res Function(PortfolioSummaryDto) _then;

/// Create a copy of PortfolioSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalValueRub = null,Object? dailyChangePercent = null,Object? dailyChangeRub = freezed,Object? allocation = null,}) {
  return _then(PortfolioSummaryDto(
totalValueRub: null == totalValueRub ? _self.totalValueRub : totalValueRub // ignore: cast_nullable_to_non_nullable
as int,dailyChangePercent: null == dailyChangePercent ? _self.dailyChangePercent : dailyChangePercent // ignore: cast_nullable_to_non_nullable
as double,dailyChangeRub: freezed == dailyChangeRub ? _self.dailyChangeRub : dailyChangeRub // ignore: cast_nullable_to_non_nullable
as int?,allocation: null == allocation ? _self.allocation : allocation // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioSummaryDto].
extension PortfolioSummaryDtoPatterns on PortfolioSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioSummaryDto() when $default != null:
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
case _PortfolioSummaryDto() when $default != null:
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
case _PortfolioSummaryDto():
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
case _PortfolioSummaryDto() when $default != null:
return $default(_that.totalValueRub,_that.dailyChangePercent,_that.dailyChangeRub,_that.allocation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioSummaryDto implements PortfolioSummaryDto {
  const _PortfolioSummaryDto({this.totalValueRub = 0, this.dailyChangePercent = 0.0, this.dailyChangeRub,  Map<String, double> allocation = const <String, double>{}}): _allocation = allocation;
  factory _PortfolioSummaryDto.fromJson(Map<String, dynamic> json) => _$PortfolioSummaryDtoFromJson(json);

@override@JsonKey() final  int totalValueRub;
@override@JsonKey() final  double dailyChangePercent;
@override final  int? dailyChangeRub;
 final  Map<String, double> _allocation;
@override@JsonKey() Map<String, double> get allocation {
  if (_allocation is EqualUnmodifiableMapView) return _allocation;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_allocation);
}


/// Create a copy of PortfolioSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioSummaryDtoCopyWith<_PortfolioSummaryDto> get copyWith => __$PortfolioSummaryDtoCopyWithImpl<_PortfolioSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioSummaryDto&&(identical(other.totalValueRub, totalValueRub) || other.totalValueRub == totalValueRub)&&(identical(other.dailyChangePercent, dailyChangePercent) || other.dailyChangePercent == dailyChangePercent)&&(identical(other.dailyChangeRub, dailyChangeRub) || other.dailyChangeRub == dailyChangeRub)&&const DeepCollectionEquality().equals(other.allocation, _allocation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,totalValueRub,dailyChangePercent,dailyChangeRub,const DeepCollectionEquality().hash(_allocation));
}

@override
String toString() {
    return 'PortfolioSummaryDto(totalValueRub: $totalValueRub, dailyChangePercent: $dailyChangePercent, dailyChangeRub: $dailyChangeRub, allocation: $allocation)';
}


}

/// @nodoc
abstract mixin class _$PortfolioSummaryDtoCopyWith<$Res> implements $PortfolioSummaryDtoCopyWith<$Res> {
  factory _$PortfolioSummaryDtoCopyWith(_PortfolioSummaryDto value, $Res Function(_PortfolioSummaryDto) _then) = __$PortfolioSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 int totalValueRub, double dailyChangePercent, int? dailyChangeRub, Map<String, double> allocation
});




}
/// @nodoc
class __$PortfolioSummaryDtoCopyWithImpl<$Res>
    implements _$PortfolioSummaryDtoCopyWith<$Res> {
  __$PortfolioSummaryDtoCopyWithImpl(this._self, this._then);

  final _PortfolioSummaryDto _self;
  final $Res Function(_PortfolioSummaryDto) _then;

/// Create a copy of PortfolioSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalValueRub = null,Object? dailyChangePercent = null,Object? dailyChangeRub = freezed,Object? allocation = null,}) {
  return _then(_PortfolioSummaryDto(
totalValueRub: null == totalValueRub ? _self.totalValueRub : totalValueRub // ignore: cast_nullable_to_non_nullable
as int,dailyChangePercent: null == dailyChangePercent ? _self.dailyChangePercent : dailyChangePercent // ignore: cast_nullable_to_non_nullable
as double,dailyChangeRub: freezed == dailyChangeRub ? _self.dailyChangeRub : dailyChangeRub // ignore: cast_nullable_to_non_nullable
as int?,allocation: null == allocation ? _self._allocation : allocation // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

// dart format on
