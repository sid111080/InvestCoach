// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'micro_lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MicroLesson {

 String get id; String get title; int get durationSeconds; LessonDifficulty get difficulty;/// Связанный bias (нейтрально, без негатива).
 String? get biasTag;/// Короткое описание (1–2 предложения).
 String? get description;/// Завершён ли урок.
 bool get completed;
/// Create a copy of MicroLesson
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MicroLessonCopyWith<MicroLesson> get copyWith => _$MicroLessonCopyWithImpl<MicroLesson>(this as MicroLesson, _$identity);

  /// Serializes this MicroLesson to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MicroLesson;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MicroLesson&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.durationSeconds, _this.durationSeconds) || other.durationSeconds == _this.durationSeconds)&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty)&&(identical(other.biasTag, _this.biasTag) || other.biasTag == _this.biasTag)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.completed, _this.completed) || other.completed == _this.completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MicroLesson;
  return Object.hash(runtimeType,_this.id,_this.title,_this.durationSeconds,_this.difficulty,_this.biasTag,_this.description,_this.completed);
}

@override
String toString() {
  final _this = this as MicroLesson;
  return 'MicroLesson(id: ${_this.id}, title: ${_this.title}, durationSeconds: ${_this.durationSeconds}, difficulty: ${_this.difficulty}, biasTag: ${_this.biasTag}, description: ${_this.description}, completed: ${_this.completed})';
}


}

/// @nodoc
abstract mixin class $MicroLessonCopyWith<$Res>  {
  factory $MicroLessonCopyWith(MicroLesson value, $Res Function(MicroLesson) _then) = _$MicroLessonCopyWithImpl;
@useResult
$Res call({
 String id, String title, int durationSeconds, LessonDifficulty difficulty, String? biasTag, String? description, bool completed
});




}
/// @nodoc
class _$MicroLessonCopyWithImpl<$Res>
    implements $MicroLessonCopyWith<$Res> {
  _$MicroLessonCopyWithImpl(this._self, this._then);

  final MicroLesson _self;
  final $Res Function(MicroLesson) _then;

/// Create a copy of MicroLesson
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? durationSeconds = null,Object? difficulty = null,Object? biasTag = freezed,Object? description = freezed,Object? completed = null,}) {
  return _then(MicroLesson(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as LessonDifficulty,biasTag: freezed == biasTag ? _self.biasTag : biasTag // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MicroLesson].
extension MicroLessonPatterns on MicroLesson {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MicroLesson value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MicroLesson() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MicroLesson value)  $default,){
final _that = this;
switch (_that) {
case _MicroLesson():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MicroLesson value)?  $default,){
final _that = this;
switch (_that) {
case _MicroLesson() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  int durationSeconds,  LessonDifficulty difficulty,  String? biasTag,  String? description,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MicroLesson() when $default != null:
return $default(_that.id,_that.title,_that.durationSeconds,_that.difficulty,_that.biasTag,_that.description,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  int durationSeconds,  LessonDifficulty difficulty,  String? biasTag,  String? description,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _MicroLesson():
return $default(_that.id,_that.title,_that.durationSeconds,_that.difficulty,_that.biasTag,_that.description,_that.completed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  int durationSeconds,  LessonDifficulty difficulty,  String? biasTag,  String? description,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _MicroLesson() when $default != null:
return $default(_that.id,_that.title,_that.durationSeconds,_that.difficulty,_that.biasTag,_that.description,_that.completed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MicroLesson implements MicroLesson {
  const _MicroLesson({required this.id, required this.title, required this.durationSeconds, this.difficulty = LessonDifficulty.easy, this.biasTag, this.description, this.completed = false});
  factory _MicroLesson.fromJson(Map<String, dynamic> json) => _$MicroLessonFromJson(json);

@override final  String id;
@override final  String title;
@override final  int durationSeconds;
@override@JsonKey() final  LessonDifficulty difficulty;
/// Связанный bias (нейтрально, без негатива).
@override final  String? biasTag;
/// Короткое описание (1–2 предложения).
@override final  String? description;
/// Завершён ли урок.
@override@JsonKey() final  bool completed;

/// Create a copy of MicroLesson
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MicroLessonCopyWith<_MicroLesson> get copyWith => __$MicroLessonCopyWithImpl<_MicroLesson>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MicroLessonToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MicroLesson&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.biasTag, biasTag) || other.biasTag == biasTag)&&(identical(other.description, description) || other.description == description)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,durationSeconds,difficulty,biasTag,description,completed);
}

@override
String toString() {
    return 'MicroLesson(id: $id, title: $title, durationSeconds: $durationSeconds, difficulty: $difficulty, biasTag: $biasTag, description: $description, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$MicroLessonCopyWith<$Res> implements $MicroLessonCopyWith<$Res> {
  factory _$MicroLessonCopyWith(_MicroLesson value, $Res Function(_MicroLesson) _then) = __$MicroLessonCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int durationSeconds, LessonDifficulty difficulty, String? biasTag, String? description, bool completed
});




}
/// @nodoc
class __$MicroLessonCopyWithImpl<$Res>
    implements _$MicroLessonCopyWith<$Res> {
  __$MicroLessonCopyWithImpl(this._self, this._then);

  final _MicroLesson _self;
  final $Res Function(_MicroLesson) _then;

/// Create a copy of MicroLesson
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? durationSeconds = null,Object? difficulty = null,Object? biasTag = freezed,Object? description = freezed,Object? completed = null,}) {
  return _then(_MicroLesson(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as LessonDifficulty,biasTag: freezed == biasTag ? _self.biasTag : biasTag // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
