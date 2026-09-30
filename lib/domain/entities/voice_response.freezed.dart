// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoiceChatResponse {

/// Распознанный текст вопроса пользователя.
 String get transcript;/// Текст ответа Coach.
 String get responseText;/// URL аудио-ответа (ElevenLabs) — для озвучивания.
 String? get audioUrl;/// Варианты продолжения разговора.
 List<String> get suggestedReplies;/// Обнаруженные bias (например `recency_bias`).
 List<String> get biasDetected;
/// Create a copy of VoiceChatResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceChatResponseCopyWith<VoiceChatResponse> get copyWith => _$VoiceChatResponseCopyWithImpl<VoiceChatResponse>(this as VoiceChatResponse, _$identity);

  /// Serializes this VoiceChatResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VoiceChatResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceChatResponse&&(identical(other.transcript, _this.transcript) || other.transcript == _this.transcript)&&(identical(other.responseText, _this.responseText) || other.responseText == _this.responseText)&&(identical(other.audioUrl, _this.audioUrl) || other.audioUrl == _this.audioUrl)&&const DeepCollectionEquality().equals(other.suggestedReplies, _this.suggestedReplies)&&const DeepCollectionEquality().equals(other.biasDetected, _this.biasDetected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VoiceChatResponse;
  return Object.hash(runtimeType,_this.transcript,_this.responseText,_this.audioUrl,const DeepCollectionEquality().hash(_this.suggestedReplies),const DeepCollectionEquality().hash(_this.biasDetected));
}

@override
String toString() {
  final _this = this as VoiceChatResponse;
  return 'VoiceChatResponse(transcript: ${_this.transcript}, responseText: ${_this.responseText}, audioUrl: ${_this.audioUrl}, suggestedReplies: ${_this.suggestedReplies}, biasDetected: ${_this.biasDetected})';
}


}

/// @nodoc
abstract mixin class $VoiceChatResponseCopyWith<$Res>  {
  factory $VoiceChatResponseCopyWith(VoiceChatResponse value, $Res Function(VoiceChatResponse) _then) = _$VoiceChatResponseCopyWithImpl;
@useResult
$Res call({
 String transcript, String responseText, String? audioUrl, List<String> suggestedReplies, List<String> biasDetected
});




}
/// @nodoc
class _$VoiceChatResponseCopyWithImpl<$Res>
    implements $VoiceChatResponseCopyWith<$Res> {
  _$VoiceChatResponseCopyWithImpl(this._self, this._then);

  final VoiceChatResponse _self;
  final $Res Function(VoiceChatResponse) _then;

/// Create a copy of VoiceChatResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transcript = null,Object? responseText = null,Object? audioUrl = freezed,Object? suggestedReplies = null,Object? biasDetected = null,}) {
  return _then(VoiceChatResponse(
transcript: null == transcript ? _self.transcript : transcript // ignore: cast_nullable_to_non_nullable
as String,responseText: null == responseText ? _self.responseText : responseText // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,suggestedReplies: null == suggestedReplies ? _self.suggestedReplies : suggestedReplies // ignore: cast_nullable_to_non_nullable
as List<String>,biasDetected: null == biasDetected ? _self.biasDetected : biasDetected // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [VoiceChatResponse].
extension VoiceChatResponsePatterns on VoiceChatResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoiceChatResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoiceChatResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoiceChatResponse value)  $default,){
final _that = this;
switch (_that) {
case _VoiceChatResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoiceChatResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VoiceChatResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transcript,  String responseText,  String? audioUrl,  List<String> suggestedReplies,  List<String> biasDetected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoiceChatResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transcript,  String responseText,  String? audioUrl,  List<String> suggestedReplies,  List<String> biasDetected)  $default,) {final _that = this;
switch (_that) {
case _VoiceChatResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transcript,  String responseText,  String? audioUrl,  List<String> suggestedReplies,  List<String> biasDetected)?  $default,) {final _that = this;
switch (_that) {
case _VoiceChatResponse() when $default != null:
return $default(_that.transcript,_that.responseText,_that.audioUrl,_that.suggestedReplies,_that.biasDetected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoiceChatResponse implements VoiceChatResponse {
  const _VoiceChatResponse({required this.transcript, required this.responseText, this.audioUrl,  List<String> suggestedReplies = const <String>[],  List<String> biasDetected = const <String>[]}): _suggestedReplies = suggestedReplies,_biasDetected = biasDetected;
  factory _VoiceChatResponse.fromJson(Map<String, dynamic> json) => _$VoiceChatResponseFromJson(json);

/// Распознанный текст вопроса пользователя.
@override final  String transcript;
/// Текст ответа Coach.
@override final  String responseText;
/// URL аудио-ответа (ElevenLabs) — для озвучивания.
@override final  String? audioUrl;
/// Варианты продолжения разговора.
 final  List<String> _suggestedReplies;
/// Варианты продолжения разговора.
@override@JsonKey() List<String> get suggestedReplies {
  if (_suggestedReplies is EqualUnmodifiableListView) return _suggestedReplies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestedReplies);
}

/// Обнаруженные bias (например `recency_bias`).
 final  List<String> _biasDetected;
/// Обнаруженные bias (например `recency_bias`).
@override@JsonKey() List<String> get biasDetected {
  if (_biasDetected is EqualUnmodifiableListView) return _biasDetected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_biasDetected);
}


/// Create a copy of VoiceChatResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoiceChatResponseCopyWith<_VoiceChatResponse> get copyWith => __$VoiceChatResponseCopyWithImpl<_VoiceChatResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoiceChatResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoiceChatResponse&&(identical(other.transcript, transcript) || other.transcript == transcript)&&(identical(other.responseText, responseText) || other.responseText == responseText)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other.suggestedReplies, _suggestedReplies)&&const DeepCollectionEquality().equals(other.biasDetected, _biasDetected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,transcript,responseText,audioUrl,const DeepCollectionEquality().hash(_suggestedReplies),const DeepCollectionEquality().hash(_biasDetected));
}

@override
String toString() {
    return 'VoiceChatResponse(transcript: $transcript, responseText: $responseText, audioUrl: $audioUrl, suggestedReplies: $suggestedReplies, biasDetected: $biasDetected)';
}


}

/// @nodoc
abstract mixin class _$VoiceChatResponseCopyWith<$Res> implements $VoiceChatResponseCopyWith<$Res> {
  factory _$VoiceChatResponseCopyWith(_VoiceChatResponse value, $Res Function(_VoiceChatResponse) _then) = __$VoiceChatResponseCopyWithImpl;
@override @useResult
$Res call({
 String transcript, String responseText, String? audioUrl, List<String> suggestedReplies, List<String> biasDetected
});




}
/// @nodoc
class __$VoiceChatResponseCopyWithImpl<$Res>
    implements _$VoiceChatResponseCopyWith<$Res> {
  __$VoiceChatResponseCopyWithImpl(this._self, this._then);

  final _VoiceChatResponse _self;
  final $Res Function(_VoiceChatResponse) _then;

/// Create a copy of VoiceChatResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transcript = null,Object? responseText = null,Object? audioUrl = freezed,Object? suggestedReplies = null,Object? biasDetected = null,}) {
  return _then(_VoiceChatResponse(
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
