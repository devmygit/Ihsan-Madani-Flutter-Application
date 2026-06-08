// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'poster_media_model.freezed.dart';
part 'poster_media_model.g.dart';

@freezed
abstract class PosterMediaModel with _$PosterMediaModel {
  factory PosterMediaModel({
    required String id,
    required String? fileable,
    @JsonKey(name: 'file_name') required String? fileName,
    @JsonKey(name: 'file_path') required String? filePath,
    @JsonKey(name: 'file_size') required int? fileSize,
    @JsonKey(name: 'file_extension') required String? fileExtension,
    @JsonKey(name: 'file_mime') required String? fileMime,
    required String? mode,
    @JsonKey(name: 'fileable_type') required String? fileableType,
    @JsonKey(name: 'fileable_id') required String? fileableId,
    @JsonKey(name: 'deleted_at') required String? deletedAt,
    @JsonKey(name: 'created_at') required String? createdAt,
    @JsonKey(name: 'updated_at') required String? updatedAt,
    @JsonKey(name: 'file_url') required String? fileUrl,
  }) = _PosterMediaModel;

  factory PosterMediaModel.initial() => PosterMediaModel(
        id: '',
        fileable: '',
        fileName: '',
        filePath: '',
        fileSize: 0,
        fileExtension: '',
        fileMime: '',
        mode: '',
        fileableType: '',
        fileableId: '',
        deletedAt: '',
        createdAt: '',
        updatedAt: '',
        fileUrl: '',
      );

  factory PosterMediaModel.fromJson(Map<String, dynamic> json) =>
      _$PosterMediaModelFromJson(json);
}
