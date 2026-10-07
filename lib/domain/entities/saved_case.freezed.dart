// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedCase {

 String get id; String get topic;/// Короткая выдержка из разговора.
 String get excerpt;/// Дата сохранения.
 DateTime get savedAt;/// Связанный news_id (для перехода в чат с контекстом).
 String? get newsId;
/// Create a copy of SavedCase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedCaseCopyWith<SavedCase> get copyWith => _$SavedCaseCopyWithImpl<SavedCase>(this as SavedCase, _$identity);

  /// Serializes this SavedCase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SavedCase;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedCase&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.topic, _this.topic) || other.topic == _this.topic)&&(identical(other.excerpt, _this.excerpt) || other.excerpt == _this.excerpt)&&(identical(other.savedAt, _this.savedAt) || other.savedAt == _this.savedAt)&&(identical(other.newsId, _this.newsId) || other.newsId == _this.newsId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SavedCase;
  return Object.hash(runtimeType,_this.id,_this.topic,_this.excerpt,_this.savedAt,_this.newsId);
}

@override
String toString() {
  final _this = this as SavedCase;
  return 'SavedCase(id: ${_this.id}, topic: ${_this.topic}, excerpt: ${_this.excerpt}, savedAt: ${_this.savedAt}, newsId: ${_this.newsId})';
}


}

/// @nodoc
abstract mixin class $SavedCaseCopyWith<$Res>  {
  factory $SavedCaseCopyWith(SavedCase value, $Res Function(SavedCase) _then) = _$SavedCaseCopyWithImpl;
@useResult
$Res call({
 String id, String topic, String excerpt, DateTime savedAt, String? newsId
});




}
/// @nodoc
class _$SavedCaseCopyWithImpl<$Res>
    implements $SavedCaseCopyWith<$Res> {
  _$SavedCaseCopyWithImpl(this._self, this._then);

  final SavedCase _self;
  final $Res Function(SavedCase) _then;

/// Create a copy of SavedCase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? topic = null,Object? excerpt = null,Object? savedAt = null,Object? newsId = freezed,}) {
  return _then(SavedCase(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,excerpt: null == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,newsId: freezed == newsId ? _self.newsId : newsId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedCase].
extension SavedCasePatterns on SavedCase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedCase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedCase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedCase value)  $default,){
final _that = this;
switch (_that) {
case _SavedCase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedCase value)?  $default,){
final _that = this;
switch (_that) {
case _SavedCase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String topic,  String excerpt,  DateTime savedAt,  String? newsId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedCase() when $default != null:
return $default(_that.id,_that.topic,_that.excerpt,_that.savedAt,_that.newsId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String topic,  String excerpt,  DateTime savedAt,  String? newsId)  $default,) {final _that = this;
switch (_that) {
case _SavedCase():
return $default(_that.id,_that.topic,_that.excerpt,_that.savedAt,_that.newsId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String topic,  String excerpt,  DateTime savedAt,  String? newsId)?  $default,) {final _that = this;
switch (_that) {
case _SavedCase() when $default != null:
return $default(_that.id,_that.topic,_that.excerpt,_that.savedAt,_that.newsId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedCase implements SavedCase {
  const _SavedCase({required this.id, required this.topic, required this.excerpt, required this.savedAt, this.newsId});
  factory _SavedCase.fromJson(Map<String, dynamic> json) => _$SavedCaseFromJson(json);

@override final  String id;
@override final  String topic;
/// Короткая выдержка из разговора.
@override final  String excerpt;
/// Дата сохранения.
@override final  DateTime savedAt;
/// Связанный news_id (для перехода в чат с контекстом).
@override final  String? newsId;

/// Create a copy of SavedCase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedCaseCopyWith<_SavedCase> get copyWith => __$SavedCaseCopyWithImpl<_SavedCase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedCaseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedCase&&(identical(other.id, id) || other.id == id)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt)&&(identical(other.newsId, newsId) || other.newsId == newsId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,topic,excerpt,savedAt,newsId);
}

@override
String toString() {
    return 'SavedCase(id: $id, topic: $topic, excerpt: $excerpt, savedAt: $savedAt, newsId: $newsId)';
}


}

/// @nodoc
abstract mixin class _$SavedCaseCopyWith<$Res> implements $SavedCaseCopyWith<$Res> {
  factory _$SavedCaseCopyWith(_SavedCase value, $Res Function(_SavedCase) _then) = __$SavedCaseCopyWithImpl;
@override @useResult
$Res call({
 String id, String topic, String excerpt, DateTime savedAt, String? newsId
});




}
/// @nodoc
class __$SavedCaseCopyWithImpl<$Res>
    implements _$SavedCaseCopyWith<$Res> {
  __$SavedCaseCopyWithImpl(this._self, this._then);

  final _SavedCase _self;
  final $Res Function(_SavedCase) _then;

/// Create a copy of SavedCase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? topic = null,Object? excerpt = null,Object? savedAt = null,Object? newsId = freezed,}) {
  return _then(_SavedCase(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,excerpt: null == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,newsId: freezed == newsId ? _self.newsId : newsId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
