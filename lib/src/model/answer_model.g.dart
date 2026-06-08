// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => _AnswerModel(
  id: json['id'] as String,
  answer: (json['answer'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$AnswerModelToJson(_AnswerModel instance) =>
    <String, dynamic>{'id': instance.id, 'answer': instance.answer};
