// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_model.freezed.dart';
part 'media_model.g.dart';

@freezed
abstract class MediaModel with _$MediaModel {
  factory MediaModel({
    required String id,
    required String fileable,
    @JsonKey(name: 'file_name') required String fileName,
    @JsonKey(name: 'file_size') int? fileSize,
    @JsonKey(name: 'file_extension') required String fileExtension,
    @JsonKey(name: 'file_mime') required String fileMime,
    @JsonKey(name: 'file_url') required String fileUrl,
  }) = _MediaModel;

  factory MediaModel.initial() => MediaModel(
        id: '',
        fileable: '',
        fileName: '',
        fileSize: 0,
        fileExtension: '',
        fileMime: '',
        fileUrl: '',
      );

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);
}
