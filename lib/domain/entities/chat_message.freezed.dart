// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessage {

 String get id; ChatRole get role; String get text; ChatMessageStatus get status; DateTime? get sentAt;/// Контекст сообщения (например, обсуждаемая новость) —
/// для подписи пузыря в UI.
 ChatContext? get context;/// Варианты продолжения разговора
/// (`suggested_actions` финального SSE-чанка / WS `stream_chunk`).
 List<String> get suggestedReplies;/// Обнаруженные bias (metadata финального чанка).
 List<String> get biasDetected;/// Связано ли сообщение с портфелем пользователя.
 bool? get relatedToPortfolio;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChatMessage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.sentAt, _this.sentAt) || other.sentAt == _this.sentAt)&&(identical(other.context, _this.context) || other.context == _this.context)&&const DeepCollectionEquality().equals(other.suggestedReplies, _this.suggestedReplies)&&const DeepCollectionEquality().equals(other.biasDetected, _this.biasDetected)&&(identical(other.relatedToPortfolio, _this.relatedToPortfolio) || other.relatedToPortfolio == _this.relatedToPortfolio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChatMessage;
  return Object.hash(runtimeType,_this.id,_this.role,_this.text,_this.status,_this.sentAt,_this.context,const DeepCollectionEquality().hash(_this.suggestedReplies),const DeepCollectionEquality().hash(_this.biasDetected),_this.relatedToPortfolio);
}

@override
String toString() {
  final _this = this as ChatMessage;
  return 'ChatMessage(id: ${_this.id}, role: ${_this.role}, text: ${_this.text}, status: ${_this.status}, sentAt: ${_this.sentAt}, context: ${_this.context}, suggestedReplies: ${_this.suggestedReplies}, biasDetected: ${_this.biasDetected}, relatedToPortfolio: ${_this.relatedToPortfolio})';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String id, ChatRole role, String text, ChatMessageStatus status, DateTime? sentAt, ChatContext? context, List<String> suggestedReplies, List<String> biasDetected, bool? relatedToPortfolio
});


$ChatContextCopyWith<$Res>? get context;

}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? text = null,Object? status = null,Object? sentAt = freezed,Object? context = freezed,Object? suggestedReplies = null,Object? biasDetected = null,Object? relatedToPortfolio = freezed,}) {
  return _then(ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatRole,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatMessageStatus,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as ChatContext?,suggestedReplies: null == suggestedReplies ? _self.suggestedReplies : suggestedReplies // ignore: cast_nullable_to_non_nullable
as List<String>,biasDetected: null == biasDetected ? _self.biasDetected : biasDetected // ignore: cast_nullable_to_non_nullable
as List<String>,relatedToPortfolio: freezed == relatedToPortfolio ? _self.relatedToPortfolio : relatedToPortfolio // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatContextCopyWith<$Res>? get context {
    if (_self.context == null) {
    return null;
  }

  return $ChatContextCopyWith<$Res>(_self.context!, (value) {
    return _then(_self.copyWith(context: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ChatRole role,  String text,  ChatMessageStatus status,  DateTime? sentAt,  ChatContext? context,  List<String> suggestedReplies,  List<String> biasDetected,  bool? relatedToPortfolio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.role,_that.text,_that.status,_that.sentAt,_that.context,_that.suggestedReplies,_that.biasDetected,_that.relatedToPortfolio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ChatRole role,  String text,  ChatMessageStatus status,  DateTime? sentAt,  ChatContext? context,  List<String> suggestedReplies,  List<String> biasDetected,  bool? relatedToPortfolio)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.id,_that.role,_that.text,_that.status,_that.sentAt,_that.context,_that.suggestedReplies,_that.biasDetected,_that.relatedToPortfolio);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ChatRole role,  String text,  ChatMessageStatus status,  DateTime? sentAt,  ChatContext? context,  List<String> suggestedReplies,  List<String> biasDetected,  bool? relatedToPortfolio)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.role,_that.text,_that.status,_that.sentAt,_that.context,_that.suggestedReplies,_that.biasDetected,_that.relatedToPortfolio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessage extends ChatMessage {
  const _ChatMessage({required this.id, required this.role, this.text = '', this.status = ChatMessageStatus.thinking, this.sentAt, this.context,  List<String> suggestedReplies = const <String>[],  List<String> biasDetected = const <String>[], this.relatedToPortfolio}): _suggestedReplies = suggestedReplies,_biasDetected = biasDetected,super._();
  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

@override final  String id;
@override final  ChatRole role;
@override@JsonKey() final  String text;
@override@JsonKey() final  ChatMessageStatus status;
@override final  DateTime? sentAt;
/// Контекст сообщения (например, обсуждаемая новость) —
/// для подписи пузыря в UI.
@override final  ChatContext? context;
/// Варианты продолжения разговора
/// (`suggested_actions` финального SSE-чанка / WS `stream_chunk`).
 final  List<String> _suggestedReplies;
/// Варианты продолжения разговора
/// (`suggested_actions` финального SSE-чанка / WS `stream_chunk`).
@override@JsonKey() List<String> get suggestedReplies {
  if (_suggestedReplies is EqualUnmodifiableListView) return _suggestedReplies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestedReplies);
}

/// Обнаруженные bias (metadata финального чанка).
 final  List<String> _biasDetected;
/// Обнаруженные bias (metadata финального чанка).
@override@JsonKey() List<String> get biasDetected {
  if (_biasDetected is EqualUnmodifiableListView) return _biasDetected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_biasDetected);
}

/// Связано ли сообщение с портфелем пользователя.
@override final  bool? relatedToPortfolio;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.text, text) || other.text == text)&&(identical(other.status, status) || other.status == status)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.context, context) || other.context == context)&&const DeepCollectionEquality().equals(other.suggestedReplies, _suggestedReplies)&&const DeepCollectionEquality().equals(other.biasDetected, _biasDetected)&&(identical(other.relatedToPortfolio, relatedToPortfolio) || other.relatedToPortfolio == relatedToPortfolio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,role,text,status,sentAt,context,const DeepCollectionEquality().hash(_suggestedReplies),const DeepCollectionEquality().hash(_biasDetected),relatedToPortfolio);
}

@override
String toString() {
    return 'ChatMessage(id: $id, role: $role, text: $text, status: $status, sentAt: $sentAt, context: $context, suggestedReplies: $suggestedReplies, biasDetected: $biasDetected, relatedToPortfolio: $relatedToPortfolio)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, ChatRole role, String text, ChatMessageStatus status, DateTime? sentAt, ChatContext? context, List<String> suggestedReplies, List<String> biasDetected, bool? relatedToPortfolio
});


@override $ChatContextCopyWith<$Res>? get context;

}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? text = null,Object? status = null,Object? sentAt = freezed,Object? context = freezed,Object? suggestedReplies = null,Object? biasDetected = null,Object? relatedToPortfolio = freezed,}) {
  return _then(_ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ChatRole,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChatMessageStatus,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as ChatContext?,suggestedReplies: null == suggestedReplies ? _self._suggestedReplies : suggestedReplies // ignore: cast_nullable_to_non_nullable
as List<String>,biasDetected: null == biasDetected ? _self._biasDetected : biasDetected // ignore: cast_nullable_to_non_nullable
as List<String>,relatedToPortfolio: freezed == relatedToPortfolio ? _self.relatedToPortfolio : relatedToPortfolio // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatContextCopyWith<$Res>? get context {
    if (_self.context == null) {
    return null;
  }

  return $ChatContextCopyWith<$Res>(_self.context!, (value) {
    return _then(_self.copyWith(context: value));
  });
}
}

// dart format on
