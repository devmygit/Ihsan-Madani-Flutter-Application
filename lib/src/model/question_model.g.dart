// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    _QuestionModel(
      id: json['id'] as String,
      criteriaRefId: json['criteria_ref_id'] as String,
      question: json['question'] as String,
      answerType: json['answer_type'] as String,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$QuestionModelToJson(_QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'criteria_ref_id': instance.criteriaRefId,
      'question': instance.question,
      'answer_type': instance.answerType,
      'answers': instance.answers,
    };
