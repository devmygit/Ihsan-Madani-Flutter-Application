// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madani/src/model/index.dart';

part 'poster_model.freezed.dart';
part 'poster_model.g.dart';

@freezed
abstract class PosterModel with _$PosterModel {
  factory PosterModel({
    required String id,
    required String title,
    @JsonKey(name: 'is_published') required bool isPublished,
    @JsonKey(name: 'poster_media') required PosterMediaModel posterMedia,
  }) = _PosterModel;

  factory PosterModel.fromJson(Map<String, dynamic> json) =>
      _$PosterModelFromJson(json);
}
