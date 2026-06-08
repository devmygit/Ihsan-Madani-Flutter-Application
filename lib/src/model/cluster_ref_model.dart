import 'package:freezed_annotation/freezed_annotation.dart';

part 'cluster_ref_model.freezed.dart';
part 'cluster_ref_model.g.dart';

@freezed
abstract class ClusterRefModel with _$ClusterRefModel {
  const factory ClusterRefModel({
    required String id,
    required String name,
  }) = _ClusterRefModel;

  factory ClusterRefModel.initial() => const ClusterRefModel(
        id: '',
        name: '',
      );

  factory ClusterRefModel.fromJson(Map<String, dynamic> json) =>
      _$ClusterRefModelFromJson(json);
}
