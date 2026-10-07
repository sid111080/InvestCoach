// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trade.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Trade {

 String get id; String get ticker; String get name; TradeSide get side; int get quantity; double get priceRub; DateTime get executedAt;/// Короткий комментарий Coach (Instant Trade Feedback).
 String? get coachFeedback;/// Эмоциональный окрас фидбека: positive / neutral / caution.
 String get feedbackTone;
/// Create a copy of Trade
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TradeCopyWith<Trade> get copyWith => _$TradeCopyWithImpl<Trade>(this as Trade, _$identity);

  /// Serializes this Trade to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Trade;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trade&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.ticker, _this.ticker) || other.ticker == _this.ticker)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.side, _this.side) || other.side == _this.side)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.priceRub, _this.priceRub) || other.priceRub == _this.priceRub)&&(identical(other.executedAt, _this.executedAt) || other.executedAt == _this.executedAt)&&(identical(other.coachFeedback, _this.coachFeedback) || other.coachFeedback == _this.coachFeedback)&&(identical(other.feedbackTone, _this.feedbackTone) || other.feedbackTone == _this.feedbackTone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Trade;
  return Object.hash(runtimeType,_this.id,_this.ticker,_this.name,_this.side,_this.quantity,_this.priceRub,_this.executedAt,_this.coachFeedback,_this.feedbackTone);
}

@override
String toString() {
  final _this = this as Trade;
  return 'Trade(id: ${_this.id}, ticker: ${_this.ticker}, name: ${_this.name}, side: ${_this.side}, quantity: ${_this.quantity}, priceRub: ${_this.priceRub}, executedAt: ${_this.executedAt}, coachFeedback: ${_this.coachFeedback}, feedbackTone: ${_this.feedbackTone})';
}


}

/// @nodoc
abstract mixin class $TradeCopyWith<$Res>  {
  factory $TradeCopyWith(Trade value, $Res Function(Trade) _then) = _$TradeCopyWithImpl;
@useResult
$Res call({
 String id, String ticker, String name, TradeSide side, int quantity, double priceRub, DateTime executedAt, String? coachFeedback, String feedbackTone
});




}
/// @nodoc
class _$TradeCopyWithImpl<$Res>
    implements $TradeCopyWith<$Res> {
  _$TradeCopyWithImpl(this._self, this._then);

  final Trade _self;
  final $Res Function(Trade) _then;

/// Create a copy of Trade
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ticker = null,Object? name = null,Object? side = null,Object? quantity = null,Object? priceRub = null,Object? executedAt = null,Object? coachFeedback = freezed,Object? feedbackTone = null,}) {
  return _then(Trade(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticker: null == ticker ? _self.ticker : ticker // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,side: null == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as TradeSide,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,priceRub: null == priceRub ? _self.priceRub : priceRub // ignore: cast_nullable_to_non_nullable
as double,executedAt: null == executedAt ? _self.executedAt : executedAt // ignore: cast_nullable_to_non_nullable
as DateTime,coachFeedback: freezed == coachFeedback ? _self.coachFeedback : coachFeedback // ignore: cast_nullable_to_non_nullable
as String?,feedbackTone: null == feedbackTone ? _self.feedbackTone : feedbackTone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Trade].
extension TradePatterns on Trade {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Trade value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Trade() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Trade value)  $default,){
final _that = this;
switch (_that) {
case _Trade():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Trade value)?  $default,){
final _that = this;
switch (_that) {
case _Trade() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ticker,  String name,  TradeSide side,  int quantity,  double priceRub,  DateTime executedAt,  String? coachFeedback,  String feedbackTone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trade() when $default != null:
return $default(_that.id,_that.ticker,_that.name,_that.side,_that.quantity,_that.priceRub,_that.executedAt,_that.coachFeedback,_that.feedbackTone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ticker,  String name,  TradeSide side,  int quantity,  double priceRub,  DateTime executedAt,  String? coachFeedback,  String feedbackTone)  $default,) {final _that = this;
switch (_that) {
case _Trade():
return $default(_that.id,_that.ticker,_that.name,_that.side,_that.quantity,_that.priceRub,_that.executedAt,_that.coachFeedback,_that.feedbackTone);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ticker,  String name,  TradeSide side,  int quantity,  double priceRub,  DateTime executedAt,  String? coachFeedback,  String feedbackTone)?  $default,) {final _that = this;
switch (_that) {
case _Trade() when $default != null:
return $default(_that.id,_that.ticker,_that.name,_that.side,_that.quantity,_that.priceRub,_that.executedAt,_that.coachFeedback,_that.feedbackTone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Trade implements Trade {
  const _Trade({required this.id, required this.ticker, required this.name, required this.side, required this.quantity, required this.priceRub, required this.executedAt, this.coachFeedback, this.feedbackTone = 'neutral'});
  factory _Trade.fromJson(Map<String, dynamic> json) => _$TradeFromJson(json);

@override final  String id;
@override final  String ticker;
@override final  String name;
@override final  TradeSide side;
@override final  int quantity;
@override final  double priceRub;
@override final  DateTime executedAt;
/// Короткий комментарий Coach (Instant Trade Feedback).
@override final  String? coachFeedback;
/// Эмоциональный окрас фидбека: positive / neutral / caution.
@override@JsonKey() final  String feedbackTone;

/// Create a copy of Trade
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TradeCopyWith<_Trade> get copyWith => __$TradeCopyWithImpl<_Trade>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TradeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trade&&(identical(other.id, id) || other.id == id)&&(identical(other.ticker, ticker) || other.ticker == ticker)&&(identical(other.name, name) || other.name == name)&&(identical(other.side, side) || other.side == side)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.priceRub, priceRub) || other.priceRub == priceRub)&&(identical(other.executedAt, executedAt) || other.executedAt == executedAt)&&(identical(other.coachFeedback, coachFeedback) || other.coachFeedback == coachFeedback)&&(identical(other.feedbackTone, feedbackTone) || other.feedbackTone == feedbackTone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,ticker,name,side,quantity,priceRub,executedAt,coachFeedback,feedbackTone);
}

@override
String toString() {
    return 'Trade(id: $id, ticker: $ticker, name: $name, side: $side, quantity: $quantity, priceRub: $priceRub, executedAt: $executedAt, coachFeedback: $coachFeedback, feedbackTone: $feedbackTone)';
}


}

/// @nodoc
abstract mixin class _$TradeCopyWith<$Res> implements $TradeCopyWith<$Res> {
  factory _$TradeCopyWith(_Trade value, $Res Function(_Trade) _then) = __$TradeCopyWithImpl;
@override @useResult
$Res call({
 String id, String ticker, String name, TradeSide side, int quantity, double priceRub, DateTime executedAt, String? coachFeedback, String feedbackTone
});




}
/// @nodoc
class __$TradeCopyWithImpl<$Res>
    implements _$TradeCopyWith<$Res> {
  __$TradeCopyWithImpl(this._self, this._then);

  final _Trade _self;
  final $Res Function(_Trade) _then;

/// Create a copy of Trade
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ticker = null,Object? name = null,Object? side = null,Object? quantity = null,Object? priceRub = null,Object? executedAt = null,Object? coachFeedback = freezed,Object? feedbackTone = null,}) {
  return _then(_Trade(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticker: null == ticker ? _self.ticker : ticker // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,side: null == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as TradeSide,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,priceRub: null == priceRub ? _self.priceRub : priceRub // ignore: cast_nullable_to_non_nullable
as double,executedAt: null == executedAt ? _self.executedAt : executedAt // ignore: cast_nullable_to_non_nullable
as DateTime,coachFeedback: freezed == coachFeedback ? _self.coachFeedback : coachFeedback // ignore: cast_nullable_to_non_nullable
as String?,feedbackTone: null == feedbackTone ? _self.feedbackTone : feedbackTone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
