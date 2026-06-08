// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annoucement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnoucementModel _$AnnoucementModelFromJson(Map<String, dynamic> json) =>
    _AnnoucementModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      embeddedURL: json['embedded_url'] as String?,
      isPublished: json['is_published'] as bool,
      sequence: (json['sequence'] as num).toInt(),
    );

Map<String, dynamic> _$AnnoucementModelToJson(_AnnoucementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'embedded_url': instance.embeddedURL,
      'is_published': instance.isPublished,
      'sequence': instance.sequence,
    };
