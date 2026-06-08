// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madani/src/model/index.dart';

part 'infographic_model.freezed.dart';
part 'infographic_model.g.dart';

MediaModel? _parseMedia(dynamic json) {
  if (json is Map<String, dynamic>) {
    return MediaModel.fromJson(json);
  } else if (json is List<dynamic>) {
    return json.isNotEmpty
        ? MediaModel.fromJson(json.first as Map<String, dynamic>)
        : null;
  } else {
    return null;
  }
}

@freezed
abstract class InfographicModel with _$InfographicModel {
  const factory InfographicModel({
    required String id,
    required String title,
    @JsonKey(name: 'publish_date') required String publishDate,
    @JsonKey(name: 'is_published') required bool isPublished,
    required int sequence,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(fromJson: _parseMedia) required MediaModel? media,
  }) = _InfographicModel;

  factory InfographicModel.initial() => InfographicModel(
        id: '',
        title: '',
        publishDate: '',
        isPublished: false,
        sequence: 0,
        createdAt: '',
        media: MediaModel.initial(),
      );

  factory InfographicModel.fromJson(Map<String, dynamic> json) =>
      _$InfographicModelFromJson(json);
}
