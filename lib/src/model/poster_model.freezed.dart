// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poster_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PosterModel {

 String get id; String get title;@JsonKey(name: 'is_published') bool get isPublished;@JsonKey(name: 'poster_media') PosterMediaModel get posterMedia;
/// Create a copy of PosterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosterModelCopyWith<PosterModel> get copyWith => _$PosterModelCopyWithImpl<PosterModel>(this as PosterModel, _$identity);

  /// Serializes this PosterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.posterMedia, posterMedia) || other.posterMedia == posterMedia));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isPublished,posterMedia);

@override
String toString() {
  return 'PosterModel(id: $id, title: $title, isPublished: $isPublished, posterMedia: $posterMedia)';
}


}

/// @nodoc
abstract mixin class $PosterModelCopyWith<$Res>  {
  factory $PosterModelCopyWith(PosterModel value, $Res Function(PosterModel) _then) = _$PosterModelCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'is_published') bool isPublished,@JsonKey(name: 'poster_media') PosterMediaModel posterMedia
});


$PosterMediaModelCopyWith<$Res> get posterMedia;

}
/// @nodoc
class _$PosterModelCopyWithImpl<$Res>
    implements $PosterModelCopyWith<$Res> {
  _$PosterModelCopyWithImpl(this._self, this._then);

  final PosterModel _self;
  final $Res Function(PosterModel) _then;

/// Create a copy of PosterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isPublished = null,Object? posterMedia = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,posterMedia: null == posterMedia ? _self.posterMedia : posterMedia // ignore: cast_nullable_to_non_nullable
as PosterMediaModel,
  ));
}
/// Create a copy of PosterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PosterMediaModelCopyWith<$Res> get posterMedia {
  
  return $PosterMediaModelCopyWith<$Res>(_self.posterMedia, (value) {
    return _then(_self.copyWith(posterMedia: value));
  });
}
}


/// Adds pattern-matching-related methods to [PosterModel].
extension PosterModelPatterns on PosterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PosterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PosterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PosterModel value)  $default,){
final _that = this;
switch (_that) {
case _PosterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PosterModel value)?  $default,){
final _that = this;
switch (_that) {
case _PosterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'is_published')  bool isPublished, @JsonKey(name: 'poster_media')  PosterMediaModel posterMedia)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosterModel() when $default != null:
return $default(_that.id,_that.title,_that.isPublished,_that.posterMedia);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'is_published')  bool isPublished, @JsonKey(name: 'poster_media')  PosterMediaModel posterMedia)  $default,) {final _that = this;
switch (_that) {
case _PosterModel():
return $default(_that.id,_that.title,_that.isPublished,_that.posterMedia);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'is_published')  bool isPublished, @JsonKey(name: 'poster_media')  PosterMediaModel posterMedia)?  $default,) {final _that = this;
switch (_that) {
case _PosterModel() when $default != null:
return $default(_that.id,_that.title,_that.isPublished,_that.posterMedia);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PosterModel implements PosterModel {
   _PosterModel({required this.id, required this.title, @JsonKey(name: 'is_published') required this.isPublished, @JsonKey(name: 'poster_media') required this.posterMedia});
  factory _PosterModel.fromJson(Map<String, dynamic> json) => _$PosterModelFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'is_published') final  bool isPublished;
@override@JsonKey(name: 'poster_media') final  PosterMediaModel posterMedia;

/// Create a copy of PosterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PosterModelCopyWith<_PosterModel> get copyWith => __$PosterModelCopyWithImpl<_PosterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PosterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.posterMedia, posterMedia) || other.posterMedia == posterMedia));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isPublished,posterMedia);

@override
String toString() {
  return 'PosterModel(id: $id, title: $title, isPublished: $isPublished, posterMedia: $posterMedia)';
}


}

/// @nodoc
abstract mixin class _$PosterModelCopyWith<$Res> implements $PosterModelCopyWith<$Res> {
  factory _$PosterModelCopyWith(_PosterModel value, $Res Function(_PosterModel) _then) = __$PosterModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'is_published') bool isPublished,@JsonKey(name: 'poster_media') PosterMediaModel posterMedia
});


@override $PosterMediaModelCopyWith<$Res> get posterMedia;

}
/// @nodoc
class __$PosterModelCopyWithImpl<$Res>
    implements _$PosterModelCopyWith<$Res> {
  __$PosterModelCopyWithImpl(this._self, this._then);

  final _PosterModel _self;
  final $Res Function(_PosterModel) _then;

/// Create a copy of PosterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isPublished = null,Object? posterMedia = null,}) {
  return _then(_PosterModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,posterMedia: null == posterMedia ? _self.posterMedia : posterMedia // ignore: cast_nullable_to_non_nullable
as PosterMediaModel,
  ));
}

/// Create a copy of PosterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PosterMediaModelCopyWith<$Res> get posterMedia {
  
  return $PosterMediaModelCopyWith<$Res>(_self.posterMedia, (value) {
    return _then(_self.copyWith(posterMedia: value));
  });
}
}

// dart format on
