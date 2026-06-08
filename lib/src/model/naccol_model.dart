// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madani/src/model/index.dart';

part 'naccol_model.freezed.dart';
part 'naccol_model.g.dart';

@freezed
abstract class NaccolModel with _$NaccolModel {
  const factory NaccolModel({
    required String id,
    required String tajuk,
    required String kandungan,
    @JsonKey(name: 'kandungan_processed') String? kandunganProcessed,
    required int sequence,
  }) = _NaccolModel;

  factory NaccolModel.initial() => const NaccolModel(
        id: '',
        tajuk: '',
        kandungan: '',
        kandunganProcessed: null,
        sequence: 0,
      );

  factory NaccolModel.fromJson(Map<String, dynamic> json) =>
      _$NaccolModelFromJson(json);
}

