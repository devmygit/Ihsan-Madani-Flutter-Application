part of 'questions_bloc.dart';

enum QuestionStatus {
  initial,
  loading,
  completed,
  error,
  stop,
  searchResults,
}

@freezed
abstract class QuestionsState with _$QuestionsState {
  QuestionsState._();
  factory QuestionsState({
    required Pagination<QuestionModel> question,
    required QuestionStatus status,
    required String errorMessage,
    required List<String> answers,
    required List<AnswerModel> checkBoxAnswer,
    required List<List<String>> checkboxQuestion,
    required List<InitiativeModel> searchResults,
    required int answerCount,
    Map<String, dynamic>? pieChartData,
  }) = _QuestionsState;

  factory QuestionsState.initial() => QuestionsState(
        question: Pagination<QuestionModel>.initial(),
        status: QuestionStatus.initial,
        errorMessage: '',
        answers: [],
        checkBoxAnswer: [],
        checkboxQuestion: [],
        searchResults: [],
        answerCount: 0,
        pieChartData: null,
      );

  factory QuestionsState.fromJson(Map<String, dynamic> json) =>
      _$QuestionsStateFromJson(json);

  factory QuestionsState.saveFromJson(Map<String, dynamic> json) {
    return QuestionsState(
      question: Pagination<QuestionModel>.fromJson(json['question']),
      status: QuestionStatus.values.byName(json['status']),
      errorMessage: json['errorMessage'],
      answers: List.from(json['answer']),
      checkBoxAnswer: [],
      checkboxQuestion: [],
      searchResults: List<InitiativeModel>.from(
        json['searchResults'].map(
          (data) => InitiativeModel.fromJson(data),
        ),
      ),
      answerCount: json['answerCount'],
    );
  }

  Map<String, dynamic> saveToJson() => {
        'question': question.toJson(),
        'status': status.name,
        'errorMessage': errorMessage,
        'answers': answers,
        'checkBoxAnswer': checkBoxAnswer,
        'checkboxQuestion': checkboxQuestion,
        'searchResults': searchResults,
        'answerCount': answerCount,
      };
}
