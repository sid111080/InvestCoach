// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatSession {

 List<ChatMessage> get messages; ChatSessionPhase get phase; ChatFailure? get failure;/// Использовано Pull-запросов за день (Free-лимит: 8).
 int get pullRequestsUsed;
/// Create a copy of ChatSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatSessionCopyWith<ChatSession> get copyWith => _$ChatSessionCopyWithImpl<ChatSession>(this as ChatSession, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChatSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatSession&&const DeepCollectionEquality().equals(other.messages, _this.messages)&&(identical(other.phase, _this.phase) || other.phase == _this.phase)&&(identical(other.failure, _this.failure) || other.failure == _this.failure)&&(identical(other.pullRequestsUsed, _this.pullRequestsUsed) || other.pullRequestsUsed == _this.pullRequestsUsed));
}


@override
int get hashCode {
  final _this = this as ChatSession;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.messages),_this.phase,_this.failure,_this.pullRequestsUsed);
}

@override
String toString() {
  final _this = this as ChatSession;
  return 'ChatSession(messages: ${_this.messages}, phase: ${_this.phase}, failure: ${_this.failure}, pullRequestsUsed: ${_this.pullRequestsUsed})';
}


}

/// @nodoc
abstract mixin class $ChatSessionCopyWith<$Res>  {
  factory $ChatSessionCopyWith(ChatSession value, $Res Function(ChatSession) _then) = _$ChatSessionCopyWithImpl;
@useResult
$Res call({
 List<ChatMessage> messages, ChatSessionPhase phase, ChatFailure? failure, int pullRequestsUsed
});




}
/// @nodoc
class _$ChatSessionCopyWithImpl<$Res>
    implements $ChatSessionCopyWith<$Res> {
  _$ChatSessionCopyWithImpl(this._self, this._then);

  final ChatSession _self;
  final $Res Function(ChatSession) _then;

/// Create a copy of ChatSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? phase = null,Object? failure = freezed,Object? pullRequestsUsed = null,}) {
  return _then(ChatSession(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ChatSessionPhase,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as ChatFailure?,pullRequestsUsed: null == pullRequestsUsed ? _self.pullRequestsUsed : pullRequestsUsed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatSession].
extension ChatSessionPatterns on ChatSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatSession value)  $default,){
final _that = this;
switch (_that) {
case _ChatSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatSession value)?  $default,){
final _that = this;
switch (_that) {
case _ChatSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatMessage> messages,  ChatSessionPhase phase,  ChatFailure? failure,  int pullRequestsUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatSession() when $default != null:
return $default(_that.messages,_that.phase,_that.failure,_that.pullRequestsUsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatMessage> messages,  ChatSessionPhase phase,  ChatFailure? failure,  int pullRequestsUsed)  $default,) {final _that = this;
switch (_that) {
case _ChatSession():
return $default(_that.messages,_that.phase,_that.failure,_that.pullRequestsUsed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatMessage> messages,  ChatSessionPhase phase,  ChatFailure? failure,  int pullRequestsUsed)?  $default,) {final _that = this;
switch (_that) {
case _ChatSession() when $default != null:
return $default(_that.messages,_that.phase,_that.failure,_that.pullRequestsUsed);case _:
  return null;

}
}

}

/// @nodoc


class _ChatSession extends ChatSession {
  const _ChatSession({ List<ChatMessage> messages = const <ChatMessage>[], this.phase = ChatSessionPhase.firstLaunch, this.failure, this.pullRequestsUsed = 0}): _messages = messages,super._();
  

 final  List<ChatMessage> _messages;
@override@JsonKey() List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  ChatSessionPhase phase;
@override final  ChatFailure? failure;
/// Использовано Pull-запросов за день (Free-лимит: 8).
@override@JsonKey() final  int pullRequestsUsed;

/// Create a copy of ChatSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatSessionCopyWith<_ChatSession> get copyWith => __$ChatSessionCopyWithImpl<_ChatSession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatSession&&const DeepCollectionEquality().equals(other.messages, _messages)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.pullRequestsUsed, pullRequestsUsed) || other.pullRequestsUsed == pullRequestsUsed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),phase,failure,pullRequestsUsed);
}

@override
String toString() {
    return 'ChatSession(messages: $messages, phase: $phase, failure: $failure, pullRequestsUsed: $pullRequestsUsed)';
}


}

/// @nodoc
abstract mixin class _$ChatSessionCopyWith<$Res> implements $ChatSessionCopyWith<$Res> {
  factory _$ChatSessionCopyWith(_ChatSession value, $Res Function(_ChatSession) _then) = __$ChatSessionCopyWithImpl;
@override @useResult
$Res call({
 List<ChatMessage> messages, ChatSessionPhase phase, ChatFailure? failure, int pullRequestsUsed
});




}
/// @nodoc
class __$ChatSessionCopyWithImpl<$Res>
    implements _$ChatSessionCopyWith<$Res> {
  __$ChatSessionCopyWithImpl(this._self, this._then);

  final _ChatSession _self;
  final $Res Function(_ChatSession) _then;

/// Create a copy of ChatSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? phase = null,Object? failure = freezed,Object? pullRequestsUsed = null,}) {
  return _then(_ChatSession(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ChatSessionPhase,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as ChatFailure?,pullRequestsUsed: null == pullRequestsUsed ? _self.pullRequestsUsed : pullRequestsUsed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
