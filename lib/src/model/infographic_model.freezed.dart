// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'infographic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfographicModel {

 String get id; String get title;@JsonKey(name: 'publish_date') String get publishDate;@JsonKey(name: 'is_published') bool get isPublished; int get sequence;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(fromJson: _parseMedia) MediaModel? get media;
/// Create a copy of InfographicModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfographicModelCopyWith<InfographicModel> get copyWith => _$InfographicModelCopyWithImpl<InfographicModel>(this as InfographicModel, _$identity);

  /// Serializes this InfographicModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfographicModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.media, media) || other.media == media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,publishDate,isPublished,sequence,createdAt,media);

@override
String toString() {
  return 'InfographicModel(id: $id, title: $title, publishDate: $publishDate, isPublished: $isPublished, sequence: $sequence, createdAt: $createdAt, media: $media)';
}


}

/// @nodoc
abstract mixin class $InfographicModelCopyWith<$Res>  {
  factory $InfographicModelCopyWith(InfographicModel value, $Res Function(InfographicModel) _then) = _$InfographicModelCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'publish_date') String publishDate,@JsonKey(name: 'is_published') bool isPublished, int sequence,@JsonKey(name: 'created_at') String createdAt,@JsonKey(fromJson: _parseMedia) MediaModel? media
});


$MediaModelCopyWith<$Res>? get media;

}
/// @nodoc
class _$InfographicModelCopyWithImpl<$Res>
    implements $InfographicModelCopyWith<$Res> {
  _$InfographicModelCopyWithImpl(this._self, this._then);

  final InfographicModel _self;
  final $Res Function(InfographicModel) _then;

/// Create a copy of InfographicModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? publishDate = null,Object? isPublished = null,Object? sequence = null,Object? createdAt = null,Object? media = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,publishDate: null == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as MediaModel?,
  ));
}
/// Create a copy of InfographicModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaModelCopyWith<$Res>? get media {
    if (_self.media == null) {
    return null;
  }

  return $MediaModelCopyWith<$Res>(_self.media!, (value) {
    return _then(_self.copyWith(media: value));
  });
}
}


/// Adds pattern-matching-related methods to [InfographicModel].
extension InfographicModelPatterns on InfographicModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfographicModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfographicModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfographicModel value)  $default,){
final _that = this;
switch (_that) {
case _InfographicModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfographicModel value)?  $default,){
final _that = this;
switch (_that) {
case _InfographicModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'publish_date')  String publishDate, @JsonKey(name: 'is_published')  bool isPublished,  int sequence, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(fromJson: _parseMedia)  MediaModel? media)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfographicModel() when $default != null:
return $default(_that.id,_that.title,_that.publishDate,_that.isPublished,_that.sequence,_that.createdAt,_that.media);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'publish_date')  String publishDate, @JsonKey(name: 'is_published')  bool isPublished,  int sequence, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(fromJson: _parseMedia)  MediaModel? media)  $default,) {final _that = this;
switch (_that) {
case _InfographicModel():
return $default(_that.id,_that.title,_that.publishDate,_that.isPublished,_that.sequence,_that.createdAt,_that.media);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'publish_date')  String publishDate, @JsonKey(name: 'is_published')  bool isPublished,  int sequence, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(fromJson: _parseMedia)  MediaModel? media)?  $default,) {final _that = this;
switch (_that) {
case _InfographicModel() when $default != null:
return $default(_that.id,_that.title,_that.publishDate,_that.isPublished,_that.sequence,_that.createdAt,_that.media);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InfographicModel implements InfographicModel {
  const _InfographicModel({required this.id, required this.title, @JsonKey(name: 'publish_date') required this.publishDate, @JsonKey(name: 'is_published') required this.isPublished, required this.sequence, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(fromJson: _parseMedia) required this.media});
  factory _InfographicModel.fromJson(Map<String, dynamic> json) => _$InfographicModelFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'publish_date') final  String publishDate;
@override@JsonKey(name: 'is_published') final  bool isPublished;
@override final  int sequence;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(fromJson: _parseMedia) final  MediaModel? media;

/// Create a copy of InfographicModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfographicModelCopyWith<_InfographicModel> get copyWith => __$InfographicModelCopyWithImpl<_InfographicModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfographicModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfographicModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.media, media) || other.media == media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,publishDate,isPublished,sequence,createdAt,media);

@override
String toString() {
  return 'InfographicModel(id: $id, title: $title, publishDate: $publishDate, isPublished: $isPublished, sequence: $sequence, createdAt: $createdAt, media: $media)';
}


}

/// @nodoc
abstract mixin class _$InfographicModelCopyWith<$Res> implements $InfographicModelCopyWith<$Res> {
  factory _$InfographicModelCopyWith(_InfographicModel value, $Res Function(_InfographicModel) _then) = __$InfographicModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'publish_date') String publishDate,@JsonKey(name: 'is_published') bool isPublished, int sequence,@JsonKey(name: 'created_at') String createdAt,@JsonKey(fromJson: _parseMedia) MediaModel? media
});


@override $MediaModelCopyWith<$Res>? get media;

}
/// @nodoc
class __$InfographicModelCopyWithImpl<$Res>
    implements _$InfographicModelCopyWith<$Res> {
  __$InfographicModelCopyWithImpl(this._self, this._then);

  final _InfographicModel _self;
  final $Res Function(_InfographicModel) _then;

/// Create a copy of InfographicModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? publishDate = null,Object? isPublished = null,Object? sequence = null,Object? createdAt = null,Object? media = freezed,}) {
  return _then(_InfographicModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,publishDate: null == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as MediaModel?,
  ));
}

/// Create a copy of InfographicModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaModelCopyWith<$Res>? get media {
    if (_self.media == null) {
    return null;
  }

  return $MediaModelCopyWith<$Res>(_self.media!, (value) {
    return _then(_self.copyWith(media: value));
  });
}
}

// dart format on
