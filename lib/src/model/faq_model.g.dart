// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaqModel _$FaqModelFromJson(Map<String, dynamic> json) => _FaqModel(
  id: json['id'] as String,
  uuid: json['uuid'] as String,
  title: json['title'] as String,
  body: json['body'] as String,
  bodyProcessed: json['body_processed'] as String?,
  bodySummary: json['body_summary'] as String?,
  description: json['description'] as String?,
  publishDate: json['publish_date'] as String?,
  isPublished: json['is_published'] as bool?,
  sequence: (json['sequence'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  created: json['created'] as String?,
  changed: json['changed'] as String?,
  langcode: json['langcode'] as String?,
);

Map<String, dynamic> _$FaqModelToJson(_FaqModel instance) => <String, dynamic>{
  'id': instance.id,
  'uuid': instance.uuid,
  'title': instance.title,
  'body': instance.body,
  'body_processed': instance.bodyProcessed,
  'body_summary': instance.bodySummary,
  'description': instance.description,
  'publish_date': instance.publishDate,
  'is_published': instance.isPublished,
  'sequence': instance.sequence,
  'created_at': instance.createdAt,
  'created': instance.created,
  'changed': instance.changed,
  'langcode': instance.langcode,
};
