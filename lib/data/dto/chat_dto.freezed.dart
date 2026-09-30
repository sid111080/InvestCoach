// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatCompletionEventDto {

 String get type;@JsonKey(name: 'content') String? get content;@JsonKey(name: 'is_final') bool get isFinal;@JsonKey(name: 'message_id') String? get messageId;@JsonKey(name: 'suggested_actions') List<SuggestedActionDto> get suggestedActions;@JsonKey(name: 'bias_detected') List<String> get biasDetected;@JsonKey(name: 'related_to_portfolio') bool? get relatedToPortfolio;
/// Create a copy of ChatCompletionEventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCompletionEventDtoCopyWith<ChatCompletionEventDto> get copyWith => _$ChatCompletionEventDtoCopyWithImpl<ChatCompletionEventDto>(this as ChatCompletionEventDto, _$identity);

  /// Serializes this ChatCompletionEventDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChatCompletionEventDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatCompletionEventDto&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.content, _this.content) || other.content == _this.content)&&(identical(other.isFinal, _this.isFinal) || other.isFinal == _this.isFinal)&&(identical(other.messageId, _this.messageId) || other.messageId == _this.messageId)&&const DeepCollectionEquality().equals(other.suggestedActions, _this.suggestedActions)&&const DeepCollectionEquality().equals(other.biasDetected, _this.biasDetected)&&(identical(other.relatedToPortfolio, _this.relatedToPortfolio) || other.relatedToPortfolio == _this.relatedToPortfolio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChatCompletionEventDto;
  return Object.hash(runtimeType,_this.type,_this.content,_this.isFinal,_this.messageId,const DeepCollectionEquality().hash(_this.suggestedActions),const DeepCollectionEquality().hash(_this.biasDetected),_this.relatedToPortfolio);
}

@override
String toString() {
  final _this = this as ChatCompletionEventDto;
  return 'ChatCompletionEventDto(type: ${_this.type}, content: ${_this.content}, isFinal: ${_this.isFinal}, messageId: ${_this.messageId}, suggestedActions: ${_this.suggestedActions}, biasDetected: ${_this.biasDetected}, relatedToPortfolio: ${_this.relatedToPortfolio})';
}


}

/// @nodoc
abstract mixin class $ChatCompletionEventDtoCopyWith<$Res>  {
  factory $ChatCompletionEventDtoCopyWith(ChatCompletionEventDto value, $Res Function(ChatCompletionEventDto) _then) = _$ChatCompletionEventDtoCopyWithImpl;
@useResult
$Res call({
 String type,@JsonKey(name: 'content') String? content,@JsonKey(name: 'is_final') bool isFinal,@JsonKey(name: 'message_id') String? messageId,@JsonKey(name: 'suggested_actions') List<SuggestedActionDto> suggestedActions,@JsonKey(name: 'bias_detected') List<String> biasDetected,@JsonKey(name: 'related_to_portfolio') bool? relatedToPortfolio
});




}
/// @nodoc
class _$ChatCompletionEventDtoCopyWithImpl<$Res>
    implements $ChatCompletionEventDtoCopyWith<$Res> {
  _$ChatCompletionEventDtoCopyWithImpl(this._self, this._then);

  final ChatCompletionEventDto _self;
  final $Res Function(ChatCompletionEventDto) _then;

/// Create a copy of ChatCompletionEventDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? content = freezed,Object? isFinal = null,Object? messageId = freezed,Object? suggestedActions = null,Object? biasDetected = null,Object? relatedToPortfolio = freezed,}) {
  return _then(ChatCompletionEventDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,isFinal: null == isFinal ? _self.isFinal : isFinal // ignore: cast_nullable_to_non_nullable
as bool,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,suggestedActions: null == suggestedActions ? _self.suggestedActions : suggestedActions // ignore: cast_nullable_to_non_nullable
as List<SuggestedActionDto>,biasDetected: null == biasDetected ? _self.biasDetected : biasDetected // ignore: cast_nullable_to_non_nullable
as List<String>,relatedToPortfolio: freezed == relatedToPortfolio ? _self.relatedToPortfolio : relatedToPortfolio // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatCompletionEventDto].
extension ChatCompletionEventDtoPatterns on ChatCompletionEventDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatCompletionEventDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatCompletionEventDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatCompletionEventDto value)  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionEventDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatCompletionEventDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChatCompletionEventDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type, @JsonKey(name: 'content')  String? content, @JsonKey(name: 'is_final')  bool isFinal, @JsonKey(name: 'message_id')  String? messageId, @JsonKey(name: 'suggested_actions')  List<SuggestedActionDto> suggestedActions, @JsonKey(name: 'bias_detected')  List<String> biasDetected, @JsonKey(name: 'related_to_portfolio')  bool? relatedToPortfolio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatCompletionEventDto() when $default != null:
return $default(_that.type,_that.content,_that.isFinal,_that.messageId,_that.suggestedActions,_that.biasDetected,_that.relatedToPortfolio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type, @JsonKey(name: 'content')  String? content, @JsonKey(name: 'is_final')  bool isFinal, @JsonKey(name: 'message_id')  String? messageId, @JsonKey(name: 'suggested_actions')  List<SuggestedActionDto> suggestedActions, @JsonKey(name: 'bias_detected')  List<String> biasDetected, @JsonKey(name: 'related_to_portfolio')  bool? relatedToPortfolio)  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionEventDto():
return $default(_that.type,_that.content,_that.isFinal,_that.messageId,_that.suggestedActions,_that.biasDetected,_that.relatedToPortfolio);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type, @JsonKey(name: 'content')  String? content, @JsonKey(name: 'is_final')  bool isFinal, @JsonKey(name: 'message_id')  String? messageId, @JsonKey(name: 'suggested_actions')  List<SuggestedActionDto> suggestedActions, @JsonKey(name: 'bias_detected')  List<String> biasDetected, @JsonKey(name: 'related_to_portfolio')  bool? relatedToPortfolio)?  $default,) {final _that = this;
switch (_that) {
case _ChatCompletionEventDto() when $default != null:
return $default(_that.type,_that.content,_that.isFinal,_that.messageId,_that.suggestedActions,_that.biasDetected,_that.relatedToPortfolio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatCompletionEventDto implements ChatCompletionEventDto {
  const _ChatCompletionEventDto({this.type = '', @JsonKey(name: 'content') this.content, @JsonKey(name: 'is_final') this.isFinal = false, @JsonKey(name: 'message_id') this.messageId, @JsonKey(name: 'suggested_actions')  List<SuggestedActionDto> suggestedActions = const <SuggestedActionDto>[], @JsonKey(name: 'bias_detected')  List<String> biasDetected = const <String>[], @JsonKey(name: 'related_to_portfolio') this.relatedToPortfolio}): _suggestedActions = suggestedActions,_biasDetected = biasDetected;
  factory _ChatCompletionEventDto.fromJson(Map<String, dynamic> json) => _$ChatCompletionEventDtoFromJson(json);

@override@JsonKey() final  String type;
@override@JsonKey(name: 'content') final  String? content;
@override@JsonKey(name: 'is_final') final  bool isFinal;
@override@JsonKey(name: 'message_id') final  String? messageId;
 final  List<SuggestedActionDto> _suggestedActions;
@override@JsonKey(name: 'suggested_actions') List<SuggestedActionDto> get suggestedActions {
  if (_suggestedActions is EqualUnmodifiableListView) return _suggestedActions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestedActions);
}

 final  List<String> _biasDetected;
@override@JsonKey(name: 'bias_detected') List<String> get biasDetected {
  if (_biasDetected is EqualUnmodifiableListView) return _biasDetected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_biasDetected);
}

@override@JsonKey(name: 'related_to_portfolio') final  bool? relatedToPortfolio;

/// Create a copy of ChatCompletionEventDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatCompletionEventDtoCopyWith<_ChatCompletionEventDto> get copyWith => __$ChatCompletionEventDtoCopyWithImpl<_ChatCompletionEventDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatCompletionEventDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatCompletionEventDto&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content)&&(identical(other.isFinal, isFinal) || other.isFinal == isFinal)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&const DeepCollectionEquality().equals(other.suggestedActions, _suggestedActions)&&const DeepCollectionEquality().equals(other.biasDetected, _biasDetected)&&(identical(other.relatedToPortfolio, relatedToPortfolio) || other.relatedToPortfolio == relatedToPortfolio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,content,isFinal,messageId,const DeepCollectionEquality().hash(_suggestedActions),const DeepCollectionEquality().hash(_biasDetected),relatedToPortfolio);
}

@override
String toString() {
    return 'ChatCompletionEventDto(type: $type, content: $content, isFinal: $isFinal, messageId: $messageId, suggestedActions: $suggestedActions, biasDetected: $biasDetected, relatedToPortfolio: $relatedToPortfolio)';
}


}

/// @nodoc
abstract mixin class _$ChatCompletionEventDtoCopyWith<$Res> implements $ChatCompletionEventDtoCopyWith<$Res> {
  factory _$ChatCompletionEventDtoCopyWith(_ChatCompletionEventDto value, $Res Function(_ChatCompletionEventDto) _then) = __$ChatCompletionEventDtoCopyWithImpl;
@override @useResult
$Res call({
 String type,@JsonKey(name: 'content') String? content,@JsonKey(name: 'is_final') bool isFinal,@JsonKey(name: 'message_id') String? messageId,@JsonKey(name: 'suggested_actions') List<SuggestedActionDto> suggestedActions,@JsonKey(name: 'bias_detected') List<String> biasDetected,@JsonKey(name: 'related_to_portfolio') bool? relatedToPortfolio
});




}
/// @nodoc
class __$ChatCompletionEventDtoCopyWithImpl<$Res>
    implements _$ChatCompletionEventDtoCopyWith<$Res> {
  __$ChatCompletionEventDtoCopyWithImpl(this._self, this._then);

  final _ChatCompletionEventDto _self;
  final $Res Function(_ChatCompletionEventDto) _then;

/// Create a copy of ChatCompletionEventDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? content = freezed,Object? isFinal = null,Object? messageId = freezed,Object? suggestedActions = null,Object? biasDetected = null,Object? relatedToPortfolio = freezed,}) {
  return _then(_ChatCompletionEventDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,isFinal: null == isFinal ? _self.isFinal : isFinal // ignore: cast_nullable_to_non_nullable
as bool,messageId: freezed == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String?,suggestedActions: null == suggestedActions ? _self._suggestedActions : suggestedActions // ignore: cast_nullable_to_non_nullable
as List<SuggestedActionDto>,biasDetected: null == biasDetected ? _self._biasDetected : biasDetected // ignore: cast_nullable_to_non_nullable
as List<String>,relatedToPortfolio: freezed == relatedToPortfolio ? _self.relatedToPortfolio : relatedToPortfolio // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$SuggestedActionDto {

 String get text; String get action;
/// Create a copy of SuggestedActionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestedActionDtoCopyWith<SuggestedActionDto> get copyWith => _$SuggestedActionDtoCopyWithImpl<SuggestedActionDto>(this as SuggestedActionDto, _$identity);

  /// Serializes this SuggestedActionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SuggestedActionDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuggestedActionDto&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.action, _this.action) || other.action == _this.action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SuggestedActionDto;
  return Object.hash(runtimeType,_this.text,_this.action);
}

@override
String toString() {
  final _this = this as SuggestedActionDto;
  return 'SuggestedActionDto(text: ${_this.text}, action: ${_this.action})';
}


}

/// @nodoc
abstract mixin class $SuggestedActionDtoCopyWith<$Res>  {
  factory $SuggestedActionDtoCopyWith(SuggestedActionDto value, $Res Function(SuggestedActionDto) _then) = _$SuggestedActionDtoCopyWithImpl;
@useResult
$Res call({
 String text, String action
});




}
/// @nodoc
class _$SuggestedActionDtoCopyWithImpl<$Res>
    implements $SuggestedActionDtoCopyWith<$Res> {
  _$SuggestedActionDtoCopyWithImpl(this._self, this._then);

  final SuggestedActionDto _self;
  final $Res Function(SuggestedActionDto) _then;

/// Create a copy of SuggestedActionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? action = null,}) {
  return _then(SuggestedActionDto(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SuggestedActionDto].
extension SuggestedActionDtoPatterns on SuggestedActionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuggestedActionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuggestedActionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuggestedActionDto value)  $default,){
final _that = this;
switch (_that) {
case _SuggestedActionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuggestedActionDto value)?  $default,){
final _that = this;
switch (_that) {
case _SuggestedActionDto() when $default != null:
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
case _SuggestedActionDto() when $default != null:
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
case _SuggestedActionDto():
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
case _SuggestedActionDto() when $default != null:
return $default(_that.text,_that.action);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SuggestedActionDto implements SuggestedActionDto {
  const _SuggestedActionDto({this.text = '', this.action = ''});
  factory _SuggestedActionDto.fromJson(Map<String, dynamic> json) => _$SuggestedActionDtoFromJson(json);

@override@JsonKey() final  String text;
@override@JsonKey() final  String action;

/// Create a copy of SuggestedActionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestedActionDtoCopyWith<_SuggestedActionDto> get copyWith => __$SuggestedActionDtoCopyWithImpl<_SuggestedActionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuggestedActionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuggestedActionDto&&(identical(other.text, text) || other.text == text)&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,text,action);
}

@override
String toString() {
    return 'SuggestedActionDto(text: $text, action: $action)';
}


}

/// @nodoc
abstract mixin class _$SuggestedActionDtoCopyWith<$Res> implements $SuggestedActionDtoCopyWith<$Res> {
  factory _$SuggestedActionDtoCopyWith(_SuggestedActionDto value, $Res Function(_SuggestedActionDto) _then) = __$SuggestedActionDtoCopyWithImpl;
@override @useResult
$Res call({
 String text, String action
});




}
/// @nodoc
class __$SuggestedActionDtoCopyWithImpl<$Res>
    implements _$SuggestedActionDtoCopyWith<$Res> {
  __$SuggestedActionDtoCopyWithImpl(this._self, this._then);

  final _SuggestedActionDto _self;
  final $Res Function(_SuggestedActionDto) _then;

/// Create a copy of SuggestedActionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? action = null,}) {
  return _then(_SuggestedActionDto(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ChatVoiceResponseDto {

 String get transcript;@JsonKey(name: 'response_text') String get responseText;@JsonKey(name: 'audio_url') String? get audioUrl;@JsonKey(name: 'suggested_replies') List<String> get suggestedReplies;@JsonKey(name: 'bias_detected') List<String> get biasDetected;
/// Create a copy of ChatVoiceResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatVoiceResponseDtoCopyWith<ChatVoiceResponseDto> get copyWith => _$ChatVoiceResponseDtoCopyWithImpl<ChatVoiceResponseDto>(this as ChatVoiceResponseDto, _$identity);

  /// Serializes this ChatVoiceResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChatVoiceResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatVoiceResponseDto&&(identical(other.transcript, _this.transcript) || other.transcript == _this.transcript)&&(identical(other.responseText, _this.responseText) || other.responseText == _this.responseText)&&(identical(other.audioUrl, _this.audioUrl) || other.audioUrl == _this.audioUrl)&&const DeepCollectionEquality().equals(other.suggestedReplies, _this.suggestedReplies)&&const DeepCollectionEquality().equals(other.biasDetected, _this.biasDetected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChatVoiceResponseDto;
  return Object.hash(runtimeType,_this.transcript,_this.responseText,_this.audioUrl,const DeepCollectionEquality().hash(_this.suggestedReplies),const DeepCollectionEquality().hash(_this.biasDetected));
}

@override
String toString() {
  final _this = this as ChatVoiceResponseDto;
  return 'ChatVoiceResponseDto(transcript: ${_this.transcript}, responseText: ${_this.responseText}, audioUrl: ${_this.audioUrl}, suggestedReplies: ${_this.suggestedReplies}, biasDetected: ${_this.biasDetected})';
}


}

/// @nodoc
abstract mixin class $ChatVoiceResponseDtoCopyWith<$Res>  {
  factory $ChatVoiceResponseDtoCopyWith(ChatVoiceResponseDto value, $Res Function(ChatVoiceResponseDto) _then) = _$ChatVoiceResponseDtoCopyWithImpl;
@useResult
$Res call({
 String transcript,@JsonKey(name: 'response_text') String responseText,@JsonKey(name: 'audio_url') String? audioUrl,@JsonKey(name: 'suggested_replies') List<String> suggestedReplies,@JsonKey(name: 'bias_detected') List<String> biasDetected
});




}
/// @nodoc
class _$ChatVoiceResponseDtoCopyWithImpl<$Res>
    implements $ChatVoiceResponseDtoCopyWith<$Res> {
  _$ChatVoiceResponseDtoCopyWithImpl(this._self, this._then);

  final ChatVoiceResponseDto _self;
  final $Res Function(ChatVoiceResponseDto) _then;

/// Create a copy of ChatVoiceResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transcript = null,Object? responseText = null,Object? audioUrl = freezed,Object? suggestedReplies = null,Object? biasDetected = null,}) {
  return _then(ChatVoiceResponseDto(
transcript: null == transcript ? _self.transcript : transcript // ignore: cast_nullable_to_non_nullable
as String,responseText: null == responseText ? _self.responseText : responseText // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,suggestedReplies: null == suggestedReplies ? _self.suggestedReplies : suggestedReplies // ignore: cast_nullable_to_non_nullable
as List<String>,biasDetected: null == biasDetected ? _self.biasDetected : biasDetected // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatVoiceResponseDto].
extension ChatVoiceResponseDtoPatterns on ChatVoiceResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatVoiceResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatVoiceResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatVoiceResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ChatVoiceResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatVoiceResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChatVoiceResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transcript, @JsonKey(name: 'response_text')  String responseText, @JsonKey(name: 'audio_url')  String? audioUrl, @JsonKey(name: 'suggested_replies')  List<String> suggestedReplies, @JsonKey(name: 'bias_detected')  List<String> biasDetected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatVoiceResponseDto() when $default != null:
return $default(_that.transcript,_that.responseText,_that.audioUrl,_that.suggestedReplies,_that.biasDetected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transcript, @JsonKey(name: 'response_text')  String responseText, @JsonKey(name: 'audio_url')  String? audioUrl, @JsonKey(name: 'suggested_replies')  List<String> suggestedReplies, @JsonKey(name: 'bias_detected')  List<String> biasDetected)  $default,) {final _that = this;
switch (_that) {
case _ChatVoiceResponseDto():
return $default(_that.transcript,_that.responseText,_that.audioUrl,_that.suggestedReplies,_that.biasDetected);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transcript, @JsonKey(name: 'response_text')  String responseText, @JsonKey(name: 'audio_url')  String? audioUrl, @JsonKey(name: 'suggested_replies')  List<String> suggestedReplies, @JsonKey(name: 'bias_detected')  List<String> biasDetected)?  $default,) {final _that = this;
switch (_that) {
case _ChatVoiceResponseDto() when $default != null:
return $default(_that.transcript,_that.responseText,_that.audioUrl,_that.suggestedReplies,_that.biasDetected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatVoiceResponseDto implements ChatVoiceResponseDto {
  const _ChatVoiceResponseDto({this.transcript = '', @JsonKey(name: 'response_text') this.responseText = '', @JsonKey(name: 'audio_url') this.audioUrl, @JsonKey(name: 'suggested_replies')  List<String> suggestedReplies = const <String>[], @JsonKey(name: 'bias_detected')  List<String> biasDetected = const <String>[]}): _suggestedReplies = suggestedReplies,_biasDetected = biasDetected;
  factory _ChatVoiceResponseDto.fromJson(Map<String, dynamic> json) => _$ChatVoiceResponseDtoFromJson(json);

@override@JsonKey() final  String transcript;
@override@JsonKey(name: 'response_text') final  String responseText;
@override@JsonKey(name: 'audio_url') final  String? audioUrl;
 final  List<String> _suggestedReplies;
@override@JsonKey(name: 'suggested_replies') List<String> get suggestedReplies {
  if (_suggestedReplies is EqualUnmodifiableListView) return _suggestedReplies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestedReplies);
}

 final  List<String> _biasDetected;
@override@JsonKey(name: 'bias_detected') List<String> get biasDetected {
  if (_biasDetected is EqualUnmodifiableListView) return _biasDetected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_biasDetected);
}


/// Create a copy of ChatVoiceResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatVoiceResponseDtoCopyWith<_ChatVoiceResponseDto> get copyWith => __$ChatVoiceResponseDtoCopyWithImpl<_ChatVoiceResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatVoiceResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatVoiceResponseDto&&(identical(other.transcript, transcript) || other.transcript == transcript)&&(identical(other.responseText, responseText) || other.responseText == responseText)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other.suggestedReplies, _suggestedReplies)&&const DeepCollectionEquality().equals(other.biasDetected, _biasDetected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,transcript,responseText,audioUrl,const DeepCollectionEquality().hash(_suggestedReplies),const DeepCollectionEquality().hash(_biasDetected));
}

@override
String toString() {
    return 'ChatVoiceResponseDto(transcript: $transcript, responseText: $responseText, audioUrl: $audioUrl, suggestedReplies: $suggestedReplies, biasDetected: $biasDetected)';
}


}

/// @nodoc
abstract mixin class _$ChatVoiceResponseDtoCopyWith<$Res> implements $ChatVoiceResponseDtoCopyWith<$Res> {
  factory _$ChatVoiceResponseDtoCopyWith(_ChatVoiceResponseDto value, $Res Function(_ChatVoiceResponseDto) _then) = __$ChatVoiceResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String transcript,@JsonKey(name: 'response_text') String responseText,@JsonKey(name: 'audio_url') String? audioUrl,@JsonKey(name: 'suggested_replies') List<String> suggestedReplies,@JsonKey(name: 'bias_detected') List<String> biasDetected
});




}
/// @nodoc
class __$ChatVoiceResponseDtoCopyWithImpl<$Res>
    implements _$ChatVoiceResponseDtoCopyWith<$Res> {
  __$ChatVoiceResponseDtoCopyWithImpl(this._self, this._then);

  final _ChatVoiceResponseDto _self;
  final $Res Function(_ChatVoiceResponseDto) _then;

/// Create a copy of ChatVoiceResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transcript = null,Object? responseText = null,Object? audioUrl = freezed,Object? suggestedReplies = null,Object? biasDetected = null,}) {
  return _then(_ChatVoiceResponseDto(
transcript: null == transcript ? _self.transcript : transcript // ignore: cast_nullable_to_non_nullable
as String,responseText: null == responseText ? _self.responseText : responseText // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,suggestedReplies: null == suggestedReplies ? _self._suggestedReplies : suggestedReplies // ignore: cast_nullable_to_non_nullable
as List<String>,biasDetected: null == biasDetected ? _self._biasDetected : biasDetected // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
