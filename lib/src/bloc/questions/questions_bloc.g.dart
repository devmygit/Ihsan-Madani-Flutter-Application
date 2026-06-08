// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionsState _$QuestionsStateFromJson(Map<String, dynamic> json) =>
    _QuestionsState(
      question: Pagination<QuestionModel>.fromJson(json['question'] as String),
      status: $enumDecode(_$QuestionStatusEnumMap, json['status']),
      errorMessage: json['errorMessage'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      checkBoxAnswer: (json['checkBoxAnswer'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      checkboxQuestion: (json['checkboxQuestion'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      searchResults: (json['searchResults'] as List<dynamic>)
          .map((e) => InitiativeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      answerCount: (json['answerCount'] as num).toInt(),
      pieChartData: json['pieChartData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$QuestionsStateToJson(_QuestionsState instance) =>
    <String, dynamic>{
      'question': instance.question,
      'status': _$QuestionStatusEnumMap[instance.status]!,
      'errorMessage': instance.errorMessage,
      'answers': instance.answers,
      'checkBoxAnswer': instance.checkBoxAnswer,
      'checkboxQuestion': instance.checkboxQuestion,
      'searchResults': instance.searchResults,
      'answerCount': instance.answerCount,
      'pieChartData': instance.pieChartData,
    };

const _$QuestionStatusEnumMap = {
  QuestionStatus.initial: 'initial',
  QuestionStatus.loading: 'loading',
  QuestionStatus.completed: 'completed',
  QuestionStatus.error: 'error',
  QuestionStatus.stop: 'stop',
  QuestionStatus.searchResults: 'searchResults',
};
