// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthResponseDto {

 bool get success; UserDto get user; String? get accessToken; String? get refreshToken;
/// Create a copy of AuthResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseDtoCopyWith<AuthResponseDto> get copyWith => _$AuthResponseDtoCopyWithImpl<AuthResponseDto>(this as AuthResponseDto, _$identity);

  /// Serializes this AuthResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AuthResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponseDto&&(identical(other.success, _this.success) || other.success == _this.success)&&(identical(other.user, _this.user) || other.user == _this.user)&&(identical(other.accessToken, _this.accessToken) || other.accessToken == _this.accessToken)&&(identical(other.refreshToken, _this.refreshToken) || other.refreshToken == _this.refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AuthResponseDto;
  return Object.hash(runtimeType,_this.success,_this.user,_this.accessToken,_this.refreshToken);
}

@override
String toString() {
  final _this = this as AuthResponseDto;
  return 'AuthResponseDto(success: ${_this.success}, user: ${_this.user}, accessToken: ${_this.accessToken}, refreshToken: ${_this.refreshToken})';
}


}

/// @nodoc
abstract mixin class $AuthResponseDtoCopyWith<$Res>  {
  factory $AuthResponseDtoCopyWith(AuthResponseDto value, $Res Function(AuthResponseDto) _then) = _$AuthResponseDtoCopyWithImpl;
@useResult
$Res call({
 bool success, UserDto user, String? accessToken, String? refreshToken
});


$UserDtoCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthResponseDtoCopyWithImpl<$Res>
    implements $AuthResponseDtoCopyWith<$Res> {
  _$AuthResponseDtoCopyWithImpl(this._self, this._then);

  final AuthResponseDto _self;
  final $Res Function(AuthResponseDto) _then;

/// Create a copy of AuthResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? user = null,Object? accessToken = freezed,Object? refreshToken = freezed,}) {
  return _then(AuthResponseDto(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AuthResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthResponseDto].
extension AuthResponseDtoPatterns on AuthResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _AuthResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  UserDto user,  String? accessToken,  String? refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResponseDto() when $default != null:
return $default(_that.success,_that.user,_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  UserDto user,  String? accessToken,  String? refreshToken)  $default,) {final _that = this;
switch (_that) {
case _AuthResponseDto():
return $default(_that.success,_that.user,_that.accessToken,_that.refreshToken);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  UserDto user,  String? accessToken,  String? refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _AuthResponseDto() when $default != null:
return $default(_that.success,_that.user,_that.accessToken,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthResponseDto implements AuthResponseDto {
  const _AuthResponseDto({this.success = false, required this.user, this.accessToken, this.refreshToken});
  factory _AuthResponseDto.fromJson(Map<String, dynamic> json) => _$AuthResponseDtoFromJson(json);

@override@JsonKey() final  bool success;
@override final  UserDto user;
@override final  String? accessToken;
@override final  String? refreshToken;

/// Create a copy of AuthResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseDtoCopyWith<_AuthResponseDto> get copyWith => __$AuthResponseDtoCopyWithImpl<_AuthResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,success,user,accessToken,refreshToken);
}

@override
String toString() {
    return 'AuthResponseDto(success: $success, user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseDtoCopyWith<$Res> implements $AuthResponseDtoCopyWith<$Res> {
  factory _$AuthResponseDtoCopyWith(_AuthResponseDto value, $Res Function(_AuthResponseDto) _then) = __$AuthResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 bool success, UserDto user, String? accessToken, String? refreshToken
});


@override $UserDtoCopyWith<$Res> get user;

}
/// @nodoc
class __$AuthResponseDtoCopyWithImpl<$Res>
    implements _$AuthResponseDtoCopyWith<$Res> {
  __$AuthResponseDtoCopyWithImpl(this._self, this._then);

  final _AuthResponseDto _self;
  final $Res Function(_AuthResponseDto) _then;

/// Create a copy of AuthResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? user = null,Object? accessToken = freezed,Object? refreshToken = freezed,}) {
  return _then(_AuthResponseDto(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDto,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AuthResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDtoCopyWith<$Res> get user {
  
  return $UserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$UserDto {

 String get id; String get name; String get tier; DateTime get createdAt; UserPreferencesDto? get preferences;
/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDtoCopyWith<UserDto> get copyWith => _$UserDtoCopyWithImpl<UserDto>(this as UserDto, _$identity);

  /// Serializes this UserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.preferences, _this.preferences) || other.preferences == _this.preferences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.tier,_this.createdAt,_this.preferences);
}

@override
String toString() {
  final _this = this as UserDto;
  return 'UserDto(id: ${_this.id}, name: ${_this.name}, tier: ${_this.tier}, createdAt: ${_this.createdAt}, preferences: ${_this.preferences})';
}


}

/// @nodoc
abstract mixin class $UserDtoCopyWith<$Res>  {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) _then) = _$UserDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String tier, DateTime createdAt, UserPreferencesDto? preferences
});


$UserPreferencesDtoCopyWith<$Res>? get preferences;

}
/// @nodoc
class _$UserDtoCopyWithImpl<$Res>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._self, this._then);

  final UserDto _self;
  final $Res Function(UserDto) _then;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tier = null,Object? createdAt = null,Object? preferences = freezed,}) {
  return _then(UserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,preferences: freezed == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferencesDto?,
  ));
}
/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPreferencesDtoCopyWith<$Res>? get preferences {
    if (_self.preferences == null) {
    return null;
  }

  return $UserPreferencesDtoCopyWith<$Res>(_self.preferences!, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserDto].
extension UserDtoPatterns on UserDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDto value)  $default,){
final _that = this;
switch (_that) {
case _UserDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String tier,  DateTime createdAt,  UserPreferencesDto? preferences)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that.id,_that.name,_that.tier,_that.createdAt,_that.preferences);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String tier,  DateTime createdAt,  UserPreferencesDto? preferences)  $default,) {final _that = this;
switch (_that) {
case _UserDto():
return $default(_that.id,_that.name,_that.tier,_that.createdAt,_that.preferences);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String tier,  DateTime createdAt,  UserPreferencesDto? preferences)?  $default,) {final _that = this;
switch (_that) {
case _UserDto() when $default != null:
return $default(_that.id,_that.name,_that.tier,_that.createdAt,_that.preferences);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDto implements UserDto {
  const _UserDto({required this.id, required this.name, this.tier = 'free', required this.createdAt, this.preferences});
  factory _UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String tier;
@override final  DateTime createdAt;
@override final  UserPreferencesDto? preferences;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDtoCopyWith<_UserDto> get copyWith => __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.preferences, preferences) || other.preferences == preferences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,tier,createdAt,preferences);
}

@override
String toString() {
    return 'UserDto(id: $id, name: $name, tier: $tier, createdAt: $createdAt, preferences: $preferences)';
}


}

/// @nodoc
abstract mixin class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) _then) = __$UserDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String tier, DateTime createdAt, UserPreferencesDto? preferences
});


@override $UserPreferencesDtoCopyWith<$Res>? get preferences;

}
/// @nodoc
class __$UserDtoCopyWithImpl<$Res>
    implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(this._self, this._then);

  final _UserDto _self;
  final $Res Function(_UserDto) _then;

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tier = null,Object? createdAt = null,Object? preferences = freezed,}) {
  return _then(_UserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,preferences: freezed == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferencesDto?,
  ));
}

/// Create a copy of UserDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPreferencesDtoCopyWith<$Res>? get preferences {
    if (_self.preferences == null) {
    return null;
  }

  return $UserPreferencesDtoCopyWith<$Res>(_self.preferences!, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}


/// @nodoc
mixin _$UserPreferencesDto {

 String get experienceLevel; List<String> get mainGoals; String get riskTolerance; String? get communicationStyle;
/// Create a copy of UserPreferencesDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPreferencesDtoCopyWith<UserPreferencesDto> get copyWith => _$UserPreferencesDtoCopyWithImpl<UserPreferencesDto>(this as UserPreferencesDto, _$identity);

  /// Serializes this UserPreferencesDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserPreferencesDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPreferencesDto&&(identical(other.experienceLevel, _this.experienceLevel) || other.experienceLevel == _this.experienceLevel)&&const DeepCollectionEquality().equals(other.mainGoals, _this.mainGoals)&&(identical(other.riskTolerance, _this.riskTolerance) || other.riskTolerance == _this.riskTolerance)&&(identical(other.communicationStyle, _this.communicationStyle) || other.communicationStyle == _this.communicationStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserPreferencesDto;
  return Object.hash(runtimeType,_this.experienceLevel,const DeepCollectionEquality().hash(_this.mainGoals),_this.riskTolerance,_this.communicationStyle);
}

@override
String toString() {
  final _this = this as UserPreferencesDto;
  return 'UserPreferencesDto(experienceLevel: ${_this.experienceLevel}, mainGoals: ${_this.mainGoals}, riskTolerance: ${_this.riskTolerance}, communicationStyle: ${_this.communicationStyle})';
}


}

/// @nodoc
abstract mixin class $UserPreferencesDtoCopyWith<$Res>  {
  factory $UserPreferencesDtoCopyWith(UserPreferencesDto value, $Res Function(UserPreferencesDto) _then) = _$UserPreferencesDtoCopyWithImpl;
@useResult
$Res call({
 String experienceLevel, List<String> mainGoals, String riskTolerance, String? communicationStyle
});




}
/// @nodoc
class _$UserPreferencesDtoCopyWithImpl<$Res>
    implements $UserPreferencesDtoCopyWith<$Res> {
  _$UserPreferencesDtoCopyWithImpl(this._self, this._then);

  final UserPreferencesDto _self;
  final $Res Function(UserPreferencesDto) _then;

/// Create a copy of UserPreferencesDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? experienceLevel = null,Object? mainGoals = null,Object? riskTolerance = null,Object? communicationStyle = freezed,}) {
  return _then(UserPreferencesDto(
experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String,mainGoals: null == mainGoals ? _self.mainGoals : mainGoals // ignore: cast_nullable_to_non_nullable
as List<String>,riskTolerance: null == riskTolerance ? _self.riskTolerance : riskTolerance // ignore: cast_nullable_to_non_nullable
as String,communicationStyle: freezed == communicationStyle ? _self.communicationStyle : communicationStyle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPreferencesDto].
extension UserPreferencesDtoPatterns on UserPreferencesDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPreferencesDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPreferencesDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPreferencesDto value)  $default,){
final _that = this;
switch (_that) {
case _UserPreferencesDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPreferencesDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserPreferencesDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String experienceLevel,  List<String> mainGoals,  String riskTolerance,  String? communicationStyle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPreferencesDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String experienceLevel,  List<String> mainGoals,  String riskTolerance,  String? communicationStyle)  $default,) {final _that = this;
switch (_that) {
case _UserPreferencesDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String experienceLevel,  List<String> mainGoals,  String riskTolerance,  String? communicationStyle)?  $default,) {final _that = this;
switch (_that) {
case _UserPreferencesDto() when $default != null:
return $default(_that.experienceLevel,_that.mainGoals,_that.riskTolerance,_that.communicationStyle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPreferencesDto implements UserPreferencesDto {
  const _UserPreferencesDto({this.experienceLevel = 'beginner',  List<String> mainGoals = const <String>[], this.riskTolerance = 'moderate', this.communicationStyle}): _mainGoals = mainGoals;
  factory _UserPreferencesDto.fromJson(Map<String, dynamic> json) => _$UserPreferencesDtoFromJson(json);

@override@JsonKey() final  String experienceLevel;
 final  List<String> _mainGoals;
@override@JsonKey() List<String> get mainGoals {
  if (_mainGoals is EqualUnmodifiableListView) return _mainGoals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mainGoals);
}

@override@JsonKey() final  String riskTolerance;
@override final  String? communicationStyle;

/// Create a copy of UserPreferencesDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPreferencesDtoCopyWith<_UserPreferencesDto> get copyWith => __$UserPreferencesDtoCopyWithImpl<_UserPreferencesDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPreferencesDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPreferencesDto&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&const DeepCollectionEquality().equals(other.mainGoals, _mainGoals)&&(identical(other.riskTolerance, riskTolerance) || other.riskTolerance == riskTolerance)&&(identical(other.communicationStyle, communicationStyle) || other.communicationStyle == communicationStyle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,experienceLevel,const DeepCollectionEquality().hash(_mainGoals),riskTolerance,communicationStyle);
}

@override
String toString() {
    return 'UserPreferencesDto(experienceLevel: $experienceLevel, mainGoals: $mainGoals, riskTolerance: $riskTolerance, communicationStyle: $communicationStyle)';
}


}

/// @nodoc
abstract mixin class _$UserPreferencesDtoCopyWith<$Res> implements $UserPreferencesDtoCopyWith<$Res> {
  factory _$UserPreferencesDtoCopyWith(_UserPreferencesDto value, $Res Function(_UserPreferencesDto) _then) = __$UserPreferencesDtoCopyWithImpl;
@override @useResult
$Res call({
 String experienceLevel, List<String> mainGoals, String riskTolerance, String? communicationStyle
});




}
/// @nodoc
class __$UserPreferencesDtoCopyWithImpl<$Res>
    implements _$UserPreferencesDtoCopyWith<$Res> {
  __$UserPreferencesDtoCopyWithImpl(this._self, this._then);

  final _UserPreferencesDto _self;
  final $Res Function(_UserPreferencesDto) _then;

/// Create a copy of UserPreferencesDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? experienceLevel = null,Object? mainGoals = null,Object? riskTolerance = null,Object? communicationStyle = freezed,}) {
  return _then(_UserPreferencesDto(
experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String,mainGoals: null == mainGoals ? _self._mainGoals : mainGoals // ignore: cast_nullable_to_non_nullable
as List<String>,riskTolerance: null == riskTolerance ? _self.riskTolerance : riskTolerance // ignore: cast_nullable_to_non_nullable
as String,communicationStyle: freezed == communicationStyle ? _self.communicationStyle : communicationStyle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
