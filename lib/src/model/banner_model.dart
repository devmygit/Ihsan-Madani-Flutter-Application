// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madani/src/model/index.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

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
abstract class BannerModel with _$BannerModel {
  const factory BannerModel({
    required String id,
    required String title,
    required String description,
    @JsonKey(name: 'publish_date') required String publisDate,
    @JsonKey(name: 'is_published') required bool isPublished,
    required int sequence,
    @JsonKey(fromJson: _parseMedia) required MediaModel? media,
    @JsonKey(fromJson: _parseMedia) required MediaModel? logo,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'button_name') required String? buttonName,
    required String? url,
  }) = _BannerModel;

  factory BannerModel.initial() => BannerModel(
        id: '',
        title: '',
        description: '',
        publisDate: '',
        isPublished: false,
        sequence: 0,
        media: MediaModel.initial(),
        logo: MediaModel.initial(),
        createdAt: '',
        buttonName: '',
        url: '',
      );

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}
