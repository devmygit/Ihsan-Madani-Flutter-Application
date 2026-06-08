// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiative_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InitiativeState _$InitiativeStateFromJson(Map<String, dynamic> json) =>
    _InitiativeState(
      status: $enumDecode(_$InitiativeStatusEnumMap, json['status']),
      getInitiativeStatus: $enumDecode(
        _$GetInitiativeStatusEnumMap,
        json['getInitiativeStatus'],
      ),
      detailInitiativeStatus: $enumDecode(
        _$DetailInitiativeStatusEnumMap,
        json['detailInitiativeStatus'],
      ),
      currentCluster: json['currentCluster'] as String,
      initiative: Pagination<InitiativeModel>.fromJson(
        json['initiative'] as String,
      ),
      initiativeDetail: InitiativeModel.fromJson(
        json['initiativeDetail'] as Map<String, dynamic>,
      ),
      errorMessage: json['errorMessage'] as String,
    );

Map<String, dynamic> _$InitiativeStateToJson(_InitiativeState instance) =>
    <String, dynamic>{
      'status': _$InitiativeStatusEnumMap[instance.status]!,
      'getInitiativeStatus':
          _$GetInitiativeStatusEnumMap[instance.getInitiativeStatus]!,
      'detailInitiativeStatus':
          _$DetailInitiativeStatusEnumMap[instance.detailInitiativeStatus]!,
      'currentCluster': instance.currentCluster,
      'initiative': instance.initiative,
      'initiativeDetail': instance.initiativeDetail,
      'errorMessage': instance.errorMessage,
    };

const _$InitiativeStatusEnumMap = {
  InitiativeStatus.initial: 'initial',
  InitiativeStatus.loading: 'loading',
  InitiativeStatus.completed: 'completed',
  InitiativeStatus.error: 'error',
};

const _$GetInitiativeStatusEnumMap = {
  GetInitiativeStatus.initial: 'initial',
  GetInitiativeStatus.loading: 'loading',
  GetInitiativeStatus.completed: 'completed',
  GetInitiativeStatus.error: 'error',
};

const _$DetailInitiativeStatusEnumMap = {
  DetailInitiativeStatus.initial: 'initial',
  DetailInitiativeStatus.loading: 'loading',
  DetailInitiativeStatus.completed: 'completed',
  DetailInitiativeStatus.error: 'error',
};
