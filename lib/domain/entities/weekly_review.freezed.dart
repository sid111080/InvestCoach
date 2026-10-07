// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PortfolioComparison {

 double get yourReturn; double get indexReturn;
/// Create a copy of PortfolioComparison
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioComparisonCopyWith<PortfolioComparison> get copyWith => _$PortfolioComparisonCopyWithImpl<PortfolioComparison>(this as PortfolioComparison, _$identity);

  /// Serializes this PortfolioComparison to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PortfolioComparison;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioComparison&&(identical(other.yourReturn, _this.yourReturn) || other.yourReturn == _this.yourReturn)&&(identical(other.indexReturn, _this.indexReturn) || other.indexReturn == _this.indexReturn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PortfolioComparison;
  return Object.hash(runtimeType,_this.yourReturn,_this.indexReturn);
}

@override
String toString() {
  final _this = this as PortfolioComparison;
  return 'PortfolioComparison(yourReturn: ${_this.yourReturn}, indexReturn: ${_this.indexReturn})';
}


}

/// @nodoc
abstract mixin class $PortfolioComparisonCopyWith<$Res>  {
  factory $PortfolioComparisonCopyWith(PortfolioComparison value, $Res Function(PortfolioComparison) _then) = _$PortfolioComparisonCopyWithImpl;
@useResult
$Res call({
 double yourReturn, double indexReturn
});




}
/// @nodoc
class _$PortfolioComparisonCopyWithImpl<$Res>
    implements $PortfolioComparisonCopyWith<$Res> {
  _$PortfolioComparisonCopyWithImpl(this._self, this._then);

  final PortfolioComparison _self;
  final $Res Function(PortfolioComparison) _then;

/// Create a copy of PortfolioComparison
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? yourReturn = null,Object? indexReturn = null,}) {
  return _then(PortfolioComparison(
yourReturn: null == yourReturn ? _self.yourReturn : yourReturn // ignore: cast_nullable_to_non_nullable
as double,indexReturn: null == indexReturn ? _self.indexReturn : indexReturn // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioComparison].
extension PortfolioComparisonPatterns on PortfolioComparison {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioComparison value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioComparison() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioComparison value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioComparison():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioComparison value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioComparison() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double yourReturn,  double indexReturn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioComparison() when $default != null:
return $default(_that.yourReturn,_that.indexReturn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double yourReturn,  double indexReturn)  $default,) {final _that = this;
switch (_that) {
case _PortfolioComparison():
return $default(_that.yourReturn,_that.indexReturn);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double yourReturn,  double indexReturn)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioComparison() when $default != null:
return $default(_that.yourReturn,_that.indexReturn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioComparison implements PortfolioComparison {
  const _PortfolioComparison({required this.yourReturn, required this.indexReturn});
  factory _PortfolioComparison.fromJson(Map<String, dynamic> json) => _$PortfolioComparisonFromJson(json);

@override final  double yourReturn;
@override final  double indexReturn;

/// Create a copy of PortfolioComparison
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioComparisonCopyWith<_PortfolioComparison> get copyWith => __$PortfolioComparisonCopyWithImpl<_PortfolioComparison>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioComparisonToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioComparison&&(identical(other.yourReturn, yourReturn) || other.yourReturn == yourReturn)&&(identical(other.indexReturn, indexReturn) || other.indexReturn == indexReturn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,yourReturn,indexReturn);
}

@override
String toString() {
    return 'PortfolioComparison(yourReturn: $yourReturn, indexReturn: $indexReturn)';
}


}

/// @nodoc
abstract mixin class _$PortfolioComparisonCopyWith<$Res> implements $PortfolioComparisonCopyWith<$Res> {
  factory _$PortfolioComparisonCopyWith(_PortfolioComparison value, $Res Function(_PortfolioComparison) _then) = __$PortfolioComparisonCopyWithImpl;
@override @useResult
$Res call({
 double yourReturn, double indexReturn
});




}
/// @nodoc
class __$PortfolioComparisonCopyWithImpl<$Res>
    implements _$PortfolioComparisonCopyWith<$Res> {
  __$PortfolioComparisonCopyWithImpl(this._self, this._then);

  final _PortfolioComparison _self;
  final $Res Function(_PortfolioComparison) _then;

/// Create a copy of PortfolioComparison
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? yourReturn = null,Object? indexReturn = null,}) {
  return _then(_PortfolioComparison(
yourReturn: null == yourReturn ? _self.yourReturn : yourReturn // ignore: cast_nullable_to_non_nullable
as double,indexReturn: null == indexReturn ? _self.indexReturn : indexReturn // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$WeeklyReview {

/// Неделя в формате ISO (например, «2026-W37»).
 String get week;/// Process Score (0–10).
 double get processScore;/// Ключевые инсайты (3–4 карточки).
 List<String> get insights;/// Сравнение с индексом (может отсутствовать).
 PortfolioComparison? get portfolioComparison;/// Дата генерации.
 DateTime? get generatedAt;
/// Create a copy of WeeklyReview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyReviewCopyWith<WeeklyReview> get copyWith => _$WeeklyReviewCopyWithImpl<WeeklyReview>(this as WeeklyReview, _$identity);

  /// Serializes this WeeklyReview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WeeklyReview;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyReview&&(identical(other.week, _this.week) || other.week == _this.week)&&(identical(other.processScore, _this.processScore) || other.processScore == _this.processScore)&&const DeepCollectionEquality().equals(other.insights, _this.insights)&&(identical(other.portfolioComparison, _this.portfolioComparison) || other.portfolioComparison == _this.portfolioComparison)&&(identical(other.generatedAt, _this.generatedAt) || other.generatedAt == _this.generatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeeklyReview;
  return Object.hash(runtimeType,_this.week,_this.processScore,const DeepCollectionEquality().hash(_this.insights),_this.portfolioComparison,_this.generatedAt);
}

@override
String toString() {
  final _this = this as WeeklyReview;
  return 'WeeklyReview(week: ${_this.week}, processScore: ${_this.processScore}, insights: ${_this.insights}, portfolioComparison: ${_this.portfolioComparison}, generatedAt: ${_this.generatedAt})';
}


}

/// @nodoc
abstract mixin class $WeeklyReviewCopyWith<$Res>  {
  factory $WeeklyReviewCopyWith(WeeklyReview value, $Res Function(WeeklyReview) _then) = _$WeeklyReviewCopyWithImpl;
@useResult
$Res call({
 String week, double processScore, List<String> insights, PortfolioComparison? portfolioComparison, DateTime? generatedAt
});


$PortfolioComparisonCopyWith<$Res>? get portfolioComparison;

}
/// @nodoc
class _$WeeklyReviewCopyWithImpl<$Res>
    implements $WeeklyReviewCopyWith<$Res> {
  _$WeeklyReviewCopyWithImpl(this._self, this._then);

  final WeeklyReview _self;
  final $Res Function(WeeklyReview) _then;

/// Create a copy of WeeklyReview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? week = null,Object? processScore = null,Object? insights = null,Object? portfolioComparison = freezed,Object? generatedAt = freezed,}) {
  return _then(WeeklyReview(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as String,processScore: null == processScore ? _self.processScore : processScore // ignore: cast_nullable_to_non_nullable
as double,insights: null == insights ? _self.insights : insights // ignore: cast_nullable_to_non_nullable
as List<String>,portfolioComparison: freezed == portfolioComparison ? _self.portfolioComparison : portfolioComparison // ignore: cast_nullable_to_non_nullable
as PortfolioComparison?,generatedAt: freezed == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of WeeklyReview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PortfolioComparisonCopyWith<$Res>? get portfolioComparison {
    if (_self.portfolioComparison == null) {
    return null;
  }

  return $PortfolioComparisonCopyWith<$Res>(_self.portfolioComparison!, (value) {
    return _then(_self.copyWith(portfolioComparison: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeeklyReview].
extension WeeklyReviewPatterns on WeeklyReview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyReview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyReview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyReview value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyReview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyReview value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyReview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String week,  double processScore,  List<String> insights,  PortfolioComparison? portfolioComparison,  DateTime? generatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyReview() when $default != null:
return $default(_that.week,_that.processScore,_that.insights,_that.portfolioComparison,_that.generatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String week,  double processScore,  List<String> insights,  PortfolioComparison? portfolioComparison,  DateTime? generatedAt)  $default,) {final _that = this;
switch (_that) {
case _WeeklyReview():
return $default(_that.week,_that.processScore,_that.insights,_that.portfolioComparison,_that.generatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String week,  double processScore,  List<String> insights,  PortfolioComparison? portfolioComparison,  DateTime? generatedAt)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyReview() when $default != null:
return $default(_that.week,_that.processScore,_that.insights,_that.portfolioComparison,_that.generatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeeklyReview implements WeeklyReview {
  const _WeeklyReview({required this.week, required this.processScore, required  List<String> insights, this.portfolioComparison, this.generatedAt}): _insights = insights;
  factory _WeeklyReview.fromJson(Map<String, dynamic> json) => _$WeeklyReviewFromJson(json);

/// Неделя в формате ISO (например, «2026-W37»).
@override final  String week;
/// Process Score (0–10).
@override final  double processScore;
/// Ключевые инсайты (3–4 карточки).
 final  List<String> _insights;
/// Ключевые инсайты (3–4 карточки).
@override List<String> get insights {
  if (_insights is EqualUnmodifiableListView) return _insights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_insights);
}

/// Сравнение с индексом (может отсутствовать).
@override final  PortfolioComparison? portfolioComparison;
/// Дата генерации.
@override final  DateTime? generatedAt;

/// Create a copy of WeeklyReview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyReviewCopyWith<_WeeklyReview> get copyWith => __$WeeklyReviewCopyWithImpl<_WeeklyReview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeeklyReviewToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyReview&&(identical(other.week, week) || other.week == week)&&(identical(other.processScore, processScore) || other.processScore == processScore)&&const DeepCollectionEquality().equals(other.insights, _insights)&&(identical(other.portfolioComparison, portfolioComparison) || other.portfolioComparison == portfolioComparison)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,week,processScore,const DeepCollectionEquality().hash(_insights),portfolioComparison,generatedAt);
}

@override
String toString() {
    return 'WeeklyReview(week: $week, processScore: $processScore, insights: $insights, portfolioComparison: $portfolioComparison, generatedAt: $generatedAt)';
}


}

/// @nodoc
abstract mixin class _$WeeklyReviewCopyWith<$Res> implements $WeeklyReviewCopyWith<$Res> {
  factory _$WeeklyReviewCopyWith(_WeeklyReview value, $Res Function(_WeeklyReview) _then) = __$WeeklyReviewCopyWithImpl;
@override @useResult
$Res call({
 String week, double processScore, List<String> insights, PortfolioComparison? portfolioComparison, DateTime? generatedAt
});


@override $PortfolioComparisonCopyWith<$Res>? get portfolioComparison;

}
/// @nodoc
class __$WeeklyReviewCopyWithImpl<$Res>
    implements _$WeeklyReviewCopyWith<$Res> {
  __$WeeklyReviewCopyWithImpl(this._self, this._then);

  final _WeeklyReview _self;
  final $Res Function(_WeeklyReview) _then;

/// Create a copy of WeeklyReview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? week = null,Object? processScore = null,Object? insights = null,Object? portfolioComparison = freezed,Object? generatedAt = freezed,}) {
  return _then(_WeeklyReview(
week: null == week ? _self.week : week // ignore: cast_nullable_to_non_nullable
as String,processScore: null == processScore ? _self.processScore : processScore // ignore: cast_nullable_to_non_nullable
as double,insights: null == insights ? _self._insights : insights // ignore: cast_nullable_to_non_nullable
as List<String>,portfolioComparison: freezed == portfolioComparison ? _self.portfolioComparison : portfolioComparison // ignore: cast_nullable_to_non_nullable
as PortfolioComparison?,generatedAt: freezed == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of WeeklyReview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PortfolioComparisonCopyWith<$Res>? get portfolioComparison {
    if (_self.portfolioComparison == null) {
    return null;
  }

  return $PortfolioComparisonCopyWith<$Res>(_self.portfolioComparison!, (value) {
    return _then(_self.copyWith(portfolioComparison: value));
  });
}
}

// dart format on
