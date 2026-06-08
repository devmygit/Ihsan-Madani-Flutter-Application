// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => _MediaModel(
  id: json['id'] as String,
  fileable: json['fileable'] as String,
  fileName: json['file_name'] as String,
  fileSize: (json['file_size'] as num?)?.toInt(),
  fileExtension: json['file_extension'] as String,
  fileMime: json['file_mime'] as String,
  fileUrl: json['file_url'] as String,
);

Map<String, dynamic> _$MediaModelToJson(_MediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileable': instance.fileable,
      'file_name': instance.fileName,
      'file_size': instance.fileSize,
      'file_extension': instance.fileExtension,
      'file_mime': instance.fileMime,
      'file_url': instance.fileUrl,
    };
