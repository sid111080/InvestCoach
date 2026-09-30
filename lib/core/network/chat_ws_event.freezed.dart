// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_ws_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatWsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatWsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ChatWsEvent()';
}


}

/// @nodoc
class $ChatWsEventCopyWith<$Res>  {
$ChatWsEventCopyWith(ChatWsEvent _, $Res Function(ChatWsEvent) __);
}


/// Adds pattern-matching-related methods to [ChatWsEvent].
extension ChatWsEventPatterns on ChatWsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WsStateEvent value)?  state,TResult Function( WsAuthSuccessEvent value)?  authSuccess,TResult Function( WsMessageReceivedEvent value)?  messageReceived,TResult Function( WsCoachThinkingEvent value)?  coachThinking,TResult Function( WsStreamChunkEvent value)?  streamChunk,TResult Function( WsVoiceResponseEvent value)?  voiceResponse,TResult Function( WsPushNotificationEvent value)?  pushNotification,TResult Function( WsErrorEvent value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WsStateEvent() when state != null:
return state(_that);case WsAuthSuccessEvent() when authSuccess != null:
return authSuccess(_that);case WsMessageReceivedEvent() when messageReceived != null:
return messageReceived(_that);case WsCoachThinkingEvent() when coachThinking != null:
return coachThinking(_that);case WsStreamChunkEvent() when streamChunk != null:
return streamChunk(_that);case WsVoiceResponseEvent() when voiceResponse != null:
return voiceResponse(_that);case WsPushNotificationEvent() when pushNotification != null:
return pushNotification(_that);case WsErrorEvent() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WsStateEvent value)  state,required TResult Function( WsAuthSuccessEvent value)  authSuccess,required TResult Function( WsMessageReceivedEvent value)  messageReceived,required TResult Function( WsCoachThinkingEvent value)  coachThinking,required TResult Function( WsStreamChunkEvent value)  streamChunk,required TResult Function( WsVoiceResponseEvent value)  voiceResponse,required TResult Function( WsPushNotificationEvent value)  pushNotification,required TResult Function( WsErrorEvent value)  error,}){
final _that = this;
switch (_that) {
case WsStateEvent():
return state(_that);case WsAuthSuccessEvent():
return authSuccess(_that);case WsMessageReceivedEvent():
return messageReceived(_that);case WsCoachThinkingEvent():
return coachThinking(_that);case WsStreamChunkEvent():
return streamChunk(_that);case WsVoiceResponseEvent():
return voiceResponse(_that);case WsPushNotificationEvent():
return pushNotification(_that);case WsErrorEvent():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WsStateEvent value)?  state,TResult? Function( WsAuthSuccessEvent value)?  authSuccess,TResult? Function( WsMessageReceivedEvent value)?  messageReceived,TResult? Function( WsCoachThinkingEvent value)?  coachThinking,TResult? Function( WsStreamChunkEvent value)?  streamChunk,TResult? Function( WsVoiceResponseEvent value)?  voiceResponse,TResult? Function( WsPushNotificationEvent value)?  pushNotification,TResult? Function( WsErrorEvent value)?  error,}){
final _that = this;
switch (_that) {
case WsStateEvent() when state != null:
return state(_that);case WsAuthSuccessEvent() when authSuccess != null:
return authSuccess(_that);case WsMessageReceivedEvent() when messageReceived != null:
return messageReceived(_that);case WsCoachThinkingEvent() when coachThinking != null:
return coachThinking(_that);case WsStreamChunkEvent() when streamChunk != null:
return streamChunk(_that);case WsVoiceResponseEvent() when voiceResponse != null:
return voiceResponse(_that);case WsPushNotificationEvent() when pushNotification != null:
return pushNotification(_that);case WsErrorEvent() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ChatWsConnectionState state)?  state,TResult Function( String userId,  String sessionId)?  authSuccess,TResult Function( String messageId,  String status)?  messageReceived,TResult Function( String messageId)?  coachThinking,TResult Function( String messageId,  String content,  bool isFinal,  List<String> suggestedReplies,  List<String> biasDetected,  bool? relatedToPortfolio)?  streamChunk,TResult Function( String voiceSessionId,  String? transcript,  String? responseText,  String? audioUrl,  int? durationMs)?  voiceResponse,TResult Function( String notificationId,  String? title,  String? body,  Map<String, String> data)?  pushNotification,TResult Function( String code,  String? message,  bool? suggestUpgrade)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WsStateEvent() when state != null:
return state(_that.state);case WsAuthSuccessEvent() when authSuccess != null:
return authSuccess(_that.userId,_that.sessionId);case WsMessageReceivedEvent() when messageReceived != null:
return messageReceived(_that.messageId,_that.status);case WsCoachThinkingEvent() when coachThinking != null:
return coachThinking(_that.messageId);case WsStreamChunkEvent() when streamChunk != null:
return streamChunk(_that.messageId,_that.content,_that.isFinal,_that.suggestedReplies,_that.biasDetected,_that.relatedToPortfolio);case WsVoiceResponseEvent() when voiceResponse != null:
return voiceResponse(_that.voiceSessionId,_that.transcript,_that.responseText,_that.audioUrl,_that.durationMs);case WsPushNotificationEvent() when pushNotification != null:
return pushNotification(_that.notificationId,_that.title,_that.body,_that.data);case WsErrorEvent() when error != null:
return error(_that.code,_that.message,_that.suggestUpgrade);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ChatWsConnectionState state)  state,required TResult Function( String userId,  String sessionId)  authSuccess,required TResult Function( String messageId,  String status)  messageReceived,required TResult Function( String messageId)  coachThinking,required TResult Function( String messageId,  String content,  bool isFinal,  List<String> suggestedReplies,  List<String> biasDetected,  bool? relatedToPortfolio)  streamChunk,required TResult Function( String voiceSessionId,  String? transcript,  String? responseText,  String? audioUrl,  int? durationMs)  voiceResponse,required TResult Function( String notificationId,  String? title,  String? body,  Map<String, String> data)  pushNotification,required TResult Function( String code,  String? message,  bool? suggestUpgrade)  error,}) {final _that = this;
switch (_that) {
case WsStateEvent():
return state(_that.state);case WsAuthSuccessEvent():
return authSuccess(_that.userId,_that.sessionId);case WsMessageReceivedEvent():
return messageReceived(_that.messageId,_that.status);case WsCoachThinkingEvent():
return coachThinking(_that.messageId);case WsStreamChunkEvent():
return streamChunk(_that.messageId,_that.content,_that.isFinal,_that.suggestedReplies,_that.biasDetected,_that.relatedToPortfolio);case WsVoiceResponseEvent():
return voiceResponse(_that.voiceSessionId,_that.transcript,_that.responseText,_that.audioUrl,_that.durationMs);case WsPushNotificationEvent():
return pushNotification(_that.notificationId,_that.title,_that.body,_that.data);case WsErrorEvent():
return error(_that.code,_that.message,_that.suggestUpgrade);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ChatWsConnectionState state)?  state,TResult? Function( String userId,  String sessionId)?  authSuccess,TResult? Function( String messageId,  String status)?  messageReceived,TResult? Function( String messageId)?  coachThinking,TResult? Function( String messageId,  String content,  bool isFinal,  List<String> suggestedReplies,  List<String> biasDetected,  bool? relatedToPortfolio)?  streamChunk,TResult? Function( String voiceSessionId,  String? transcript,  String? responseText,  String? audioUrl,  int? durationMs)?  voiceResponse,TResult? Function( String notificationId,  String? title,  String? body,  Map<String, String> data)?  pushNotification,TResult? Function( String code,  String? message,  bool? suggestUpgrade)?  error,}) {final _that = this;
switch (_that) {
case WsStateEvent() when state != null:
return state(_that.state);case WsAuthSuccessEvent() when authSuccess != null:
return authSuccess(_that.userId,_that.sessionId);case WsMessageReceivedEvent() when messageReceived != null:
return messageReceived(_that.messageId,_that.status);case WsCoachThinkingEvent() when coachThinking != null:
return coachThinking(_that.messageId);case WsStreamChunkEvent() when streamChunk != null:
return streamChunk(_that.messageId,_that.content,_that.isFinal,_that.suggestedReplies,_that.biasDetected,_that.relatedToPortfolio);case WsVoiceResponseEvent() when voiceResponse != null:
return voiceResponse(_that.voiceSessionId,_that.transcript,_that.responseText,_that.audioUrl,_that.durationMs);case WsPushNotificationEvent() when pushNotification != null:
return pushNotification(_that.notificationId,_that.title,_that.body,_that.data);case WsErrorEvent() when error != null:
return error(_that.code,_that.message,_that.suggestUpgrade);case _:
  return null;

}
}

}

/// @nodoc


class WsStateEvent implements ChatWsEvent {
  const WsStateEvent(this.state);
  

 final  ChatWsConnectionState state;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsStateEventCopyWith<WsStateEvent> get copyWith => _$WsStateEventCopyWithImpl<WsStateEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WsStateEvent&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode {
    return Object.hash(runtimeType,state);
}

@override
String toString() {
    return 'ChatWsEvent.state(state: $state)';
}


}

/// @nodoc
abstract mixin class $WsStateEventCopyWith<$Res> implements $ChatWsEventCopyWith<$Res> {
  factory $WsStateEventCopyWith(WsStateEvent value, $Res Function(WsStateEvent) _then) = _$WsStateEventCopyWithImpl;
@useResult
$Res call({
 ChatWsConnectionState state
});




}
/// @nodoc
class _$WsStateEventCopyWithImpl<$Res>
    implements $WsStateEventCopyWith<$Res> {
  _$WsStateEventCopyWithImpl(this._self, this._then);

  final WsStateEvent _self;
  final $Res Function(WsStateEvent) _then;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(WsStateEvent(
null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ChatWsConnectionState,
  ));
}


}

/// @nodoc


class WsAuthSuccessEvent implements ChatWsEvent {
  const WsAuthSuccessEvent({required this.userId, required this.sessionId});
  

 final  String userId;
 final  String sessionId;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsAuthSuccessEventCopyWith<WsAuthSuccessEvent> get copyWith => _$WsAuthSuccessEventCopyWithImpl<WsAuthSuccessEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WsAuthSuccessEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,userId,sessionId);
}

@override
String toString() {
    return 'ChatWsEvent.authSuccess(userId: $userId, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $WsAuthSuccessEventCopyWith<$Res> implements $ChatWsEventCopyWith<$Res> {
  factory $WsAuthSuccessEventCopyWith(WsAuthSuccessEvent value, $Res Function(WsAuthSuccessEvent) _then) = _$WsAuthSuccessEventCopyWithImpl;
@useResult
$Res call({
 String userId, String sessionId
});




}
/// @nodoc
class _$WsAuthSuccessEventCopyWithImpl<$Res>
    implements $WsAuthSuccessEventCopyWith<$Res> {
  _$WsAuthSuccessEventCopyWithImpl(this._self, this._then);

  final WsAuthSuccessEvent _self;
  final $Res Function(WsAuthSuccessEvent) _then;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? sessionId = null,}) {
  return _then(WsAuthSuccessEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WsMessageReceivedEvent implements ChatWsEvent {
  const WsMessageReceivedEvent({required this.messageId, this.status = 'received'});
  

 final  String messageId;
@JsonKey() final  String status;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsMessageReceivedEventCopyWith<WsMessageReceivedEvent> get copyWith => _$WsMessageReceivedEventCopyWithImpl<WsMessageReceivedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WsMessageReceivedEvent&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode {
    return Object.hash(runtimeType,messageId,status);
}

@override
String toString() {
    return 'ChatWsEvent.messageReceived(messageId: $messageId, status: $status)';
}


}

/// @nodoc
abstract mixin class $WsMessageReceivedEventCopyWith<$Res> implements $ChatWsEventCopyWith<$Res> {
  factory $WsMessageReceivedEventCopyWith(WsMessageReceivedEvent value, $Res Function(WsMessageReceivedEvent) _then) = _$WsMessageReceivedEventCopyWithImpl;
@useResult
$Res call({
 String messageId, String status
});




}
/// @nodoc
class _$WsMessageReceivedEventCopyWithImpl<$Res>
    implements $WsMessageReceivedEventCopyWith<$Res> {
  _$WsMessageReceivedEventCopyWithImpl(this._self, this._then);

  final WsMessageReceivedEvent _self;
  final $Res Function(WsMessageReceivedEvent) _then;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,Object? status = null,}) {
  return _then(WsMessageReceivedEvent(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WsCoachThinkingEvent implements ChatWsEvent {
  const WsCoachThinkingEvent({required this.messageId});
  

 final  String messageId;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsCoachThinkingEventCopyWith<WsCoachThinkingEvent> get copyWith => _$WsCoachThinkingEventCopyWithImpl<WsCoachThinkingEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WsCoachThinkingEvent&&(identical(other.messageId, messageId) || other.messageId == messageId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,messageId);
}

@override
String toString() {
    return 'ChatWsEvent.coachThinking(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class $WsCoachThinkingEventCopyWith<$Res> implements $ChatWsEventCopyWith<$Res> {
  factory $WsCoachThinkingEventCopyWith(WsCoachThinkingEvent value, $Res Function(WsCoachThinkingEvent) _then) = _$WsCoachThinkingEventCopyWithImpl;
@useResult
$Res call({
 String messageId
});




}
/// @nodoc
class _$WsCoachThinkingEventCopyWithImpl<$Res>
    implements $WsCoachThinkingEventCopyWith<$Res> {
  _$WsCoachThinkingEventCopyWithImpl(this._self, this._then);

  final WsCoachThinkingEvent _self;
  final $Res Function(WsCoachThinkingEvent) _then;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,}) {
  return _then(WsCoachThinkingEvent(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WsStreamChunkEvent implements ChatWsEvent {
  const WsStreamChunkEvent({required this.messageId, required this.content, required this.isFinal,  List<String> suggestedReplies = const <String>[],  List<String> biasDetected = const <String>[], this.relatedToPortfolio}): _suggestedReplies = suggestedReplies,_biasDetected = biasDetected;
  

 final  String messageId;
 final  String content;
 final  bool isFinal;
 final  List<String> _suggestedReplies;
@JsonKey() List<String> get suggestedReplies {
  if (_suggestedReplies is EqualUnmodifiableListView) return _suggestedReplies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestedReplies);
}

 final  List<String> _biasDetected;
@JsonKey() List<String> get biasDetected {
  if (_biasDetected is EqualUnmodifiableListView) return _biasDetected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_biasDetected);
}

 final  bool? relatedToPortfolio;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsStreamChunkEventCopyWith<WsStreamChunkEvent> get copyWith => _$WsStreamChunkEventCopyWithImpl<WsStreamChunkEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WsStreamChunkEvent&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.content, content) || other.content == content)&&(identical(other.isFinal, isFinal) || other.isFinal == isFinal)&&const DeepCollectionEquality().equals(other.suggestedReplies, _suggestedReplies)&&const DeepCollectionEquality().equals(other.biasDetected, _biasDetected)&&(identical(other.relatedToPortfolio, relatedToPortfolio) || other.relatedToPortfolio == relatedToPortfolio));
}


@override
int get hashCode {
    return Object.hash(runtimeType,messageId,content,isFinal,const DeepCollectionEquality().hash(_suggestedReplies),const DeepCollectionEquality().hash(_biasDetected),relatedToPortfolio);
}

@override
String toString() {
    return 'ChatWsEvent.streamChunk(messageId: $messageId, content: $content, isFinal: $isFinal, suggestedReplies: $suggestedReplies, biasDetected: $biasDetected, relatedToPortfolio: $relatedToPortfolio)';
}


}

/// @nodoc
abstract mixin class $WsStreamChunkEventCopyWith<$Res> implements $ChatWsEventCopyWith<$Res> {
  factory $WsStreamChunkEventCopyWith(WsStreamChunkEvent value, $Res Function(WsStreamChunkEvent) _then) = _$WsStreamChunkEventCopyWithImpl;
@useResult
$Res call({
 String messageId, String content, bool isFinal, List<String> suggestedReplies, List<String> biasDetected, bool? relatedToPortfolio
});




}
/// @nodoc
class _$WsStreamChunkEventCopyWithImpl<$Res>
    implements $WsStreamChunkEventCopyWith<$Res> {
  _$WsStreamChunkEventCopyWithImpl(this._self, this._then);

  final WsStreamChunkEvent _self;
  final $Res Function(WsStreamChunkEvent) _then;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,Object? content = null,Object? isFinal = null,Object? suggestedReplies = null,Object? biasDetected = null,Object? relatedToPortfolio = freezed,}) {
  return _then(WsStreamChunkEvent(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isFinal: null == isFinal ? _self.isFinal : isFinal // ignore: cast_nullable_to_non_nullable
as bool,suggestedReplies: null == suggestedReplies ? _self._suggestedReplies : suggestedReplies // ignore: cast_nullable_to_non_nullable
as List<String>,biasDetected: null == biasDetected ? _self._biasDetected : biasDetected // ignore: cast_nullable_to_non_nullable
as List<String>,relatedToPortfolio: freezed == relatedToPortfolio ? _self.relatedToPortfolio : relatedToPortfolio // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class WsVoiceResponseEvent implements ChatWsEvent {
  const WsVoiceResponseEvent({required this.voiceSessionId, this.transcript, this.responseText, this.audioUrl, this.durationMs});
  

 final  String voiceSessionId;
 final  String? transcript;
 final  String? responseText;
 final  String? audioUrl;
 final  int? durationMs;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsVoiceResponseEventCopyWith<WsVoiceResponseEvent> get copyWith => _$WsVoiceResponseEventCopyWithImpl<WsVoiceResponseEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WsVoiceResponseEvent&&(identical(other.voiceSessionId, voiceSessionId) || other.voiceSessionId == voiceSessionId)&&(identical(other.transcript, transcript) || other.transcript == transcript)&&(identical(other.responseText, responseText) || other.responseText == responseText)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs));
}


@override
int get hashCode {
    return Object.hash(runtimeType,voiceSessionId,transcript,responseText,audioUrl,durationMs);
}

@override
String toString() {
    return 'ChatWsEvent.voiceResponse(voiceSessionId: $voiceSessionId, transcript: $transcript, responseText: $responseText, audioUrl: $audioUrl, durationMs: $durationMs)';
}


}

/// @nodoc
abstract mixin class $WsVoiceResponseEventCopyWith<$Res> implements $ChatWsEventCopyWith<$Res> {
  factory $WsVoiceResponseEventCopyWith(WsVoiceResponseEvent value, $Res Function(WsVoiceResponseEvent) _then) = _$WsVoiceResponseEventCopyWithImpl;
@useResult
$Res call({
 String voiceSessionId, String? transcript, String? responseText, String? audioUrl, int? durationMs
});




}
/// @nodoc
class _$WsVoiceResponseEventCopyWithImpl<$Res>
    implements $WsVoiceResponseEventCopyWith<$Res> {
  _$WsVoiceResponseEventCopyWithImpl(this._self, this._then);

  final WsVoiceResponseEvent _self;
  final $Res Function(WsVoiceResponseEvent) _then;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? voiceSessionId = null,Object? transcript = freezed,Object? responseText = freezed,Object? audioUrl = freezed,Object? durationMs = freezed,}) {
  return _then(WsVoiceResponseEvent(
voiceSessionId: null == voiceSessionId ? _self.voiceSessionId : voiceSessionId // ignore: cast_nullable_to_non_nullable
as String,transcript: freezed == transcript ? _self.transcript : transcript // ignore: cast_nullable_to_non_nullable
as String?,responseText: freezed == responseText ? _self.responseText : responseText // ignore: cast_nullable_to_non_nullable
as String?,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,durationMs: freezed == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class WsPushNotificationEvent implements ChatWsEvent {
  const WsPushNotificationEvent({required this.notificationId, this.title, this.body,  Map<String, String> data = const <String, String>{}}): _data = data;
  

 final  String notificationId;
 final  String? title;
 final  String? body;
 final  Map<String, String> _data;
@JsonKey() Map<String, String> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsPushNotificationEventCopyWith<WsPushNotificationEvent> get copyWith => _$WsPushNotificationEventCopyWithImpl<WsPushNotificationEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WsPushNotificationEvent&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other.data, _data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,notificationId,title,body,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'ChatWsEvent.pushNotification(notificationId: $notificationId, title: $title, body: $body, data: $data)';
}


}

/// @nodoc
abstract mixin class $WsPushNotificationEventCopyWith<$Res> implements $ChatWsEventCopyWith<$Res> {
  factory $WsPushNotificationEventCopyWith(WsPushNotificationEvent value, $Res Function(WsPushNotificationEvent) _then) = _$WsPushNotificationEventCopyWithImpl;
@useResult
$Res call({
 String notificationId, String? title, String? body, Map<String, String> data
});




}
/// @nodoc
class _$WsPushNotificationEventCopyWithImpl<$Res>
    implements $WsPushNotificationEventCopyWith<$Res> {
  _$WsPushNotificationEventCopyWithImpl(this._self, this._then);

  final WsPushNotificationEvent _self;
  final $Res Function(WsPushNotificationEvent) _then;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notificationId = null,Object? title = freezed,Object? body = freezed,Object? data = null,}) {
  return _then(WsPushNotificationEvent(
notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

/// @nodoc


class WsErrorEvent implements ChatWsEvent {
  const WsErrorEvent({required this.code, this.message, this.suggestUpgrade});
  

 final  String code;
 final  String? message;
 final  bool? suggestUpgrade;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsErrorEventCopyWith<WsErrorEvent> get copyWith => _$WsErrorEventCopyWithImpl<WsErrorEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WsErrorEvent&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.suggestUpgrade, suggestUpgrade) || other.suggestUpgrade == suggestUpgrade));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code,message,suggestUpgrade);
}

@override
String toString() {
    return 'ChatWsEvent.error(code: $code, message: $message, suggestUpgrade: $suggestUpgrade)';
}


}

/// @nodoc
abstract mixin class $WsErrorEventCopyWith<$Res> implements $ChatWsEventCopyWith<$Res> {
  factory $WsErrorEventCopyWith(WsErrorEvent value, $Res Function(WsErrorEvent) _then) = _$WsErrorEventCopyWithImpl;
@useResult
$Res call({
 String code, String? message, bool? suggestUpgrade
});




}
/// @nodoc
class _$WsErrorEventCopyWithImpl<$Res>
    implements $WsErrorEventCopyWith<$Res> {
  _$WsErrorEventCopyWithImpl(this._self, this._then);

  final WsErrorEvent _self;
  final $Res Function(WsErrorEvent) _then;

/// Create a copy of ChatWsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = freezed,Object? suggestUpgrade = freezed,}) {
  return _then(WsErrorEvent(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,suggestUpgrade: freezed == suggestUpgrade ? _self.suggestUpgrade : suggestUpgrade // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
