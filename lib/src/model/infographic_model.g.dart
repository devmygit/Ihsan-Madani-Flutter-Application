// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infographic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfographicModel _$InfographicModelFromJson(Map<String, dynamic> json) =>
    _InfographicModel(
      id: json['id'] as String,
      title: json['title'] as String,
      publishDate: json['publish_date'] as String,
      isPublished: json['is_published'] as bool,
      sequence: (json['sequence'] as num).toInt(),
      createdAt: json['created_at'] as String,
      media: _parseMedia(json['media']),
    );

Map<String, dynamic> _$InfographicModelToJson(_InfographicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'publish_date': instance.publishDate,
      'is_published': instance.isPublished,
      'sequence': instance.sequence,
      'created_at': instance.createdAt,
      'media': instance.media,
    };
