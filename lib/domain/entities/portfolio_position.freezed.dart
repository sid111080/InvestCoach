// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PortfolioPosition {

 String get ticker; String get name; int get quantity; double get avgPriceRub; double get currentPriceRub; double get dayChangePercent;
/// Create a copy of PortfolioPosition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioPositionCopyWith<PortfolioPosition> get copyWith => _$PortfolioPositionCopyWithImpl<PortfolioPosition>(this as PortfolioPosition, _$identity);

  /// Serializes this PortfolioPosition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PortfolioPosition;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioPosition&&(identical(other.ticker, _this.ticker) || other.ticker == _this.ticker)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.avgPriceRub, _this.avgPriceRub) || other.avgPriceRub == _this.avgPriceRub)&&(identical(other.currentPriceRub, _this.currentPriceRub) || other.currentPriceRub == _this.currentPriceRub)&&(identical(other.dayChangePercent, _this.dayChangePercent) || other.dayChangePercent == _this.dayChangePercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PortfolioPosition;
  return Object.hash(runtimeType,_this.ticker,_this.name,_this.quantity,_this.avgPriceRub,_this.currentPriceRub,_this.dayChangePercent);
}

@override
String toString() {
  final _this = this as PortfolioPosition;
  return 'PortfolioPosition(ticker: ${_this.ticker}, name: ${_this.name}, quantity: ${_this.quantity}, avgPriceRub: ${_this.avgPriceRub}, currentPriceRub: ${_this.currentPriceRub}, dayChangePercent: ${_this.dayChangePercent})';
}


}

/// @nodoc
abstract mixin class $PortfolioPositionCopyWith<$Res>  {
  factory $PortfolioPositionCopyWith(PortfolioPosition value, $Res Function(PortfolioPosition) _then) = _$PortfolioPositionCopyWithImpl;
@useResult
$Res call({
 String ticker, String name, int quantity, double avgPriceRub, double currentPriceRub, double dayChangePercent
});




}
/// @nodoc
class _$PortfolioPositionCopyWithImpl<$Res>
    implements $PortfolioPositionCopyWith<$Res> {
  _$PortfolioPositionCopyWithImpl(this._self, this._then);

  final PortfolioPosition _self;
  final $Res Function(PortfolioPosition) _then;

/// Create a copy of PortfolioPosition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ticker = null,Object? name = null,Object? quantity = null,Object? avgPriceRub = null,Object? currentPriceRub = null,Object? dayChangePercent = null,}) {
  return _then(PortfolioPosition(
ticker: null == ticker ? _self.ticker : ticker // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,avgPriceRub: null == avgPriceRub ? _self.avgPriceRub : avgPriceRub // ignore: cast_nullable_to_non_nullable
as double,currentPriceRub: null == currentPriceRub ? _self.currentPriceRub : currentPriceRub // ignore: cast_nullable_to_non_nullable
as double,dayChangePercent: null == dayChangePercent ? _self.dayChangePercent : dayChangePercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioPosition].
extension PortfolioPositionPatterns on PortfolioPosition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioPosition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioPosition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioPosition value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioPosition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioPosition value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioPosition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ticker,  String name,  int quantity,  double avgPriceRub,  double currentPriceRub,  double dayChangePercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioPosition() when $default != null:
return $default(_that.ticker,_that.name,_that.quantity,_that.avgPriceRub,_that.currentPriceRub,_that.dayChangePercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ticker,  String name,  int quantity,  double avgPriceRub,  double currentPriceRub,  double dayChangePercent)  $default,) {final _that = this;
switch (_that) {
case _PortfolioPosition():
return $default(_that.ticker,_that.name,_that.quantity,_that.avgPriceRub,_that.currentPriceRub,_that.dayChangePercent);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ticker,  String name,  int quantity,  double avgPriceRub,  double currentPriceRub,  double dayChangePercent)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioPosition() when $default != null:
return $default(_that.ticker,_that.name,_that.quantity,_that.avgPriceRub,_that.currentPriceRub,_that.dayChangePercent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioPosition extends PortfolioPosition {
  const _PortfolioPosition({required this.ticker, required this.name, required this.quantity, required this.avgPriceRub, required this.currentPriceRub, required this.dayChangePercent}): super._();
  factory _PortfolioPosition.fromJson(Map<String, dynamic> json) => _$PortfolioPositionFromJson(json);

@override final  String ticker;
@override final  String name;
@override final  int quantity;
@override final  double avgPriceRub;
@override final  double currentPriceRub;
@override final  double dayChangePercent;

/// Create a copy of PortfolioPosition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioPositionCopyWith<_PortfolioPosition> get copyWith => __$PortfolioPositionCopyWithImpl<_PortfolioPosition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioPositionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioPosition&&(identical(other.ticker, ticker) || other.ticker == ticker)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.avgPriceRub, avgPriceRub) || other.avgPriceRub == avgPriceRub)&&(identical(other.currentPriceRub, currentPriceRub) || other.currentPriceRub == currentPriceRub)&&(identical(other.dayChangePercent, dayChangePercent) || other.dayChangePercent == dayChangePercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,ticker,name,quantity,avgPriceRub,currentPriceRub,dayChangePercent);
}

@override
String toString() {
    return 'PortfolioPosition(ticker: $ticker, name: $name, quantity: $quantity, avgPriceRub: $avgPriceRub, currentPriceRub: $currentPriceRub, dayChangePercent: $dayChangePercent)';
}


}

/// @nodoc
abstract mixin class _$PortfolioPositionCopyWith<$Res> implements $PortfolioPositionCopyWith<$Res> {
  factory _$PortfolioPositionCopyWith(_PortfolioPosition value, $Res Function(_PortfolioPosition) _then) = __$PortfolioPositionCopyWithImpl;
@override @useResult
$Res call({
 String ticker, String name, int quantity, double avgPriceRub, double currentPriceRub, double dayChangePercent
});




}
/// @nodoc
class __$PortfolioPositionCopyWithImpl<$Res>
    implements _$PortfolioPositionCopyWith<$Res> {
  __$PortfolioPositionCopyWithImpl(this._self, this._then);

  final _PortfolioPosition _self;
  final $Res Function(_PortfolioPosition) _then;

/// Create a copy of PortfolioPosition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ticker = null,Object? name = null,Object? quantity = null,Object? avgPriceRub = null,Object? currentPriceRub = null,Object? dayChangePercent = null,}) {
  return _then(_PortfolioPosition(
ticker: null == ticker ? _self.ticker : ticker // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,avgPriceRub: null == avgPriceRub ? _self.avgPriceRub : avgPriceRub // ignore: cast_nullable_to_non_nullable
as double,currentPriceRub: null == currentPriceRub ? _self.currentPriceRub : currentPriceRub // ignore: cast_nullable_to_non_nullable
as double,dayChangePercent: null == dayChangePercent ? _self.dayChangePercent : dayChangePercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
