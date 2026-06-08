// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'annoucement_model.freezed.dart';
part 'annoucement_model.g.dart';

@freezed
abstract class AnnoucementModel with _$AnnoucementModel {
  const factory AnnoucementModel({
    required String id,
    required String title,
    required String? description,
    @JsonKey(name: 'embedded_url') required String? embeddedURL,
    @JsonKey(name: 'is_published') required bool isPublished,
    required int sequence,
  }) = _AnnoucementModel;

  factory AnnoucementModel.initial() => const AnnoucementModel(
        id: '',
        title: '',
        description: '',
        embeddedURL: '',
        isPublished: false,
        sequence: 0,
      );

  factory AnnoucementModel.fromJson(Map<String, dynamic> json) =>
      _$AnnoucementModelFromJson(json);
}
