import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_model.freezed.dart';
part 'answer_model.g.dart';

@freezed
abstract class AnswerModel with _$AnswerModel {
  factory AnswerModel({
    required String id,
    required List<String> answer,
  }) = _AnswerModel;

  factory AnswerModel.initial() => AnswerModel(
        id: '',
        answer: [],
      );

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
}
