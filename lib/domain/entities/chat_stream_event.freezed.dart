// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_stream_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuggestedAction {

 String get text; String get action;
/// Create a copy of SuggestedAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestedActionCopyWith<SuggestedAction> get copyWith => _$SuggestedActionCopyWithImpl<SuggestedAction>(this as SuggestedAction, _$identity);

  /// Serializes this SuggestedAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SuggestedAction;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuggestedAction&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.action, _this.action) || other.action == _this.action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SuggestedAction;
  return Object.hash(runtimeType,_this.text,_this.action);
}

@override
String toString() {
  final _this = this as SuggestedAction;
  return 'SuggestedAction(text: ${_this.text}, action: ${_this.action})';
}


}

/// @nodoc
abstract mixin class $SuggestedActionCopyWith<$Res>  {
  factory $SuggestedActionCopyWith(SuggestedAction value, $Res Function(SuggestedAction) _then) = _$SuggestedActionCopyWithImpl;
@useResult
$Res call({
 String text, String action
});




}
/// @nodoc
class _$SuggestedActionCopyWithImpl<$Res>
    implements $SuggestedActionCopyWith<$Res> {
  _$SuggestedActionCopyWithImpl(this._self, this._then);

  final SuggestedAction _self;
  final $Res Function(SuggestedAction) _then;

/// Create a copy of SuggestedAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? action = null,}) {
  return _then(SuggestedAction(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SuggestedAction].
extension SuggestedActionPatterns on SuggestedAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuggestedAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuggestedAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuggestedAction value)  $default,){
final _that = this;
switch (_that) {
case _SuggestedAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuggestedAction value)?  $default,){
final _that = this;
switch (_that) {
case _SuggestedAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  String action)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuggestedAction() when $default != null:
return $default(_that.text,_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  String action)  $default,) {final _that = this;
switch (_that) {
case _SuggestedAction():
return $default(_that.text,_that.action);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  String action)?  $default,) {final _that = this;
switch (_that) {
case _SuggestedAction() when $default != null:
return $default(_that.text,_that.action);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SuggestedAction implements SuggestedAction {
  const _SuggestedAction({required this.text, required this.action});
  factory _SuggestedAction.fromJson(Map<String, dynamic> json) => _$SuggestedActionFromJson(json);

@override final  String text;
@override final  String action;

/// Create a copy of SuggestedAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestedActionCopyWith<_SuggestedAction> get copyWith => __$SuggestedActionCopyWithImpl<_SuggestedAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuggestedActionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuggestedAction&&(identical(other.text, text) || other.text == text)&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,text,action);
}

@override
String toString() {
    return 'SuggestedAction(text: $text, action: $action)';
}


}

/// @nodoc
abstract mixin class _$SuggestedActionCopyWith<$Res> implements $SuggestedActionCopyWith<$Res> {
  factory _$SuggestedActionCopyWith(_SuggestedAction value, $Res Function(_SuggestedAction) _then) = __$SuggestedActionCopyWithImpl;
@override @useResult
$Res call({
 String text, String action
});




}
/// @nodoc
class __$SuggestedActionCopyWithImpl<$Res>
    implements _$SuggestedActionCopyWith<$Res> {
  __$SuggestedActionCopyWithImpl(this._self, this._then);

  final _SuggestedAction _self;
  final $Res Function(_SuggestedAction) _then;

/// Create a copy of SuggestedAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? action = null,}) {
  return _then(_SuggestedAction(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ChatStreamEvent {

 String get content;
/// Create a copy of ChatStreamEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStreamEventCopyWith<ChatStreamEvent> get copyWith => _$ChatStreamEventCopyWithImpl<ChatStreamEvent>(this as ChatStreamEvent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChatStreamEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatStreamEvent&&(identical(other.content, _this.content) || other.content == _this.content));
}


@override
int get hashCode {
  final _this = this as ChatStreamEvent;
  return Object.hash(runtimeType,_this.content);
}

@override
String toString() {
  final _this = this as ChatStreamEvent;
  return 'ChatStreamEvent(content: ${_this.content})';
}


}

/// @nodoc
abstract mixin class $ChatStreamEventCopyWith<$Res>  {
  factory $ChatStreamEventCopyWith(ChatStreamEvent value, $Res Function(ChatStreamEvent) _then) = _$ChatStreamEventCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$ChatStreamEventCopyWithImpl<$Res>
    implements $ChatStreamEventCopyWith<$Res> {
  _$ChatStreamEventCopyWithImpl(this._self, this._then);

  final ChatStreamEvent _self;
  final $Res Function(ChatStreamEvent) _then;

/// Create a copy of ChatStreamEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatStreamEvent].
extension ChatStreamEventPatterns on ChatStreamEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatChunkEvent value)?  chunk,TResult Function( ChatCompletedEvent value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatChunkEvent() when chunk != null:
return chunk(_that);case ChatCompletedEvent() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatChunkEvent value)  chunk,required TResult Function( ChatCompletedEvent value)  completed,}){
final _that = this;
switch (_that) {
case ChatChunkEvent():
return chunk(_that);case ChatCompletedEvent():
return completed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatChunkEvent value)?  chunk,TResult? Function( ChatCompletedEvent value)?  completed,}){
final _that = this;
switch (_that) {
case ChatChunkEvent() when chunk != null:
return chunk(_that);case ChatCompletedEvent() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String content,  bool isFinal)?  chunk,TResult Function( String messageId,  String content,  List<SuggestedAction> suggestedActions,  List<String> biasDetected,  bool? relatedToPortfolio)?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatChunkEvent() when chunk != null:
return chunk(_that.content,_that.isFinal);case ChatCompletedEvent() when completed != null:
return completed(_that.messageId,_that.content,_that.suggestedActions,_that.biasDetected,_that.relatedToPortfolio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String content,  bool isFinal)  chunk,required TResult Function( String messageId,  String content,  List<SuggestedAction> suggestedActions,  List<String> biasDetected,  bool? relatedToPortfolio)  completed,}) {final _that = this;
switch (_that) {
case ChatChunkEvent():
return chunk(_that.content,_that.isFinal);case ChatCompletedEvent():
return completed(_that.messageId,_that.content,_that.suggestedActions,_that.biasDetected,_that.relatedToPortfolio);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String content,  bool isFinal)?  chunk,TResult? Function( String messageId,  String content,  List<SuggestedAction> suggestedActions,  List<String> biasDetected,  bool? relatedToPortfolio)?  completed,}) {final _that = this;
switch (_that) {
case ChatChunkEvent() when chunk != null:
return chunk(_that.content,_that.isFinal);case ChatCompletedEvent() when completed != null:
return completed(_that.messageId,_that.content,_that.suggestedActions,_that.biasDetected,_that.relatedToPortfolio);case _:
  return null;

}
}

}

/// @nodoc


class ChatChunkEvent implements ChatStreamEvent {
  const ChatChunkEvent({required this.content, required this.isFinal});
  

@override final  String content;
 final  bool isFinal;

/// Create a copy of ChatStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatChunkEventCopyWith<ChatChunkEvent> get copyWith => _$ChatChunkEventCopyWithImpl<ChatChunkEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatChunkEvent&&(identical(other.content, content) || other.content == content)&&(identical(other.isFinal, isFinal) || other.isFinal == isFinal));
}


@override
int get hashCode {
    return Object.hash(runtimeType,content,isFinal);
}

@override
String toString() {
    return 'ChatStreamEvent.chunk(content: $content, isFinal: $isFinal)';
}


}

/// @nodoc
abstract mixin class $ChatChunkEventCopyWith<$Res> implements $ChatStreamEventCopyWith<$Res> {
  factory $ChatChunkEventCopyWith(ChatChunkEvent value, $Res Function(ChatChunkEvent) _then) = _$ChatChunkEventCopyWithImpl;
@override @useResult
$Res call({
 String content, bool isFinal
});




}
/// @nodoc
class _$ChatChunkEventCopyWithImpl<$Res>
    implements $ChatChunkEventCopyWith<$Res> {
  _$ChatChunkEventCopyWithImpl(this._self, this._then);

  final ChatChunkEvent _self;
  final $Res Function(ChatChunkEvent) _then;

/// Create a copy of ChatStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? isFinal = null,}) {
  return _then(ChatChunkEvent(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isFinal: null == isFinal ? _self.isFinal : isFinal // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ChatCompletedEvent implements ChatStreamEvent {
  const ChatCompletedEvent({required this.messageId, required this.content,  List<SuggestedAction> suggestedActions = const <SuggestedAction>[],  List<String> biasDetected = const <String>[], this.relatedToPortfolio}): _suggestedActions = suggestedActions,_biasDetected = biasDetected;
  

 final  String messageId;
@override final  String content;
 final  List<SuggestedAction> _suggestedActions;
@JsonKey() List<SuggestedAction> get suggestedActions {
  if (_suggestedActions is EqualUnmodifiableListView) return _suggestedActions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestedActions);
}

 final  List<String> _biasDetected;
@JsonKey() List<String> get biasDetected {
  if (_biasDetected is EqualUnmodifiableListView) return _biasDetected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_biasDetected);
}

 final  bool? relatedToPortfolio;

/// Create a copy of ChatStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletedEventCopyWith<ChatCompletedEvent> get copyWith => _$ChatCompletedEventCopyWithImpl<ChatCompletedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletedEvent&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.suggestedActions, _suggestedActions)&&const DeepCollectionEquality().equals(other.biasDetected, _biasDetected)&&(identical(other.relatedToPortfolio, relatedToPortfolio) || other.relatedToPortfolio == relatedToPortfolio));
}


@override
int get hashCode {
    return Object.hash(runtimeType,messageId,content,const DeepCollectionEquality().hash(_suggestedActions),const DeepCollectionEquality().hash(_biasDetected),relatedToPortfolio);
}

@override
String toString() {
    return 'ChatStreamEvent.completed(messageId: $messageId, content: $content, suggestedActions: $suggestedActions, biasDetected: $biasDetected, relatedToPortfolio: $relatedToPortfolio)';
}


}

/// @nodoc
abstract mixin class $ChatCompletedEventCopyWith<$Res> implements $ChatStreamEventCopyWith<$Res> {
  factory $ChatCompletedEventCopyWith(ChatCompletedEvent value, $Res Function(ChatCompletedEvent) _then) = _$ChatCompletedEventCopyWithImpl;
@override @useResult
$Res call({
 String messageId, String content, List<SuggestedAction> suggestedActions, List<String> biasDetected, bool? relatedToPortfolio
});




}
/// @nodoc
class _$ChatCompletedEventCopyWithImpl<$Res>
    implements $ChatCompletedEventCopyWith<$Res> {
  _$ChatCompletedEventCopyWithImpl(this._self, this._then);

  final ChatCompletedEvent _self;
  final $Res Function(ChatCompletedEvent) _then;

/// Create a copy of ChatStreamEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messageId = null,Object? content = null,Object? suggestedActions = null,Object? biasDetected = null,Object? relatedToPortfolio = freezed,}) {
  return _then(ChatCompletedEvent(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,suggestedActions: null == suggestedActions ? _self._suggestedActions : suggestedActions // ignore: cast_nullable_to_non_nullable
as List<SuggestedAction>,biasDetected: null == biasDetected ? _self._biasDetected : biasDetected // ignore: cast_nullable_to_non_nullable
as List<String>,relatedToPortfolio: freezed == relatedToPortfolio ? _self.relatedToPortfolio : relatedToPortfolio // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
