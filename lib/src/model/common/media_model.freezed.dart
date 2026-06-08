// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MediaModel {

 String get id; String get fileable;@JsonKey(name: 'file_name') String get fileName;@JsonKey(name: 'file_size') int? get fileSize;@JsonKey(name: 'file_extension') String get fileExtension;@JsonKey(name: 'file_mime') String get fileMime;@JsonKey(name: 'file_url') String get fileUrl;
/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaModelCopyWith<MediaModel> get copyWith => _$MediaModelCopyWithImpl<MediaModel>(this as MediaModel, _$identity);

  /// Serializes this MediaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fileable, fileable) || other.fileable == fileable)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.fileExtension, fileExtension) || other.fileExtension == fileExtension)&&(identical(other.fileMime, fileMime) || other.fileMime == fileMime)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileable,fileName,fileSize,fileExtension,fileMime,fileUrl);

@override
String toString() {
  return 'MediaModel(id: $id, fileable: $fileable, fileName: $fileName, fileSize: $fileSize, fileExtension: $fileExtension, fileMime: $fileMime, fileUrl: $fileUrl)';
}


}

/// @nodoc
abstract mixin class $MediaModelCopyWith<$Res>  {
  factory $MediaModelCopyWith(MediaModel value, $Res Function(MediaModel) _then) = _$MediaModelCopyWithImpl;
@useResult
$Res call({
 String id, String fileable,@JsonKey(name: 'file_name') String fileName,@JsonKey(name: 'file_size') int? fileSize,@JsonKey(name: 'file_extension') String fileExtension,@JsonKey(name: 'file_mime') String fileMime,@JsonKey(name: 'file_url') String fileUrl
});




}
/// @nodoc
class _$MediaModelCopyWithImpl<$Res>
    implements $MediaModelCopyWith<$Res> {
  _$MediaModelCopyWithImpl(this._self, this._then);

  final MediaModel _self;
  final $Res Function(MediaModel) _then;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileable = null,Object? fileName = null,Object? fileSize = freezed,Object? fileExtension = null,Object? fileMime = null,Object? fileUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileable: null == fileable ? _self.fileable : fileable // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int?,fileExtension: null == fileExtension ? _self.fileExtension : fileExtension // ignore: cast_nullable_to_non_nullable
as String,fileMime: null == fileMime ? _self.fileMime : fileMime // ignore: cast_nullable_to_non_nullable
as String,fileUrl: null == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaModel].
extension MediaModelPatterns on MediaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaModel value)  $default,){
final _that = this;
switch (_that) {
case _MediaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaModel value)?  $default,){
final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fileable, @JsonKey(name: 'file_name')  String fileName, @JsonKey(name: 'file_size')  int? fileSize, @JsonKey(name: 'file_extension')  String fileExtension, @JsonKey(name: 'file_mime')  String fileMime, @JsonKey(name: 'file_url')  String fileUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
return $default(_that.id,_that.fileable,_that.fileName,_that.fileSize,_that.fileExtension,_that.fileMime,_that.fileUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fileable, @JsonKey(name: 'file_name')  String fileName, @JsonKey(name: 'file_size')  int? fileSize, @JsonKey(name: 'file_extension')  String fileExtension, @JsonKey(name: 'file_mime')  String fileMime, @JsonKey(name: 'file_url')  String fileUrl)  $default,) {final _that = this;
switch (_that) {
case _MediaModel():
return $default(_that.id,_that.fileable,_that.fileName,_that.fileSize,_that.fileExtension,_that.fileMime,_that.fileUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fileable, @JsonKey(name: 'file_name')  String fileName, @JsonKey(name: 'file_size')  int? fileSize, @JsonKey(name: 'file_extension')  String fileExtension, @JsonKey(name: 'file_mime')  String fileMime, @JsonKey(name: 'file_url')  String fileUrl)?  $default,) {final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
return $default(_that.id,_that.fileable,_that.fileName,_that.fileSize,_that.fileExtension,_that.fileMime,_that.fileUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaModel implements MediaModel {
   _MediaModel({required this.id, required this.fileable, @JsonKey(name: 'file_name') required this.fileName, @JsonKey(name: 'file_size') this.fileSize, @JsonKey(name: 'file_extension') required this.fileExtension, @JsonKey(name: 'file_mime') required this.fileMime, @JsonKey(name: 'file_url') required this.fileUrl});
  factory _MediaModel.fromJson(Map<String, dynamic> json) => _$MediaModelFromJson(json);

@override final  String id;
@override final  String fileable;
@override@JsonKey(name: 'file_name') final  String fileName;
@override@JsonKey(name: 'file_size') final  int? fileSize;
@override@JsonKey(name: 'file_extension') final  String fileExtension;
@override@JsonKey(name: 'file_mime') final  String fileMime;
@override@JsonKey(name: 'file_url') final  String fileUrl;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaModelCopyWith<_MediaModel> get copyWith => __$MediaModelCopyWithImpl<_MediaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fileable, fileable) || other.fileable == fileable)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.fileExtension, fileExtension) || other.fileExtension == fileExtension)&&(identical(other.fileMime, fileMime) || other.fileMime == fileMime)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileable,fileName,fileSize,fileExtension,fileMime,fileUrl);

@override
String toString() {
  return 'MediaModel(id: $id, fileable: $fileable, fileName: $fileName, fileSize: $fileSize, fileExtension: $fileExtension, fileMime: $fileMime, fileUrl: $fileUrl)';
}


}

/// @nodoc
abstract mixin class _$MediaModelCopyWith<$Res> implements $MediaModelCopyWith<$Res> {
  factory _$MediaModelCopyWith(_MediaModel value, $Res Function(_MediaModel) _then) = __$MediaModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String fileable,@JsonKey(name: 'file_name') String fileName,@JsonKey(name: 'file_size') int? fileSize,@JsonKey(name: 'file_extension') String fileExtension,@JsonKey(name: 'file_mime') String fileMime,@JsonKey(name: 'file_url') String fileUrl
});




}
/// @nodoc
class __$MediaModelCopyWithImpl<$Res>
    implements _$MediaModelCopyWith<$Res> {
  __$MediaModelCopyWithImpl(this._self, this._then);

  final _MediaModel _self;
  final $Res Function(_MediaModel) _then;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileable = null,Object? fileName = null,Object? fileSize = freezed,Object? fileExtension = null,Object? fileMime = null,Object? fileUrl = null,}) {
  return _then(_MediaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileable: null == fileable ? _self.fileable : fileable // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int?,fileExtension: null == fileExtension ? _self.fileExtension : fileExtension // ignore: cast_nullable_to_non_nullable
as String,fileMime: null == fileMime ? _self.fileMime : fileMime // ignore: cast_nullable_to_non_nullable
as String,fileUrl: null == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
