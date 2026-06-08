// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launching_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LaunchingStatusModel _$LaunchingStatusModelFromJson(
  Map<String, dynamic> json,
) => _LaunchingStatusModel(
  status: json['is_launched_mobile'] as bool? ?? false,
  launchingAt: json['launching_at'] as String?,
);

Map<String, dynamic> _$LaunchingStatusModelToJson(
  _LaunchingStatusModel instance,
) => <String, dynamic>{
  'is_launched_mobile': instance.status,
  'launching_at': instance.launchingAt,
};
