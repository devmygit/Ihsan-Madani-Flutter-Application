// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naccol_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NaccolModel _$NaccolModelFromJson(Map<String, dynamic> json) => _NaccolModel(
  id: json['id'] as String,
  tajuk: json['tajuk'] as String,
  kandungan: json['kandungan'] as String,
  kandunganProcessed: json['kandungan_processed'] as String?,
  sequence: (json['sequence'] as num).toInt(),
);

Map<String, dynamic> _$NaccolModelToJson(_NaccolModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tajuk': instance.tajuk,
      'kandungan': instance.kandungan,
      'kandungan_processed': instance.kandunganProcessed,
      'sequence': instance.sequence,
    };
