// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => _BannerModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  publisDate: json['publish_date'] as String,
  isPublished: json['is_published'] as bool,
  sequence: (json['sequence'] as num).toInt(),
  media: _parseMedia(json['media']),
  logo: _parseMedia(json['logo']),
  createdAt: json['created_at'] as String,
  buttonName: json['button_name'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$BannerModelToJson(_BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'publish_date': instance.publisDate,
      'is_published': instance.isPublished,
      'sequence': instance.sequence,
      'media': instance.media,
      'logo': instance.logo,
      'created_at': instance.createdAt,
      'button_name': instance.buttonName,
      'url': instance.url,
    };
