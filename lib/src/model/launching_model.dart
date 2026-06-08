// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'launching_model.freezed.dart';
part 'launching_model.g.dart';

@freezed
abstract class LaunchingStatusModel with _$LaunchingStatusModel {
  factory LaunchingStatusModel({
    @JsonKey(name: 'is_launched_mobile') @Default(false) bool status,
    @JsonKey(name: 'launching_at') required String? launchingAt,
  }) = _LaunchingStatusModel;

  factory LaunchingStatusModel.initial() => LaunchingStatusModel(
        status: false,
        launchingAt: '',
      );

  factory LaunchingStatusModel.fromJson(Map<String, dynamic> json) =>
      _$LaunchingStatusModelFromJson(json);
}
