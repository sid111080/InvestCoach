// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPreferences {

 ExperienceLevel get experienceLevel; List<MainGoal> get mainGoals; RiskTolerance get riskTolerance; CommunicationStyle? get communicationStyle;
/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<UserPreferences> get copyWith => _$UserPreferencesCopyWithImpl<UserPreferences>(this as UserPreferences, _$identity);

  /// Serializes this UserPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserPreferences;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPreferences&&(identical(other.experienceLevel, _this.experienceLevel) || other.experienceLevel == _this.experienceLevel)&&const DeepCollectionEquality().equals(other.mainGoals, _this.mainGoals)&&(identical(other.riskTolerance, _this.riskTolerance) || other.riskTolerance == _this.riskTolerance)&&(identical(other.communicationStyle, _this.communicationStyle) || other.communicationStyle == _this.communicationStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserPreferences;
  return Object.hash(runtimeType,_this.experienceLevel,const DeepCollectionEquality().hash(_this.mainGoals),_this.riskTolerance,_this.communicationStyle);
}

@override
String toString() {
  final _this = this as UserPreferences;
  return 'UserPreferences(experienceLevel: ${_this.experienceLevel}, mainGoals: ${_this.mainGoals}, riskTolerance: ${_this.riskTolerance}, communicationStyle: ${_this.communicationStyle})';
}


}

/// @nodoc
abstract mixin class $UserPreferencesCopyWith<$Res>  {
  factory $UserPreferencesCopyWith(UserPreferences value, $Res Function(UserPreferences) _then) = _$UserPreferencesCopyWithImpl;
@useResult
$Res call({
 ExperienceLevel experienceLevel, List<MainGoal> mainGoals, RiskTolerance riskTolerance, CommunicationStyle? communicationStyle
});




}
/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._self, this._then);

  final UserPreferences _self;
  final $Res Function(UserPreferences) _then;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? experienceLevel = null,Object? mainGoals = null,Object? riskTolerance = null,Object? communicationStyle = freezed,}) {
  return _then(UserPreferences(
experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as ExperienceLevel,mainGoals: null == mainGoals ? _self.mainGoals : mainGoals // ignore: cast_nullable_to_non_nullable
as List<MainGoal>,riskTolerance: null == riskTolerance ? _self.riskTolerance : riskTolerance // ignore: cast_nullable_to_non_nullable
as RiskTolerance,communicationStyle: freezed == communicationStyle ? _self.communicationStyle : communicationStyle // ignore: cast_nullable_to_non_nullable
as CommunicationStyle?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPreferences].
extension UserPreferencesPatterns on UserPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPreferences value)  $default,){
final _that = this;
switch (_that) {
case _UserPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ExperienceLevel experienceLevel,  List<MainGoal> mainGoals,  RiskTolerance riskTolerance,  CommunicationStyle? communicationStyle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
return $default(_that.experienceLevel,_that.mainGoals,_that.riskTolerance,_that.communicationStyle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ExperienceLevel experienceLevel,  List<MainGoal> mainGoals,  RiskTolerance riskTolerance,  CommunicationStyle? communicationStyle)  $default,) {final _that = this;
switch (_that) {
case _UserPreferences():
return $default(_that.experienceLevel,_that.mainGoals,_that.riskTolerance,_that.communicationStyle);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ExperienceLevel experienceLevel,  List<MainGoal> mainGoals,  RiskTolerance riskTolerance,  CommunicationStyle? communicationStyle)?  $default,) {final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
return $default(_that.experienceLevel,_that.mainGoals,_that.riskTolerance,_that.communicationStyle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPreferences implements UserPreferences {
  const _UserPreferences({this.experienceLevel = ExperienceLevel.beginner,  List<MainGoal> mainGoals = const <MainGoal>[], this.riskTolerance = RiskTolerance.moderate, this.communicationStyle}): _mainGoals = mainGoals;
  factory _UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);

@override@JsonKey() final  ExperienceLevel experienceLevel;
 final  List<MainGoal> _mainGoals;
@override@JsonKey() List<MainGoal> get mainGoals {
  if (_mainGoals is EqualUnmodifiableListView) return _mainGoals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mainGoals);
}

@override@JsonKey() final  RiskTolerance riskTolerance;
@override final  CommunicationStyle? communicationStyle;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPreferencesCopyWith<_UserPreferences> get copyWith => __$UserPreferencesCopyWithImpl<_UserPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPreferences&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&const DeepCollectionEquality().equals(other.mainGoals, _mainGoals)&&(identical(other.riskTolerance, riskTolerance) || other.riskTolerance == riskTolerance)&&(identical(other.communicationStyle, communicationStyle) || other.communicationStyle == communicationStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,experienceLevel,const DeepCollectionEquality().hash(_mainGoals),riskTolerance,communicationStyle);
}

@override
String toString() {
    return 'UserPreferences(experienceLevel: $experienceLevel, mainGoals: $mainGoals, riskTolerance: $riskTolerance, communicationStyle: $communicationStyle)';
}


}

/// @nodoc
abstract mixin class _$UserPreferencesCopyWith<$Res> implements $UserPreferencesCopyWith<$Res> {
  factory _$UserPreferencesCopyWith(_UserPreferences value, $Res Function(_UserPreferences) _then) = __$UserPreferencesCopyWithImpl;
@override @useResult
$Res call({
 ExperienceLevel experienceLevel, List<MainGoal> mainGoals, RiskTolerance riskTolerance, CommunicationStyle? communicationStyle
});




}
/// @nodoc
class __$UserPreferencesCopyWithImpl<$Res>
    implements _$UserPreferencesCopyWith<$Res> {
  __$UserPreferencesCopyWithImpl(this._self, this._then);

  final _UserPreferences _self;
  final $Res Function(_UserPreferences) _then;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? experienceLevel = null,Object? mainGoals = null,Object? riskTolerance = null,Object? communicationStyle = freezed,}) {
  return _then(_UserPreferences(
experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as ExperienceLevel,mainGoals: null == mainGoals ? _self._mainGoals : mainGoals // ignore: cast_nullable_to_non_nullable
as List<MainGoal>,riskTolerance: null == riskTolerance ? _self.riskTolerance : riskTolerance // ignore: cast_nullable_to_non_nullable
as RiskTolerance,communicationStyle: freezed == communicationStyle ? _self.communicationStyle : communicationStyle // ignore: cast_nullable_to_non_nullable
as CommunicationStyle?,
  ));
}


}

// dart format on
