// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionStatus {

 UserTier get tier; int get pullRequestsLeft; int get pullRequestsLimit; bool get newsPlusActive;/// Дата следующего списания (null для Free).
 DateTime? get expiresAt;/// На какой тариф можно апгрейдиться.
 UserTier get canUpgradeTo;
/// Create a copy of SubscriptionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionStatusCopyWith<SubscriptionStatus> get copyWith => _$SubscriptionStatusCopyWithImpl<SubscriptionStatus>(this as SubscriptionStatus, _$identity);

  /// Serializes this SubscriptionStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SubscriptionStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionStatus&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&(identical(other.pullRequestsLeft, _this.pullRequestsLeft) || other.pullRequestsLeft == _this.pullRequestsLeft)&&(identical(other.pullRequestsLimit, _this.pullRequestsLimit) || other.pullRequestsLimit == _this.pullRequestsLimit)&&(identical(other.newsPlusActive, _this.newsPlusActive) || other.newsPlusActive == _this.newsPlusActive)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.canUpgradeTo, _this.canUpgradeTo) || other.canUpgradeTo == _this.canUpgradeTo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SubscriptionStatus;
  return Object.hash(runtimeType,_this.tier,_this.pullRequestsLeft,_this.pullRequestsLimit,_this.newsPlusActive,_this.expiresAt,_this.canUpgradeTo);
}

@override
String toString() {
  final _this = this as SubscriptionStatus;
  return 'SubscriptionStatus(tier: ${_this.tier}, pullRequestsLeft: ${_this.pullRequestsLeft}, pullRequestsLimit: ${_this.pullRequestsLimit}, newsPlusActive: ${_this.newsPlusActive}, expiresAt: ${_this.expiresAt}, canUpgradeTo: ${_this.canUpgradeTo})';
}


}

/// @nodoc
abstract mixin class $SubscriptionStatusCopyWith<$Res>  {
  factory $SubscriptionStatusCopyWith(SubscriptionStatus value, $Res Function(SubscriptionStatus) _then) = _$SubscriptionStatusCopyWithImpl;
@useResult
$Res call({
 UserTier tier, int pullRequestsLeft, int pullRequestsLimit, bool newsPlusActive, DateTime? expiresAt, UserTier canUpgradeTo
});




}
/// @nodoc
class _$SubscriptionStatusCopyWithImpl<$Res>
    implements $SubscriptionStatusCopyWith<$Res> {
  _$SubscriptionStatusCopyWithImpl(this._self, this._then);

  final SubscriptionStatus _self;
  final $Res Function(SubscriptionStatus) _then;

/// Create a copy of SubscriptionStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tier = null,Object? pullRequestsLeft = null,Object? pullRequestsLimit = null,Object? newsPlusActive = null,Object? expiresAt = freezed,Object? canUpgradeTo = null,}) {
  return _then(SubscriptionStatus(
tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as UserTier,pullRequestsLeft: null == pullRequestsLeft ? _self.pullRequestsLeft : pullRequestsLeft // ignore: cast_nullable_to_non_nullable
as int,pullRequestsLimit: null == pullRequestsLimit ? _self.pullRequestsLimit : pullRequestsLimit // ignore: cast_nullable_to_non_nullable
as int,newsPlusActive: null == newsPlusActive ? _self.newsPlusActive : newsPlusActive // ignore: cast_nullable_to_non_nullable
as bool,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,canUpgradeTo: null == canUpgradeTo ? _self.canUpgradeTo : canUpgradeTo // ignore: cast_nullable_to_non_nullable
as UserTier,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionStatus].
extension SubscriptionStatusPatterns on SubscriptionStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionStatus value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionStatus value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserTier tier,  int pullRequestsLeft,  int pullRequestsLimit,  bool newsPlusActive,  DateTime? expiresAt,  UserTier canUpgradeTo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionStatus() when $default != null:
return $default(_that.tier,_that.pullRequestsLeft,_that.pullRequestsLimit,_that.newsPlusActive,_that.expiresAt,_that.canUpgradeTo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserTier tier,  int pullRequestsLeft,  int pullRequestsLimit,  bool newsPlusActive,  DateTime? expiresAt,  UserTier canUpgradeTo)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionStatus():
return $default(_that.tier,_that.pullRequestsLeft,_that.pullRequestsLimit,_that.newsPlusActive,_that.expiresAt,_that.canUpgradeTo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserTier tier,  int pullRequestsLeft,  int pullRequestsLimit,  bool newsPlusActive,  DateTime? expiresAt,  UserTier canUpgradeTo)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionStatus() when $default != null:
return $default(_that.tier,_that.pullRequestsLeft,_that.pullRequestsLimit,_that.newsPlusActive,_that.expiresAt,_that.canUpgradeTo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionStatus implements SubscriptionStatus {
  const _SubscriptionStatus({this.tier = UserTier.free, this.pullRequestsLeft = 8, this.pullRequestsLimit = 8, this.newsPlusActive = false, this.expiresAt, this.canUpgradeTo = UserTier.newsPlus});
  factory _SubscriptionStatus.fromJson(Map<String, dynamic> json) => _$SubscriptionStatusFromJson(json);

@override@JsonKey() final  UserTier tier;
@override@JsonKey() final  int pullRequestsLeft;
@override@JsonKey() final  int pullRequestsLimit;
@override@JsonKey() final  bool newsPlusActive;
/// Дата следующего списания (null для Free).
@override final  DateTime? expiresAt;
/// На какой тариф можно апгрейдиться.
@override@JsonKey() final  UserTier canUpgradeTo;

/// Create a copy of SubscriptionStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionStatusCopyWith<_SubscriptionStatus> get copyWith => __$SubscriptionStatusCopyWithImpl<_SubscriptionStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionStatusToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionStatus&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.pullRequestsLeft, pullRequestsLeft) || other.pullRequestsLeft == pullRequestsLeft)&&(identical(other.pullRequestsLimit, pullRequestsLimit) || other.pullRequestsLimit == pullRequestsLimit)&&(identical(other.newsPlusActive, newsPlusActive) || other.newsPlusActive == newsPlusActive)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.canUpgradeTo, canUpgradeTo) || other.canUpgradeTo == canUpgradeTo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,tier,pullRequestsLeft,pullRequestsLimit,newsPlusActive,expiresAt,canUpgradeTo);
}

@override
String toString() {
    return 'SubscriptionStatus(tier: $tier, pullRequestsLeft: $pullRequestsLeft, pullRequestsLimit: $pullRequestsLimit, newsPlusActive: $newsPlusActive, expiresAt: $expiresAt, canUpgradeTo: $canUpgradeTo)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionStatusCopyWith<$Res> implements $SubscriptionStatusCopyWith<$Res> {
  factory _$SubscriptionStatusCopyWith(_SubscriptionStatus value, $Res Function(_SubscriptionStatus) _then) = __$SubscriptionStatusCopyWithImpl;
@override @useResult
$Res call({
 UserTier tier, int pullRequestsLeft, int pullRequestsLimit, bool newsPlusActive, DateTime? expiresAt, UserTier canUpgradeTo
});




}
/// @nodoc
class __$SubscriptionStatusCopyWithImpl<$Res>
    implements _$SubscriptionStatusCopyWith<$Res> {
  __$SubscriptionStatusCopyWithImpl(this._self, this._then);

  final _SubscriptionStatus _self;
  final $Res Function(_SubscriptionStatus) _then;

/// Create a copy of SubscriptionStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tier = null,Object? pullRequestsLeft = null,Object? pullRequestsLimit = null,Object? newsPlusActive = null,Object? expiresAt = freezed,Object? canUpgradeTo = null,}) {
  return _then(_SubscriptionStatus(
tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as UserTier,pullRequestsLeft: null == pullRequestsLeft ? _self.pullRequestsLeft : pullRequestsLeft // ignore: cast_nullable_to_non_nullable
as int,pullRequestsLimit: null == pullRequestsLimit ? _self.pullRequestsLimit : pullRequestsLimit // ignore: cast_nullable_to_non_nullable
as int,newsPlusActive: null == newsPlusActive ? _self.newsPlusActive : newsPlusActive // ignore: cast_nullable_to_non_nullable
as bool,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,canUpgradeTo: null == canUpgradeTo ? _self.canUpgradeTo : canUpgradeTo // ignore: cast_nullable_to_non_nullable
as UserTier,
  ));
}


}

// dart format on
