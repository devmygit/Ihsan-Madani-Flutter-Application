// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState {

 HomeStatus get status; String get errorMessage; Pagination<AnnoucementModel> get annoucement; Pagination<BannerModel> get banner; Pagination<PosterModel> get poster; Pagination<InitiativeModel> get popularSearches; Pagination<InfographicModel> get infographics; int get initPageCarousel; String get visitorId;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);

  /// Serializes this HomeState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.annoucement, annoucement) || other.annoucement == annoucement)&&(identical(other.banner, banner) || other.banner == banner)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.popularSearches, popularSearches) || other.popularSearches == popularSearches)&&(identical(other.infographics, infographics) || other.infographics == infographics)&&(identical(other.initPageCarousel, initPageCarousel) || other.initPageCarousel == initPageCarousel)&&(identical(other.visitorId, visitorId) || other.visitorId == visitorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,annoucement,banner,poster,popularSearches,infographics,initPageCarousel,visitorId);

@override
String toString() {
  return 'HomeState(status: $status, errorMessage: $errorMessage, annoucement: $annoucement, banner: $banner, poster: $poster, popularSearches: $popularSearches, infographics: $infographics, initPageCarousel: $initPageCarousel, visitorId: $visitorId)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 HomeStatus status, String errorMessage, Pagination<AnnoucementModel> annoucement, Pagination<BannerModel> banner, Pagination<PosterModel> poster, Pagination<InitiativeModel> popularSearches, Pagination<InfographicModel> infographics, int initPageCarousel, String visitorId
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = null,Object? annoucement = null,Object? banner = null,Object? poster = null,Object? popularSearches = null,Object? infographics = null,Object? initPageCarousel = null,Object? visitorId = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,annoucement: null == annoucement ? _self.annoucement : annoucement // ignore: cast_nullable_to_non_nullable
as Pagination<AnnoucementModel>,banner: null == banner ? _self.banner : banner // ignore: cast_nullable_to_non_nullable
as Pagination<BannerModel>,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as Pagination<PosterModel>,popularSearches: null == popularSearches ? _self.popularSearches : popularSearches // ignore: cast_nullable_to_non_nullable
as Pagination<InitiativeModel>,infographics: null == infographics ? _self.infographics : infographics // ignore: cast_nullable_to_non_nullable
as Pagination<InfographicModel>,initPageCarousel: null == initPageCarousel ? _self.initPageCarousel : initPageCarousel // ignore: cast_nullable_to_non_nullable
as int,visitorId: null == visitorId ? _self.visitorId : visitorId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeStatus status,  String errorMessage,  Pagination<AnnoucementModel> annoucement,  Pagination<BannerModel> banner,  Pagination<PosterModel> poster,  Pagination<InitiativeModel> popularSearches,  Pagination<InfographicModel> infographics,  int initPageCarousel,  String visitorId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.annoucement,_that.banner,_that.poster,_that.popularSearches,_that.infographics,_that.initPageCarousel,_that.visitorId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeStatus status,  String errorMessage,  Pagination<AnnoucementModel> annoucement,  Pagination<BannerModel> banner,  Pagination<PosterModel> poster,  Pagination<InitiativeModel> popularSearches,  Pagination<InfographicModel> infographics,  int initPageCarousel,  String visitorId)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.status,_that.errorMessage,_that.annoucement,_that.banner,_that.poster,_that.popularSearches,_that.infographics,_that.initPageCarousel,_that.visitorId);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeStatus status,  String errorMessage,  Pagination<AnnoucementModel> annoucement,  Pagination<BannerModel> banner,  Pagination<PosterModel> poster,  Pagination<InitiativeModel> popularSearches,  Pagination<InfographicModel> infographics,  int initPageCarousel,  String visitorId)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.annoucement,_that.banner,_that.poster,_that.popularSearches,_that.infographics,_that.initPageCarousel,_that.visitorId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeState extends HomeState {
   _HomeState({required this.status, required this.errorMessage, required this.annoucement, required this.banner, required this.poster, required this.popularSearches, required this.infographics, required this.initPageCarousel, required this.visitorId}): super._();
  factory _HomeState.fromJson(Map<String, dynamic> json) => _$HomeStateFromJson(json);

@override final  HomeStatus status;
@override final  String errorMessage;
@override final  Pagination<AnnoucementModel> annoucement;
@override final  Pagination<BannerModel> banner;
@override final  Pagination<PosterModel> poster;
@override final  Pagination<InitiativeModel> popularSearches;
@override final  Pagination<InfographicModel> infographics;
@override final  int initPageCarousel;
@override final  String visitorId;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.annoucement, annoucement) || other.annoucement == annoucement)&&(identical(other.banner, banner) || other.banner == banner)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.popularSearches, popularSearches) || other.popularSearches == popularSearches)&&(identical(other.infographics, infographics) || other.infographics == infographics)&&(identical(other.initPageCarousel, initPageCarousel) || other.initPageCarousel == initPageCarousel)&&(identical(other.visitorId, visitorId) || other.visitorId == visitorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,annoucement,banner,poster,popularSearches,infographics,initPageCarousel,visitorId);

@override
String toString() {
  return 'HomeState(status: $status, errorMessage: $errorMessage, annoucement: $annoucement, banner: $banner, poster: $poster, popularSearches: $popularSearches, infographics: $infographics, initPageCarousel: $initPageCarousel, visitorId: $visitorId)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 HomeStatus status, String errorMessage, Pagination<AnnoucementModel> annoucement, Pagination<BannerModel> banner, Pagination<PosterModel> poster, Pagination<InitiativeModel> popularSearches, Pagination<InfographicModel> infographics, int initPageCarousel, String visitorId
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = null,Object? annoucement = null,Object? banner = null,Object? poster = null,Object? popularSearches = null,Object? infographics = null,Object? initPageCarousel = null,Object? visitorId = null,}) {
  return _then(_HomeState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,annoucement: null == annoucement ? _self.annoucement : annoucement // ignore: cast_nullable_to_non_nullable
as Pagination<AnnoucementModel>,banner: null == banner ? _self.banner : banner // ignore: cast_nullable_to_non_nullable
as Pagination<BannerModel>,poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as Pagination<PosterModel>,popularSearches: null == popularSearches ? _self.popularSearches : popularSearches // ignore: cast_nullable_to_non_nullable
as Pagination<InitiativeModel>,infographics: null == infographics ? _self.infographics : infographics // ignore: cast_nullable_to_non_nullable
as Pagination<InfographicModel>,initPageCarousel: null == initPageCarousel ? _self.initPageCarousel : initPageCarousel // ignore: cast_nullable_to_non_nullable
as int,visitorId: null == visitorId ? _self.visitorId : visitorId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
