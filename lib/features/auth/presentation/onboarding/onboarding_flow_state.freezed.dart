// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingFlowState {

/// Текущий шаг: 0 — приветствие, 1 — имя, 2 — опыт,
/// 3 — цели, 4 — риск + стиль общения.
 int get step;/// Введённое на шаге 1 имя (trim-ится перед отправкой).
 String get name;/// Ответ шага 2.
 ExperienceLevel get experienceLevel;/// Ответ шага 3 (мультивыбор).
 List<MainGoal> get mainGoals;/// Ответ шага 4.
 RiskTolerance get riskTolerance;/// Ответ шага 4.
 CommunicationStyle get communicationStyle;/// В полёте запрос «создать аккаунт» (`POST /auth/firebase`).
 bool get creatingAccount;/// Финальный этап: «создаём Coach» (анимация + сохранение).
 bool get creatingCoach;/// Онбординг завершён: локальный флаг выставлен, роутер
/// перенаправляет на главный экран.
 bool get completed;/// Сбой последнего запроса (показывается с кнопкой «Повторить»).
 AppException? get error;
/// Create a copy of OnboardingFlowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingFlowStateCopyWith<OnboardingFlowState> get copyWith => _$OnboardingFlowStateCopyWithImpl<OnboardingFlowState>(this as OnboardingFlowState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OnboardingFlowState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingFlowState&&(identical(other.step, _this.step) || other.step == _this.step)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.experienceLevel, _this.experienceLevel) || other.experienceLevel == _this.experienceLevel)&&const DeepCollectionEquality().equals(other.mainGoals, _this.mainGoals)&&(identical(other.riskTolerance, _this.riskTolerance) || other.riskTolerance == _this.riskTolerance)&&(identical(other.communicationStyle, _this.communicationStyle) || other.communicationStyle == _this.communicationStyle)&&(identical(other.creatingAccount, _this.creatingAccount) || other.creatingAccount == _this.creatingAccount)&&(identical(other.creatingCoach, _this.creatingCoach) || other.creatingCoach == _this.creatingCoach)&&(identical(other.completed, _this.completed) || other.completed == _this.completed)&&(identical(other.error, _this.error) || other.error == _this.error));
}


@override
int get hashCode {
  final _this = this as OnboardingFlowState;
  return Object.hash(runtimeType,_this.step,_this.name,_this.experienceLevel,const DeepCollectionEquality().hash(_this.mainGoals),_this.riskTolerance,_this.communicationStyle,_this.creatingAccount,_this.creatingCoach,_this.completed,_this.error);
}

@override
String toString() {
  final _this = this as OnboardingFlowState;
  return 'OnboardingFlowState(step: ${_this.step}, name: ${_this.name}, experienceLevel: ${_this.experienceLevel}, mainGoals: ${_this.mainGoals}, riskTolerance: ${_this.riskTolerance}, communicationStyle: ${_this.communicationStyle}, creatingAccount: ${_this.creatingAccount}, creatingCoach: ${_this.creatingCoach}, completed: ${_this.completed}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $OnboardingFlowStateCopyWith<$Res>  {
  factory $OnboardingFlowStateCopyWith(OnboardingFlowState value, $Res Function(OnboardingFlowState) _then) = _$OnboardingFlowStateCopyWithImpl;
@useResult
$Res call({
 int step, String name, ExperienceLevel experienceLevel, List<MainGoal> mainGoals, RiskTolerance riskTolerance, CommunicationStyle communicationStyle, bool creatingAccount, bool creatingCoach, bool completed, AppException? error
});




}
/// @nodoc
class _$OnboardingFlowStateCopyWithImpl<$Res>
    implements $OnboardingFlowStateCopyWith<$Res> {
  _$OnboardingFlowStateCopyWithImpl(this._self, this._then);

  final OnboardingFlowState _self;
  final $Res Function(OnboardingFlowState) _then;

/// Create a copy of OnboardingFlowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? name = null,Object? experienceLevel = null,Object? mainGoals = null,Object? riskTolerance = null,Object? communicationStyle = null,Object? creatingAccount = null,Object? creatingCoach = null,Object? completed = null,Object? error = freezed,}) {
  return _then(OnboardingFlowState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as ExperienceLevel,mainGoals: null == mainGoals ? _self.mainGoals : mainGoals // ignore: cast_nullable_to_non_nullable
as List<MainGoal>,riskTolerance: null == riskTolerance ? _self.riskTolerance : riskTolerance // ignore: cast_nullable_to_non_nullable
as RiskTolerance,communicationStyle: null == communicationStyle ? _self.communicationStyle : communicationStyle // ignore: cast_nullable_to_non_nullable
as CommunicationStyle,creatingAccount: null == creatingAccount ? _self.creatingAccount : creatingAccount // ignore: cast_nullable_to_non_nullable
as bool,creatingCoach: null == creatingCoach ? _self.creatingCoach : creatingCoach // ignore: cast_nullable_to_non_nullable
as bool,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingFlowState].
extension OnboardingFlowStatePatterns on OnboardingFlowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingFlowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingFlowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingFlowState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingFlowState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingFlowState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingFlowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int step,  String name,  ExperienceLevel experienceLevel,  List<MainGoal> mainGoals,  RiskTolerance riskTolerance,  CommunicationStyle communicationStyle,  bool creatingAccount,  bool creatingCoach,  bool completed,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingFlowState() when $default != null:
return $default(_that.step,_that.name,_that.experienceLevel,_that.mainGoals,_that.riskTolerance,_that.communicationStyle,_that.creatingAccount,_that.creatingCoach,_that.completed,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int step,  String name,  ExperienceLevel experienceLevel,  List<MainGoal> mainGoals,  RiskTolerance riskTolerance,  CommunicationStyle communicationStyle,  bool creatingAccount,  bool creatingCoach,  bool completed,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _OnboardingFlowState():
return $default(_that.step,_that.name,_that.experienceLevel,_that.mainGoals,_that.riskTolerance,_that.communicationStyle,_that.creatingAccount,_that.creatingCoach,_that.completed,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int step,  String name,  ExperienceLevel experienceLevel,  List<MainGoal> mainGoals,  RiskTolerance riskTolerance,  CommunicationStyle communicationStyle,  bool creatingAccount,  bool creatingCoach,  bool completed,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingFlowState() when $default != null:
return $default(_that.step,_that.name,_that.experienceLevel,_that.mainGoals,_that.riskTolerance,_that.communicationStyle,_that.creatingAccount,_that.creatingCoach,_that.completed,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingFlowState implements OnboardingFlowState {
  const _OnboardingFlowState({this.step = 0, this.name = '', this.experienceLevel = ExperienceLevel.beginner,  List<MainGoal> mainGoals = const <MainGoal>[], this.riskTolerance = RiskTolerance.moderate, this.communicationStyle = CommunicationStyle.detailed, this.creatingAccount = false, this.creatingCoach = false, this.completed = false, this.error}): _mainGoals = mainGoals;
  

/// Текущий шаг: 0 — приветствие, 1 — имя, 2 — опыт,
/// 3 — цели, 4 — риск + стиль общения.
@override@JsonKey() final  int step;
/// Введённое на шаге 1 имя (trim-ится перед отправкой).
@override@JsonKey() final  String name;
/// Ответ шага 2.
@override@JsonKey() final  ExperienceLevel experienceLevel;
/// Ответ шага 3 (мультивыбор).
 final  List<MainGoal> _mainGoals;
/// Ответ шага 3 (мультивыбор).
@override@JsonKey() List<MainGoal> get mainGoals {
  if (_mainGoals is EqualUnmodifiableListView) return _mainGoals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mainGoals);
}

/// Ответ шага 4.
@override@JsonKey() final  RiskTolerance riskTolerance;
/// Ответ шага 4.
@override@JsonKey() final  CommunicationStyle communicationStyle;
/// В полёте запрос «создать аккаунт» (`POST /auth/firebase`).
@override@JsonKey() final  bool creatingAccount;
/// Финальный этап: «создаём Coach» (анимация + сохранение).
@override@JsonKey() final  bool creatingCoach;
/// Онбординг завершён: локальный флаг выставлен, роутер
/// перенаправляет на главный экран.
@override@JsonKey() final  bool completed;
/// Сбой последнего запроса (показывается с кнопкой «Повторить»).
@override final  AppException? error;

/// Create a copy of OnboardingFlowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingFlowStateCopyWith<_OnboardingFlowState> get copyWith => __$OnboardingFlowStateCopyWithImpl<_OnboardingFlowState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingFlowState&&(identical(other.step, step) || other.step == step)&&(identical(other.name, name) || other.name == name)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&const DeepCollectionEquality().equals(other.mainGoals, _mainGoals)&&(identical(other.riskTolerance, riskTolerance) || other.riskTolerance == riskTolerance)&&(identical(other.communicationStyle, communicationStyle) || other.communicationStyle == communicationStyle)&&(identical(other.creatingAccount, creatingAccount) || other.creatingAccount == creatingAccount)&&(identical(other.creatingCoach, creatingCoach) || other.creatingCoach == creatingCoach)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,step,name,experienceLevel,const DeepCollectionEquality().hash(_mainGoals),riskTolerance,communicationStyle,creatingAccount,creatingCoach,completed,error);
}

@override
String toString() {
    return 'OnboardingFlowState(step: $step, name: $name, experienceLevel: $experienceLevel, mainGoals: $mainGoals, riskTolerance: $riskTolerance, communicationStyle: $communicationStyle, creatingAccount: $creatingAccount, creatingCoach: $creatingCoach, completed: $completed, error: $error)';
}


}

/// @nodoc
abstract mixin class _$OnboardingFlowStateCopyWith<$Res> implements $OnboardingFlowStateCopyWith<$Res> {
  factory _$OnboardingFlowStateCopyWith(_OnboardingFlowState value, $Res Function(_OnboardingFlowState) _then) = __$OnboardingFlowStateCopyWithImpl;
@override @useResult
$Res call({
 int step, String name, ExperienceLevel experienceLevel, List<MainGoal> mainGoals, RiskTolerance riskTolerance, CommunicationStyle communicationStyle, bool creatingAccount, bool creatingCoach, bool completed, AppException? error
});




}
/// @nodoc
class __$OnboardingFlowStateCopyWithImpl<$Res>
    implements _$OnboardingFlowStateCopyWith<$Res> {
  __$OnboardingFlowStateCopyWithImpl(this._self, this._then);

  final _OnboardingFlowState _self;
  final $Res Function(_OnboardingFlowState) _then;

/// Create a copy of OnboardingFlowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? name = null,Object? experienceLevel = null,Object? mainGoals = null,Object? riskTolerance = null,Object? communicationStyle = null,Object? creatingAccount = null,Object? creatingCoach = null,Object? completed = null,Object? error = freezed,}) {
  return _then(_OnboardingFlowState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as ExperienceLevel,mainGoals: null == mainGoals ? _self._mainGoals : mainGoals // ignore: cast_nullable_to_non_nullable
as List<MainGoal>,riskTolerance: null == riskTolerance ? _self.riskTolerance : riskTolerance // ignore: cast_nullable_to_non_nullable
as RiskTolerance,communicationStyle: null == communicationStyle ? _self.communicationStyle : communicationStyle // ignore: cast_nullable_to_non_nullable
as CommunicationStyle,creatingAccount: null == creatingAccount ? _self.creatingAccount : creatingAccount // ignore: cast_nullable_to_non_nullable
as bool,creatingCoach: null == creatingCoach ? _self.creatingCoach : creatingCoach // ignore: cast_nullable_to_non_nullable
as bool,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}


}

// dart format on
