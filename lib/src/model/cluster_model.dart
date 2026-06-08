import 'package:freezed_annotation/freezed_annotation.dart';

part 'cluster_model.freezed.dart';

@freezed
abstract class ClusterModel with _$ClusterModel {
  factory ClusterModel({
    required String clusterId,
    required String clusterTitle,
    required String shortName,
    required String clusterIcon,
    required String clusterImg,
  }) = _ClusterModel;
}

@freezed
abstract class InitiativeDetailOption with _$InitiativeDetailOption {
  factory InitiativeDetailOption({
    required int id,
    required String name,
    required String iconPath,
    String? activeIconPath,
  }) = _InitiativeDetailOption;
}
