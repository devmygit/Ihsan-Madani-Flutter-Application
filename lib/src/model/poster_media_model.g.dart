// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poster_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PosterMediaModel _$PosterMediaModelFromJson(Map<String, dynamic> json) =>
    _PosterMediaModel(
      id: json['id'] as String,
      fileable: json['fileable'] as String?,
      fileName: json['file_name'] as String?,
      filePath: json['file_path'] as String?,
      fileSize: (json['file_size'] as num?)?.toInt(),
      fileExtension: json['file_extension'] as String?,
      fileMime: json['file_mime'] as String?,
      mode: json['mode'] as String?,
      fileableType: json['fileable_type'] as String?,
      fileableId: json['fileable_id'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      fileUrl: json['file_url'] as String?,
    );

Map<String, dynamic> _$PosterMediaModelToJson(_PosterMediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileable': instance.fileable,
      'file_name': instance.fileName,
      'file_path': instance.filePath,
      'file_size': instance.fileSize,
      'file_extension': instance.fileExtension,
      'file_mime': instance.fileMime,
      'mode': instance.mode,
      'fileable_type': instance.fileableType,
      'fileable_id': instance.fileableId,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'file_url': instance.fileUrl,
    };
