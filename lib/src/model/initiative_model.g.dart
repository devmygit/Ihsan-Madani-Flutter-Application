// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiative_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InitiativeModel _$InitiativeModelFromJson(Map<String, dynamic> json) =>
    _InitiativeModel(
      id: json['id'] as String,
      cluster: json['cluster'] as String,
      name: json['name'] as String,
      objectives: json['objectives'] as String?,
      description: json['description'] as String,
      requirements: (json['requirements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      aids: (json['aids'] as List<dynamic>?)?.map((e) => e as String).toList(),
      faqs: json['faqs'] as String?,
      url: json['url'] as String?,
      alternativeUrl: json['alternative_url'] as String?,
      enforceDate: json['enforce_date'] as String?,
      isPublished: json['is_published'] as bool?,
      updatedAt: json['updated_at'] as String,
      agencies: (json['agencies'] as List<dynamic>?)
          ?.map((e) => ClusterRefModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      targetGroups: (json['target_groups'] as List<dynamic>?)
          ?.map((e) => ClusterRefModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      applicationSteps: json['application_steps'] as String?,
      urlButtonName: json['url_button_name'] as String?,
      uuid: json['uuid'] as String?,
      body: json['body'] as String?,
      categorySlug: json['category_slug'] as String?,
      tabKumpulanSasar: json['tab_kumpulan_sasar'] as String?,
      tabSyaratPermohonan: json['tab_syarat_permohonan'] as String?,
      tabKadarBantuan: json['tab_kadar_bantuan'] as String?,
      tabFaq: json['tab_faq'] as String?,
      tabAgensiPelaksana: json['tab_agensi_pelaksana'] as String?,
      fieldPautanTambahan: json['field_pautan_tambahan'] as String?,
      fieldPautanTambahanLabel: json['field_pautan_tambahan_label'] as String?,
      sequence: (json['sequence'] as num?)?.toInt(),
      nid: json['nid'] as String?,
    );

Map<String, dynamic> _$InitiativeModelToJson(_InitiativeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cluster': instance.cluster,
      'name': instance.name,
      'objectives': instance.objectives,
      'description': instance.description,
      'requirements': instance.requirements,
      'aids': instance.aids,
      'faqs': instance.faqs,
      'url': instance.url,
      'alternative_url': instance.alternativeUrl,
      'enforce_date': instance.enforceDate,
      'is_published': instance.isPublished,
      'updated_at': instance.updatedAt,
      'agencies': instance.agencies,
      'target_groups': instance.targetGroups,
      'application_steps': instance.applicationSteps,
      'url_button_name': instance.urlButtonName,
      'uuid': instance.uuid,
      'body': instance.body,
      'category_slug': instance.categorySlug,
      'tab_kumpulan_sasar': instance.tabKumpulanSasar,
      'tab_syarat_permohonan': instance.tabSyaratPermohonan,
      'tab_kadar_bantuan': instance.tabKadarBantuan,
      'tab_faq': instance.tabFaq,
      'tab_agensi_pelaksana': instance.tabAgensiPelaksana,
      'field_pautan_tambahan': instance.fieldPautanTambahan,
      'field_pautan_tambahan_label': instance.fieldPautanTambahanLabel,
      'sequence': instance.sequence,
      'nid': instance.nid,
    };
