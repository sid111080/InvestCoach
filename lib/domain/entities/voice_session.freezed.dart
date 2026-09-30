// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VoiceSession {

 VoiceSessionPhase get phase;/// Распознанный текст (в mock-режиме — демо-транскрипция).
 String get transcript;/// Текст ответа Coach (пока пуст до `speaking`).
 String get responseText; String? get audioUrl; List<String> get suggestedReplies; List<String> get biasDetected; ChatFailure? get failure;
/// Create a copy of VoiceSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceSessionCopyWith<VoiceSession> get copyWith => _$VoiceSessionCopyWithImpl<VoiceSession>(this as VoiceSession, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as VoiceSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceSession&&(identical(other.phase, _this.phase) || other.phase == _this.phase)&&(identical(other.transcript, _this.transcript) || other.transcript == _this.transcript)&&(identical(other.responseText, _this.responseText) || other.responseText == _this.responseText)&&(identical(other.audioUrl, _this.audioUrl) || other.audioUrl == _this.audioUrl)&&const DeepCollectionEquality().equals(other.suggestedReplies, _this.suggestedReplies)&&const DeepCollectionEquality().equals(other.biasDetected, _this.biasDetected)&&(identical(other.failure, _this.failure) || other.failure == _this.failure));
}


@override
int get hashCode {
  final _this = this as VoiceSession;
  return Object.hash(runtimeType,_this.phase,_this.transcript,_this.responseText,_this.audioUrl,const DeepCollectionEquality().hash(_this.suggestedReplies),const DeepCollectionEquality().hash(_this.biasDetected),_this.failure);
}

@override
String toString() {
  final _this = this as VoiceSession;
  return 'VoiceSession(phase: ${_this.phase}, transcript: ${_this.transcript}, responseText: ${_this.responseText}, audioUrl: ${_this.audioUrl}, suggestedReplies: ${_this.suggestedReplies}, biasDetected: ${_this.biasDetected}, failure: ${_this.failure})';
}


}

/// @nodoc
abstract mixin class $VoiceSessionCopyWith<$Res>  {
  factory $VoiceSessionCopyWith(VoiceSession value, $Res Function(VoiceSession) _then) = _$VoiceSessionCopyWithImpl;
@useResult
$Res call({
 VoiceSessionPhase phase, String transcript, String responseText, String? audioUrl, List<String> suggestedReplies, List<String> biasDetected, ChatFailure? failure
});




}
/// @nodoc
class _$VoiceSessionCopyWithImpl<$Res>
    implements $VoiceSessionCopyWith<$Res> {
  _$VoiceSessionCopyWithImpl(this._self, this._then);

  final VoiceSession _self;
  final $Res Function(VoiceSession) _then;

/// Create a copy of VoiceSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phase = null,Object? transcript = null,Object? responseText = null,Object? audioUrl = freezed,Object? suggestedReplies = null,Object? biasDetected = null,Object? failure = freezed,}) {
  return _then(VoiceSession(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as VoiceSessionPhase,transcript: null == transcript ? _self.transcript : transcript // ignore: cast_nullable_to_non_nullable
as String,responseText: null == responseText ? _self.responseText : responseText // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,suggestedReplies: null == suggestedReplies ? _self.suggestedReplies : suggestedReplies // ignore: cast_nullable_to_non_nullable
as List<String>,biasDetected: null == biasDetected ? _self.biasDetected : biasDetected // ignore: cast_nullable_to_non_nullable
as List<String>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as ChatFailure?,
  ));
}

}


/// Adds pattern-matching-related methods to [VoiceSession].
extension VoiceSessionPatterns on VoiceSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoiceSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoiceSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoiceSession value)  $default,){
final _that = this;
switch (_that) {
case _VoiceSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoiceSession value)?  $default,){
final _that = this;
switch (_that) {
case _VoiceSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VoiceSessionPhase phase,  String transcript,  String responseText,  String? audioUrl,  List<String> suggestedReplies,  List<String> biasDetected,  ChatFailure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoiceSession() when $default != null:
return $default(_that.phase,_that.transcript,_that.responseText,_that.audioUrl,_that.suggestedReplies,_that.biasDetected,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VoiceSessionPhase phase,  String transcript,  String responseText,  String? audioUrl,  List<String> suggestedReplies,  List<String> biasDetected,  ChatFailure? failure)  $default,) {final _that = this;
switch (_that) {
case _VoiceSession():
return $default(_that.phase,_that.transcript,_that.responseText,_that.audioUrl,_that.suggestedReplies,_that.biasDetected,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VoiceSessionPhase phase,  String transcript,  String responseText,  String? audioUrl,  List<String> suggestedReplies,  List<String> biasDetected,  ChatFailure? failure)?  $default,) {final _that = this;
switch (_that) {
case _VoiceSession() when $default != null:
return $default(_that.phase,_that.transcript,_that.responseText,_that.audioUrl,_that.suggestedReplies,_that.biasDetected,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _VoiceSession extends VoiceSession {
  const _VoiceSession({this.phase = VoiceSessionPhase.listening, this.transcript = '', this.responseText = '', this.audioUrl,  List<String> suggestedReplies = const <String>[],  List<String> biasDetected = const <String>[], this.failure}): _suggestedReplies = suggestedReplies,_biasDetected = biasDetected,super._();
  

@override@JsonKey() final  VoiceSessionPhase phase;
/// Распознанный текст (в mock-режиме — демо-транскрипция).
@override@JsonKey() final  String transcript;
/// Текст ответа Coach (пока пуст до `speaking`).
@override@JsonKey() final  String responseText;
@override final  String? audioUrl;
 final  List<String> _suggestedReplies;
@override@JsonKey() List<String> get suggestedReplies {
  if (_suggestedReplies is EqualUnmodifiableListView) return _suggestedReplies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestedReplies);
}

 final  List<String> _biasDetected;
@override@JsonKey() List<String> get biasDetected {
  if (_biasDetected is EqualUnmodifiableListView) return _biasDetected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_biasDetected);
}

@override final  ChatFailure? failure;

/// Create a copy of VoiceSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoiceSessionCopyWith<_VoiceSession> get copyWith => __$VoiceSessionCopyWithImpl<_VoiceSession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoiceSession&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.transcript, transcript) || other.transcript == transcript)&&(identical(other.responseText, responseText) || other.responseText == responseText)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other.suggestedReplies, _suggestedReplies)&&const DeepCollectionEquality().equals(other.biasDetected, _biasDetected)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,phase,transcript,responseText,audioUrl,const DeepCollectionEquality().hash(_suggestedReplies),const DeepCollectionEquality().hash(_biasDetected),failure);
}

@override
String toString() {
    return 'VoiceSession(phase: $phase, transcript: $transcript, responseText: $responseText, audioUrl: $audioUrl, suggestedReplies: $suggestedReplies, biasDetected: $biasDetected, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$VoiceSessionCopyWith<$Res> implements $VoiceSessionCopyWith<$Res> {
  factory _$VoiceSessionCopyWith(_VoiceSession value, $Res Function(_VoiceSession) _then) = __$VoiceSessionCopyWithImpl;
@override @useResult
$Res call({
 VoiceSessionPhase phase, String transcript, String responseText, String? audioUrl, List<String> suggestedReplies, List<String> biasDetected, ChatFailure? failure
});




}
/// @nodoc
class __$VoiceSessionCopyWithImpl<$Res>
    implements _$VoiceSessionCopyWith<$Res> {
  __$VoiceSessionCopyWithImpl(this._self, this._then);

  final _VoiceSession _self;
  final $Res Function(_VoiceSession) _then;

/// Create a copy of VoiceSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? transcript = null,Object? responseText = null,Object? audioUrl = freezed,Object? suggestedReplies = null,Object? biasDetected = null,Object? failure = freezed,}) {
  return _then(_VoiceSession(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as VoiceSessionPhase,transcript: null == transcript ? _self.transcript : transcript // ignore: cast_nullable_to_non_nullable
as String,responseText: null == responseText ? _self.responseText : responseText // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,suggestedReplies: null == suggestedReplies ? _self._suggestedReplies : suggestedReplies // ignore: cast_nullable_to_non_nullable
as List<String>,biasDetected: null == biasDetected ? _self._biasDetected : biasDetected // ignore: cast_nullable_to_non_nullable
as List<String>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as ChatFailure?,
  ));
}


}

// dart format on
