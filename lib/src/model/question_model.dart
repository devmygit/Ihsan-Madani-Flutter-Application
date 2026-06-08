// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required String id,
    @JsonKey(name: 'criteria_ref_id') required String criteriaRefId,
    required String question,
    @JsonKey(name: 'answer_type') required String answerType,
    required List<String>? answers,
  }) = _QuestionModel;

  factory QuestionModel.initial() => const QuestionModel(
        id: '',
        criteriaRefId: '',
        question: '',
        answerType: '',
        answers: [],
      );

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
