// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poster_media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PosterMediaModel {

 String get id; String? get fileable;@JsonKey(name: 'file_name') String? get fileName;@JsonKey(name: 'file_path') String? get filePath;@JsonKey(name: 'file_size') int? get fileSize;@JsonKey(name: 'file_extension') String? get fileExtension;@JsonKey(name: 'file_mime') String? get fileMime; String? get mode;@JsonKey(name: 'fileable_type') String? get fileableType;@JsonKey(name: 'fileable_id') String? get fileableId;@JsonKey(name: 'deleted_at') String? get deletedAt;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'file_url') String? get fileUrl;
/// Create a copy of PosterMediaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosterMediaModelCopyWith<PosterMediaModel> get copyWith => _$PosterMediaModelCopyWithImpl<PosterMediaModel>(this as PosterMediaModel, _$identity);

  /// Serializes this PosterMediaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosterMediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fileable, fileable) || other.fileable == fileable)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.fileExtension, fileExtension) || other.fileExtension == fileExtension)&&(identical(other.fileMime, fileMime) || other.fileMime == fileMime)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.fileableType, fileableType) || other.fileableType == fileableType)&&(identical(other.fileableId, fileableId) || other.fileableId == fileableId)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileable,fileName,filePath,fileSize,fileExtension,fileMime,mode,fileableType,fileableId,deletedAt,createdAt,updatedAt,fileUrl);

@override
String toString() {
  return 'PosterMediaModel(id: $id, fileable: $fileable, fileName: $fileName, filePath: $filePath, fileSize: $fileSize, fileExtension: $fileExtension, fileMime: $fileMime, mode: $mode, fileableType: $fileableType, fileableId: $fileableId, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, fileUrl: $fileUrl)';
}


}

/// @nodoc
abstract mixin class $PosterMediaModelCopyWith<$Res>  {
  factory $PosterMediaModelCopyWith(PosterMediaModel value, $Res Function(PosterMediaModel) _then) = _$PosterMediaModelCopyWithImpl;
@useResult
$Res call({
 String id, String? fileable,@JsonKey(name: 'file_name') String? fileName,@JsonKey(name: 'file_path') String? filePath,@JsonKey(name: 'file_size') int? fileSize,@JsonKey(name: 'file_extension') String? fileExtension,@JsonKey(name: 'file_mime') String? fileMime, String? mode,@JsonKey(name: 'fileable_type') String? fileableType,@JsonKey(name: 'fileable_id') String? fileableId,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'file_url') String? fileUrl
});




}
/// @nodoc
class _$PosterMediaModelCopyWithImpl<$Res>
    implements $PosterMediaModelCopyWith<$Res> {
  _$PosterMediaModelCopyWithImpl(this._self, this._then);

  final PosterMediaModel _self;
  final $Res Function(PosterMediaModel) _then;

/// Create a copy of PosterMediaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fileable = freezed,Object? fileName = freezed,Object? filePath = freezed,Object? fileSize = freezed,Object? fileExtension = freezed,Object? fileMime = freezed,Object? mode = freezed,Object? fileableType = freezed,Object? fileableId = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? fileUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileable: freezed == fileable ? _self.fileable : fileable // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int?,fileExtension: freezed == fileExtension ? _self.fileExtension : fileExtension // ignore: cast_nullable_to_non_nullable
as String?,fileMime: freezed == fileMime ? _self.fileMime : fileMime // ignore: cast_nullable_to_non_nullable
as String?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,fileableType: freezed == fileableType ? _self.fileableType : fileableType // ignore: cast_nullable_to_non_nullable
as String?,fileableId: freezed == fileableId ? _self.fileableId : fileableId // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PosterMediaModel].
extension PosterMediaModelPatterns on PosterMediaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PosterMediaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PosterMediaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PosterMediaModel value)  $default,){
final _that = this;
switch (_that) {
case _PosterMediaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PosterMediaModel value)?  $default,){
final _that = this;
switch (_that) {
case _PosterMediaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? fileable, @JsonKey(name: 'file_name')  String? fileName, @JsonKey(name: 'file_path')  String? filePath, @JsonKey(name: 'file_size')  int? fileSize, @JsonKey(name: 'file_extension')  String? fileExtension, @JsonKey(name: 'file_mime')  String? fileMime,  String? mode, @JsonKey(name: 'fileable_type')  String? fileableType, @JsonKey(name: 'fileable_id')  String? fileableId, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'file_url')  String? fileUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosterMediaModel() when $default != null:
return $default(_that.id,_that.fileable,_that.fileName,_that.filePath,_that.fileSize,_that.fileExtension,_that.fileMime,_that.mode,_that.fileableType,_that.fileableId,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.fileUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? fileable, @JsonKey(name: 'file_name')  String? fileName, @JsonKey(name: 'file_path')  String? filePath, @JsonKey(name: 'file_size')  int? fileSize, @JsonKey(name: 'file_extension')  String? fileExtension, @JsonKey(name: 'file_mime')  String? fileMime,  String? mode, @JsonKey(name: 'fileable_type')  String? fileableType, @JsonKey(name: 'fileable_id')  String? fileableId, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'file_url')  String? fileUrl)  $default,) {final _that = this;
switch (_that) {
case _PosterMediaModel():
return $default(_that.id,_that.fileable,_that.fileName,_that.filePath,_that.fileSize,_that.fileExtension,_that.fileMime,_that.mode,_that.fileableType,_that.fileableId,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.fileUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? fileable, @JsonKey(name: 'file_name')  String? fileName, @JsonKey(name: 'file_path')  String? filePath, @JsonKey(name: 'file_size')  int? fileSize, @JsonKey(name: 'file_extension')  String? fileExtension, @JsonKey(name: 'file_mime')  String? fileMime,  String? mode, @JsonKey(name: 'fileable_type')  String? fileableType, @JsonKey(name: 'fileable_id')  String? fileableId, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'file_url')  String? fileUrl)?  $default,) {final _that = this;
switch (_that) {
case _PosterMediaModel() when $default != null:
return $default(_that.id,_that.fileable,_that.fileName,_that.filePath,_that.fileSize,_that.fileExtension,_that.fileMime,_that.mode,_that.fileableType,_that.fileableId,_that.deletedAt,_that.createdAt,_that.updatedAt,_that.fileUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PosterMediaModel implements PosterMediaModel {
   _PosterMediaModel({required this.id, required this.fileable, @JsonKey(name: 'file_name') required this.fileName, @JsonKey(name: 'file_path') required this.filePath, @JsonKey(name: 'file_size') required this.fileSize, @JsonKey(name: 'file_extension') required this.fileExtension, @JsonKey(name: 'file_mime') required this.fileMime, required this.mode, @JsonKey(name: 'fileable_type') required this.fileableType, @JsonKey(name: 'fileable_id') required this.fileableId, @JsonKey(name: 'deleted_at') required this.deletedAt, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'file_url') required this.fileUrl});
  factory _PosterMediaModel.fromJson(Map<String, dynamic> json) => _$PosterMediaModelFromJson(json);

@override final  String id;
@override final  String? fileable;
@override@JsonKey(name: 'file_name') final  String? fileName;
@override@JsonKey(name: 'file_path') final  String? filePath;
@override@JsonKey(name: 'file_size') final  int? fileSize;
@override@JsonKey(name: 'file_extension') final  String? fileExtension;
@override@JsonKey(name: 'file_mime') final  String? fileMime;
@override final  String? mode;
@override@JsonKey(name: 'fileable_type') final  String? fileableType;
@override@JsonKey(name: 'fileable_id') final  String? fileableId;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'file_url') final  String? fileUrl;

/// Create a copy of PosterMediaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PosterMediaModelCopyWith<_PosterMediaModel> get copyWith => __$PosterMediaModelCopyWithImpl<_PosterMediaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PosterMediaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosterMediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fileable, fileable) || other.fileable == fileable)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.fileExtension, fileExtension) || other.fileExtension == fileExtension)&&(identical(other.fileMime, fileMime) || other.fileMime == fileMime)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.fileableType, fileableType) || other.fileableType == fileableType)&&(identical(other.fileableId, fileableId) || other.fileableId == fileableId)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fileable,fileName,filePath,fileSize,fileExtension,fileMime,mode,fileableType,fileableId,deletedAt,createdAt,updatedAt,fileUrl);

@override
String toString() {
  return 'PosterMediaModel(id: $id, fileable: $fileable, fileName: $fileName, filePath: $filePath, fileSize: $fileSize, fileExtension: $fileExtension, fileMime: $fileMime, mode: $mode, fileableType: $fileableType, fileableId: $fileableId, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, fileUrl: $fileUrl)';
}


}

/// @nodoc
abstract mixin class _$PosterMediaModelCopyWith<$Res> implements $PosterMediaModelCopyWith<$Res> {
  factory _$PosterMediaModelCopyWith(_PosterMediaModel value, $Res Function(_PosterMediaModel) _then) = __$PosterMediaModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? fileable,@JsonKey(name: 'file_name') String? fileName,@JsonKey(name: 'file_path') String? filePath,@JsonKey(name: 'file_size') int? fileSize,@JsonKey(name: 'file_extension') String? fileExtension,@JsonKey(name: 'file_mime') String? fileMime, String? mode,@JsonKey(name: 'fileable_type') String? fileableType,@JsonKey(name: 'fileable_id') String? fileableId,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'file_url') String? fileUrl
});




}
/// @nodoc
class __$PosterMediaModelCopyWithImpl<$Res>
    implements _$PosterMediaModelCopyWith<$Res> {
  __$PosterMediaModelCopyWithImpl(this._self, this._then);

  final _PosterMediaModel _self;
  final $Res Function(_PosterMediaModel) _then;

/// Create a copy of PosterMediaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fileable = freezed,Object? fileName = freezed,Object? filePath = freezed,Object? fileSize = freezed,Object? fileExtension = freezed,Object? fileMime = freezed,Object? mode = freezed,Object? fileableType = freezed,Object? fileableId = freezed,Object? deletedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? fileUrl = freezed,}) {
  return _then(_PosterMediaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fileable: freezed == fileable ? _self.fileable : fileable // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int?,fileExtension: freezed == fileExtension ? _self.fileExtension : fileExtension // ignore: cast_nullable_to_non_nullable
as String?,fileMime: freezed == fileMime ? _self.fileMime : fileMime // ignore: cast_nullable_to_non_nullable
as String?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String?,fileableType: freezed == fileableType ? _self.fileableType : fileableType // ignore: cast_nullable_to_non_nullable
as String?,fileableId: freezed == fileableId ? _self.fileableId : fileableId // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
