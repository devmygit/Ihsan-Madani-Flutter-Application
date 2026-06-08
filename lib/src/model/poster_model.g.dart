// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poster_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PosterModel _$PosterModelFromJson(Map<String, dynamic> json) => _PosterModel(
  id: json['id'] as String,
  title: json['title'] as String,
  isPublished: json['is_published'] as bool,
  posterMedia: PosterMediaModel.fromJson(
    json['poster_media'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PosterModelToJson(_PosterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_published': instance.isPublished,
      'poster_media': instance.posterMedia,
    };
