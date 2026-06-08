// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'faq_model.freezed.dart';
part 'faq_model.g.dart';

@freezed
abstract class FaqModel with _$FaqModel {
  const factory FaqModel({
    required String id,
    required String uuid,
    required String title,
    required String body,
    @JsonKey(name: 'body_processed') String? bodyProcessed,
    @JsonKey(name: 'body_summary') String? bodySummary,
    String? description,
    @JsonKey(name: 'publish_date') String? publishDate,
    @JsonKey(name: 'is_published') bool? isPublished,
    int? sequence,
    @JsonKey(name: 'created_at') String? createdAt,
    String? created,
    String? changed,
    String? langcode,
  }) = _FaqModel;

  factory FaqModel.initial() => const FaqModel(
        id: '',
        uuid: '',
        title: '',
        body: '',
        bodyProcessed: null,
        bodySummary: null,
        description: null,
        publishDate: null,
        isPublished: false,
        sequence: null,
        createdAt: null,
        created: null,
        changed: null,
        langcode: null,
      );

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);
}

