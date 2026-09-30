// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_news_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyNewsResponseDto {

 List<NewsItemDto> get news;
/// Create a copy of DailyNewsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyNewsResponseDtoCopyWith<DailyNewsResponseDto> get copyWith => _$DailyNewsResponseDtoCopyWithImpl<DailyNewsResponseDto>(this as DailyNewsResponseDto, _$identity);

  /// Serializes this DailyNewsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyNewsResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyNewsResponseDto&&const DeepCollectionEquality().equals(other.news, _this.news));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyNewsResponseDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.news));
}

@override
String toString() {
  final _this = this as DailyNewsResponseDto;
  return 'DailyNewsResponseDto(news: ${_this.news})';
}


}

/// @nodoc
abstract mixin class $DailyNewsResponseDtoCopyWith<$Res>  {
  factory $DailyNewsResponseDtoCopyWith(DailyNewsResponseDto value, $Res Function(DailyNewsResponseDto) _then) = _$DailyNewsResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<NewsItemDto> news
});




}
/// @nodoc
class _$DailyNewsResponseDtoCopyWithImpl<$Res>
    implements $DailyNewsResponseDtoCopyWith<$Res> {
  _$DailyNewsResponseDtoCopyWithImpl(this._self, this._then);

  final DailyNewsResponseDto _self;
  final $Res Function(DailyNewsResponseDto) _then;

/// Create a copy of DailyNewsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? news = null,}) {
  return _then(DailyNewsResponseDto(
news: null == news ? _self.news : news // ignore: cast_nullable_to_non_nullable
as List<NewsItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyNewsResponseDto].
extension DailyNewsResponseDtoPatterns on DailyNewsResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyNewsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyNewsResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyNewsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _DailyNewsResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyNewsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _DailyNewsResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NewsItemDto> news)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyNewsResponseDto() when $default != null:
return $default(_that.news);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NewsItemDto> news)  $default,) {final _that = this;
switch (_that) {
case _DailyNewsResponseDto():
return $default(_that.news);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NewsItemDto> news)?  $default,) {final _that = this;
switch (_that) {
case _DailyNewsResponseDto() when $default != null:
return $default(_that.news);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyNewsResponseDto implements DailyNewsResponseDto {
  const _DailyNewsResponseDto({ List<NewsItemDto> news = const <NewsItemDto>[]}): _news = news;
  factory _DailyNewsResponseDto.fromJson(Map<String, dynamic> json) => _$DailyNewsResponseDtoFromJson(json);

 final  List<NewsItemDto> _news;
@override@JsonKey() List<NewsItemDto> get news {
  if (_news is EqualUnmodifiableListView) return _news;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_news);
}


/// Create a copy of DailyNewsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyNewsResponseDtoCopyWith<_DailyNewsResponseDto> get copyWith => __$DailyNewsResponseDtoCopyWithImpl<_DailyNewsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyNewsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyNewsResponseDto&&const DeepCollectionEquality().equals(other.news, _news));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_news));
}

@override
String toString() {
    return 'DailyNewsResponseDto(news: $news)';
}


}

/// @nodoc
abstract mixin class _$DailyNewsResponseDtoCopyWith<$Res> implements $DailyNewsResponseDtoCopyWith<$Res> {
  factory _$DailyNewsResponseDtoCopyWith(_DailyNewsResponseDto value, $Res Function(_DailyNewsResponseDto) _then) = __$DailyNewsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<NewsItemDto> news
});




}
/// @nodoc
class __$DailyNewsResponseDtoCopyWithImpl<$Res>
    implements _$DailyNewsResponseDtoCopyWith<$Res> {
  __$DailyNewsResponseDtoCopyWithImpl(this._self, this._then);

  final _DailyNewsResponseDto _self;
  final $Res Function(_DailyNewsResponseDto) _then;

/// Create a copy of DailyNewsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? news = null,}) {
  return _then(_DailyNewsResponseDto(
news: null == news ? _self._news : news // ignore: cast_nullable_to_non_nullable
as List<NewsItemDto>,
  ));
}


}


/// @nodoc
mixin _$NewsItemDto {

 String get id; String get title; String get summary; bool get impactOnPortfolio; double? get portfolioImpactPercent; DateTime get publishedAt; List<String> get tags;
/// Create a copy of NewsItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsItemDtoCopyWith<NewsItemDto> get copyWith => _$NewsItemDtoCopyWithImpl<NewsItemDto>(this as NewsItemDto, _$identity);

  /// Serializes this NewsItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NewsItemDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsItemDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&(identical(other.impactOnPortfolio, _this.impactOnPortfolio) || other.impactOnPortfolio == _this.impactOnPortfolio)&&(identical(other.portfolioImpactPercent, _this.portfolioImpactPercent) || other.portfolioImpactPercent == _this.portfolioImpactPercent)&&(identical(other.publishedAt, _this.publishedAt) || other.publishedAt == _this.publishedAt)&&const DeepCollectionEquality().equals(other.tags, _this.tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NewsItemDto;
  return Object.hash(runtimeType,_this.id,_this.title,_this.summary,_this.impactOnPortfolio,_this.portfolioImpactPercent,_this.publishedAt,const DeepCollectionEquality().hash(_this.tags));
}

@override
String toString() {
  final _this = this as NewsItemDto;
  return 'NewsItemDto(id: ${_this.id}, title: ${_this.title}, summary: ${_this.summary}, impactOnPortfolio: ${_this.impactOnPortfolio}, portfolioImpactPercent: ${_this.portfolioImpactPercent}, publishedAt: ${_this.publishedAt}, tags: ${_this.tags})';
}


}

/// @nodoc
abstract mixin class $NewsItemDtoCopyWith<$Res>  {
  factory $NewsItemDtoCopyWith(NewsItemDto value, $Res Function(NewsItemDto) _then) = _$NewsItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String summary, bool impactOnPortfolio, double? portfolioImpactPercent, DateTime publishedAt, List<String> tags
});




}
/// @nodoc
class _$NewsItemDtoCopyWithImpl<$Res>
    implements $NewsItemDtoCopyWith<$Res> {
  _$NewsItemDtoCopyWithImpl(this._self, this._then);

  final NewsItemDto _self;
  final $Res Function(NewsItemDto) _then;

/// Create a copy of NewsItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? impactOnPortfolio = null,Object? portfolioImpactPercent = freezed,Object? publishedAt = null,Object? tags = null,}) {
  return _then(NewsItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,impactOnPortfolio: null == impactOnPortfolio ? _self.impactOnPortfolio : impactOnPortfolio // ignore: cast_nullable_to_non_nullable
as bool,portfolioImpactPercent: freezed == portfolioImpactPercent ? _self.portfolioImpactPercent : portfolioImpactPercent // ignore: cast_nullable_to_non_nullable
as double?,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsItemDto].
extension NewsItemDtoPatterns on NewsItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsItemDto value)  $default,){
final _that = this;
switch (_that) {
case _NewsItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _NewsItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  bool impactOnPortfolio,  double? portfolioImpactPercent,  DateTime publishedAt,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsItemDto() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.impactOnPortfolio,_that.portfolioImpactPercent,_that.publishedAt,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  bool impactOnPortfolio,  double? portfolioImpactPercent,  DateTime publishedAt,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _NewsItemDto():
return $default(_that.id,_that.title,_that.summary,_that.impactOnPortfolio,_that.portfolioImpactPercent,_that.publishedAt,_that.tags);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String summary,  bool impactOnPortfolio,  double? portfolioImpactPercent,  DateTime publishedAt,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _NewsItemDto() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.impactOnPortfolio,_that.portfolioImpactPercent,_that.publishedAt,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsItemDto implements NewsItemDto {
  const _NewsItemDto({required this.id, required this.title, required this.summary, this.impactOnPortfolio = false, this.portfolioImpactPercent, required this.publishedAt,  List<String> tags = const <String>[]}): _tags = tags;
  factory _NewsItemDto.fromJson(Map<String, dynamic> json) => _$NewsItemDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String summary;
@override@JsonKey() final  bool impactOnPortfolio;
@override final  double? portfolioImpactPercent;
@override final  DateTime publishedAt;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of NewsItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsItemDtoCopyWith<_NewsItemDto> get copyWith => __$NewsItemDtoCopyWithImpl<_NewsItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.impactOnPortfolio, impactOnPortfolio) || other.impactOnPortfolio == impactOnPortfolio)&&(identical(other.portfolioImpactPercent, portfolioImpactPercent) || other.portfolioImpactPercent == portfolioImpactPercent)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&const DeepCollectionEquality().equals(other.tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,summary,impactOnPortfolio,portfolioImpactPercent,publishedAt,const DeepCollectionEquality().hash(_tags));
}

@override
String toString() {
    return 'NewsItemDto(id: $id, title: $title, summary: $summary, impactOnPortfolio: $impactOnPortfolio, portfolioImpactPercent: $portfolioImpactPercent, publishedAt: $publishedAt, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$NewsItemDtoCopyWith<$Res> implements $NewsItemDtoCopyWith<$Res> {
  factory _$NewsItemDtoCopyWith(_NewsItemDto value, $Res Function(_NewsItemDto) _then) = __$NewsItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String summary, bool impactOnPortfolio, double? portfolioImpactPercent, DateTime publishedAt, List<String> tags
});




}
/// @nodoc
class __$NewsItemDtoCopyWithImpl<$Res>
    implements _$NewsItemDtoCopyWith<$Res> {
  __$NewsItemDtoCopyWithImpl(this._self, this._then);

  final _NewsItemDto _self;
  final $Res Function(_NewsItemDto) _then;

/// Create a copy of NewsItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? impactOnPortfolio = null,Object? portfolioImpactPercent = freezed,Object? publishedAt = null,Object? tags = null,}) {
  return _then(_NewsItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,impactOnPortfolio: null == impactOnPortfolio ? _self.impactOnPortfolio : impactOnPortfolio // ignore: cast_nullable_to_non_nullable
as bool,portfolioImpactPercent: freezed == portfolioImpactPercent ? _self.portfolioImpactPercent : portfolioImpactPercent // ignore: cast_nullable_to_non_nullable
as double?,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
