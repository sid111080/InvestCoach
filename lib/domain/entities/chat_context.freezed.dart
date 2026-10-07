// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatContext {

 ChatContextType get type; String? get newsId; String? get newsTitle; String? get lessonId; String? get lessonTitle;
/// Create a copy of ChatContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatContextCopyWith<ChatContext> get copyWith => _$ChatContextCopyWithImpl<ChatContext>(this as ChatContext, _$identity);

  /// Serializes this ChatContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChatContext;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatContext&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.newsId, _this.newsId) || other.newsId == _this.newsId)&&(identical(other.newsTitle, _this.newsTitle) || other.newsTitle == _this.newsTitle)&&(identical(other.lessonId, _this.lessonId) || other.lessonId == _this.lessonId)&&(identical(other.lessonTitle, _this.lessonTitle) || other.lessonTitle == _this.lessonTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChatContext;
  return Object.hash(runtimeType,_this.type,_this.newsId,_this.newsTitle,_this.lessonId,_this.lessonTitle);
}

@override
String toString() {
  final _this = this as ChatContext;
  return 'ChatContext(type: ${_this.type}, newsId: ${_this.newsId}, newsTitle: ${_this.newsTitle}, lessonId: ${_this.lessonId}, lessonTitle: ${_this.lessonTitle})';
}


}

/// @nodoc
abstract mixin class $ChatContextCopyWith<$Res>  {
  factory $ChatContextCopyWith(ChatContext value, $Res Function(ChatContext) _then) = _$ChatContextCopyWithImpl;
@useResult
$Res call({
 ChatContextType type, String? newsId, String? newsTitle, String? lessonId, String? lessonTitle
});




}
/// @nodoc
class _$ChatContextCopyWithImpl<$Res>
    implements $ChatContextCopyWith<$Res> {
  _$ChatContextCopyWithImpl(this._self, this._then);

  final ChatContext _self;
  final $Res Function(ChatContext) _then;

/// Create a copy of ChatContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? newsId = freezed,Object? newsTitle = freezed,Object? lessonId = freezed,Object? lessonTitle = freezed,}) {
  return _then(ChatContext(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChatContextType,newsId: freezed == newsId ? _self.newsId : newsId // ignore: cast_nullable_to_non_nullable
as String?,newsTitle: freezed == newsTitle ? _self.newsTitle : newsTitle // ignore: cast_nullable_to_non_nullable
as String?,lessonId: freezed == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String?,lessonTitle: freezed == lessonTitle ? _self.lessonTitle : lessonTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatContext].
extension ChatContextPatterns on ChatContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatContext value)  $default,){
final _that = this;
switch (_that) {
case _ChatContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatContext value)?  $default,){
final _that = this;
switch (_that) {
case _ChatContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChatContextType type,  String? newsId,  String? newsTitle,  String? lessonId,  String? lessonTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatContext() when $default != null:
return $default(_that.type,_that.newsId,_that.newsTitle,_that.lessonId,_that.lessonTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChatContextType type,  String? newsId,  String? newsTitle,  String? lessonId,  String? lessonTitle)  $default,) {final _that = this;
switch (_that) {
case _ChatContext():
return $default(_that.type,_that.newsId,_that.newsTitle,_that.lessonId,_that.lessonTitle);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChatContextType type,  String? newsId,  String? newsTitle,  String? lessonId,  String? lessonTitle)?  $default,) {final _that = this;
switch (_that) {
case _ChatContext() when $default != null:
return $default(_that.type,_that.newsId,_that.newsTitle,_that.lessonId,_that.lessonTitle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatContext extends ChatContext {
  const _ChatContext({this.type = ChatContextType.general, this.newsId, this.newsTitle, this.lessonId, this.lessonTitle}): super._();
  factory _ChatContext.fromJson(Map<String, dynamic> json) => _$ChatContextFromJson(json);

@override@JsonKey() final  ChatContextType type;
@override final  String? newsId;
@override final  String? newsTitle;
@override final  String? lessonId;
@override final  String? lessonTitle;

/// Create a copy of ChatContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatContextCopyWith<_ChatContext> get copyWith => __$ChatContextCopyWithImpl<_ChatContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatContextToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatContext&&(identical(other.type, type) || other.type == type)&&(identical(other.newsId, newsId) || other.newsId == newsId)&&(identical(other.newsTitle, newsTitle) || other.newsTitle == newsTitle)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.lessonTitle, lessonTitle) || other.lessonTitle == lessonTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,newsId,newsTitle,lessonId,lessonTitle);
}

@override
String toString() {
    return 'ChatContext(type: $type, newsId: $newsId, newsTitle: $newsTitle, lessonId: $lessonId, lessonTitle: $lessonTitle)';
}


}

/// @nodoc
abstract mixin class _$ChatContextCopyWith<$Res> implements $ChatContextCopyWith<$Res> {
  factory _$ChatContextCopyWith(_ChatContext value, $Res Function(_ChatContext) _then) = __$ChatContextCopyWithImpl;
@override @useResult
$Res call({
 ChatContextType type, String? newsId, String? newsTitle, String? lessonId, String? lessonTitle
});




}
/// @nodoc
class __$ChatContextCopyWithImpl<$Res>
    implements _$ChatContextCopyWith<$Res> {
  __$ChatContextCopyWithImpl(this._self, this._then);

  final _ChatContext _self;
  final $Res Function(_ChatContext) _then;

/// Create a copy of ChatContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? newsId = freezed,Object? newsTitle = freezed,Object? lessonId = freezed,Object? lessonTitle = freezed,}) {
  return _then(_ChatContext(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChatContextType,newsId: freezed == newsId ? _self.newsId : newsId // ignore: cast_nullable_to_non_nullable
as String?,newsTitle: freezed == newsTitle ? _self.newsTitle : newsTitle // ignore: cast_nullable_to_non_nullable
as String?,lessonId: freezed == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as String?,lessonTitle: freezed == lessonTitle ? _self.lessonTitle : lessonTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
