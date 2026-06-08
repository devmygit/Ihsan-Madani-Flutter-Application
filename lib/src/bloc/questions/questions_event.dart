part of 'questions_bloc.dart';

@immutable
sealed class QuestionsEvent {}

class GetQuestion extends QuestionsEvent {
  final int page;

  GetQuestion({required this.page});
}

class StoreAnswer extends QuestionsEvent {
  final String id;
  final String questionAnswer;
  final AnswerModel answer;
  final int answerIndex;

  StoreAnswer({
    required this.questionAnswer,
    required this.id,
    required this.answer,
    required this.answerIndex,
  });

  @override
  String toString() =>
      'StoreAnswer(answerIndex: $answerIndex, questionAnswer: $questionAnswer, answer: $answer)';
}

class InitialValueAnswer extends QuestionsEvent {
  // final String answer;
  // final int answerIndex;

  // InitialValueAnswer({
  //   required this.answerIndex,
  //   required this.answer,
  // });
}

class CheckBoxAnswer extends QuestionsEvent {
  final int answerIndex;
  final String answer;
  final bool selected;

  CheckBoxAnswer({
    required this.answerIndex,
    required this.answer,
    required this.selected,
  });

  @override
  String toString() => 'CheckBoxAnswer(answerIndex: $answerIndex)';
}

class SearchResults extends QuestionsEvent {}

class GetArticlesByKategori extends QuestionsEvent {
  final String kategori;

  GetArticlesByKategori({required this.kategori});
}

class ResetStatus extends QuestionsEvent {}

class LoadStaticQuestions extends QuestionsEvent {}
