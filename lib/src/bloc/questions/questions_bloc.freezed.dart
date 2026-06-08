// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionsState {

 Pagination<QuestionModel> get question; QuestionStatus get status; String get errorMessage; List<String> get answers; List<AnswerModel> get checkBoxAnswer; List<List<String>> get checkboxQuestion; List<InitiativeModel> get searchResults; int get answerCount; Map<String, dynamic>? get pieChartData;
/// Create a copy of QuestionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionsStateCopyWith<QuestionsState> get copyWith => _$QuestionsStateCopyWithImpl<QuestionsState>(this as QuestionsState, _$identity);

  /// Serializes this QuestionsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionsState&&(identical(other.question, question) || other.question == question)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.answers, answers)&&const DeepCollectionEquality().equals(other.checkBoxAnswer, checkBoxAnswer)&&const DeepCollectionEquality().equals(other.checkboxQuestion, checkboxQuestion)&&const DeepCollectionEquality().equals(other.searchResults, searchResults)&&(identical(other.answerCount, answerCount) || other.answerCount == answerCount)&&const DeepCollectionEquality().equals(other.pieChartData, pieChartData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,status,errorMessage,const DeepCollectionEquality().hash(answers),const DeepCollectionEquality().hash(checkBoxAnswer),const DeepCollectionEquality().hash(checkboxQuestion),const DeepCollectionEquality().hash(searchResults),answerCount,const DeepCollectionEquality().hash(pieChartData));

@override
String toString() {
  return 'QuestionsState(question: $question, status: $status, errorMessage: $errorMessage, answers: $answers, checkBoxAnswer: $checkBoxAnswer, checkboxQuestion: $checkboxQuestion, searchResults: $searchResults, answerCount: $answerCount, pieChartData: $pieChartData)';
}


}

/// @nodoc
abstract mixin class $QuestionsStateCopyWith<$Res>  {
  factory $QuestionsStateCopyWith(QuestionsState value, $Res Function(QuestionsState) _then) = _$QuestionsStateCopyWithImpl;
@useResult
$Res call({
 Pagination<QuestionModel> question, QuestionStatus status, String errorMessage, List<String> answers, List<AnswerModel> checkBoxAnswer, List<List<String>> checkboxQuestion, List<InitiativeModel> searchResults, int answerCount, Map<String, dynamic>? pieChartData
});




}
/// @nodoc
class _$QuestionsStateCopyWithImpl<$Res>
    implements $QuestionsStateCopyWith<$Res> {
  _$QuestionsStateCopyWithImpl(this._self, this._then);

  final QuestionsState _self;
  final $Res Function(QuestionsState) _then;

/// Create a copy of QuestionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? status = null,Object? errorMessage = null,Object? answers = null,Object? checkBoxAnswer = null,Object? checkboxQuestion = null,Object? searchResults = null,Object? answerCount = null,Object? pieChartData = freezed,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Pagination<QuestionModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuestionStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<String>,checkBoxAnswer: null == checkBoxAnswer ? _self.checkBoxAnswer : checkBoxAnswer // ignore: cast_nullable_to_non_nullable
as List<AnswerModel>,checkboxQuestion: null == checkboxQuestion ? _self.checkboxQuestion : checkboxQuestion // ignore: cast_nullable_to_non_nullable
as List<List<String>>,searchResults: null == searchResults ? _self.searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<InitiativeModel>,answerCount: null == answerCount ? _self.answerCount : answerCount // ignore: cast_nullable_to_non_nullable
as int,pieChartData: freezed == pieChartData ? _self.pieChartData : pieChartData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionsState].
extension QuestionsStatePatterns on QuestionsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionsState value)  $default,){
final _that = this;
switch (_that) {
case _QuestionsState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionsState value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Pagination<QuestionModel> question,  QuestionStatus status,  String errorMessage,  List<String> answers,  List<AnswerModel> checkBoxAnswer,  List<List<String>> checkboxQuestion,  List<InitiativeModel> searchResults,  int answerCount,  Map<String, dynamic>? pieChartData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionsState() when $default != null:
return $default(_that.question,_that.status,_that.errorMessage,_that.answers,_that.checkBoxAnswer,_that.checkboxQuestion,_that.searchResults,_that.answerCount,_that.pieChartData);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Pagination<QuestionModel> question,  QuestionStatus status,  String errorMessage,  List<String> answers,  List<AnswerModel> checkBoxAnswer,  List<List<String>> checkboxQuestion,  List<InitiativeModel> searchResults,  int answerCount,  Map<String, dynamic>? pieChartData)  $default,) {final _that = this;
switch (_that) {
case _QuestionsState():
return $default(_that.question,_that.status,_that.errorMessage,_that.answers,_that.checkBoxAnswer,_that.checkboxQuestion,_that.searchResults,_that.answerCount,_that.pieChartData);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Pagination<QuestionModel> question,  QuestionStatus status,  String errorMessage,  List<String> answers,  List<AnswerModel> checkBoxAnswer,  List<List<String>> checkboxQuestion,  List<InitiativeModel> searchResults,  int answerCount,  Map<String, dynamic>? pieChartData)?  $default,) {final _that = this;
switch (_that) {
case _QuestionsState() when $default != null:
return $default(_that.question,_that.status,_that.errorMessage,_that.answers,_that.checkBoxAnswer,_that.checkboxQuestion,_that.searchResults,_that.answerCount,_that.pieChartData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestionsState extends QuestionsState {
   _QuestionsState({required this.question, required this.status, required this.errorMessage, required final  List<String> answers, required final  List<AnswerModel> checkBoxAnswer, required final  List<List<String>> checkboxQuestion, required final  List<InitiativeModel> searchResults, required this.answerCount, final  Map<String, dynamic>? pieChartData}): _answers = answers,_checkBoxAnswer = checkBoxAnswer,_checkboxQuestion = checkboxQuestion,_searchResults = searchResults,_pieChartData = pieChartData,super._();
  factory _QuestionsState.fromJson(Map<String, dynamic> json) => _$QuestionsStateFromJson(json);

@override final  Pagination<QuestionModel> question;
@override final  QuestionStatus status;
@override final  String errorMessage;
 final  List<String> _answers;
@override List<String> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

 final  List<AnswerModel> _checkBoxAnswer;
@override List<AnswerModel> get checkBoxAnswer {
  if (_checkBoxAnswer is EqualUnmodifiableListView) return _checkBoxAnswer;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checkBoxAnswer);
}

 final  List<List<String>> _checkboxQuestion;
@override List<List<String>> get checkboxQuestion {
  if (_checkboxQuestion is EqualUnmodifiableListView) return _checkboxQuestion;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checkboxQuestion);
}

 final  List<InitiativeModel> _searchResults;
@override List<InitiativeModel> get searchResults {
  if (_searchResults is EqualUnmodifiableListView) return _searchResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchResults);
}

@override final  int answerCount;
 final  Map<String, dynamic>? _pieChartData;
@override Map<String, dynamic>? get pieChartData {
  final value = _pieChartData;
  if (value == null) return null;
  if (_pieChartData is EqualUnmodifiableMapView) return _pieChartData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of QuestionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionsStateCopyWith<_QuestionsState> get copyWith => __$QuestionsStateCopyWithImpl<_QuestionsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionsState&&(identical(other.question, question) || other.question == question)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._answers, _answers)&&const DeepCollectionEquality().equals(other._checkBoxAnswer, _checkBoxAnswer)&&const DeepCollectionEquality().equals(other._checkboxQuestion, _checkboxQuestion)&&const DeepCollectionEquality().equals(other._searchResults, _searchResults)&&(identical(other.answerCount, answerCount) || other.answerCount == answerCount)&&const DeepCollectionEquality().equals(other._pieChartData, _pieChartData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,status,errorMessage,const DeepCollectionEquality().hash(_answers),const DeepCollectionEquality().hash(_checkBoxAnswer),const DeepCollectionEquality().hash(_checkboxQuestion),const DeepCollectionEquality().hash(_searchResults),answerCount,const DeepCollectionEquality().hash(_pieChartData));

@override
String toString() {
  return 'QuestionsState(question: $question, status: $status, errorMessage: $errorMessage, answers: $answers, checkBoxAnswer: $checkBoxAnswer, checkboxQuestion: $checkboxQuestion, searchResults: $searchResults, answerCount: $answerCount, pieChartData: $pieChartData)';
}


}

/// @nodoc
abstract mixin class _$QuestionsStateCopyWith<$Res> implements $QuestionsStateCopyWith<$Res> {
  factory _$QuestionsStateCopyWith(_QuestionsState value, $Res Function(_QuestionsState) _then) = __$QuestionsStateCopyWithImpl;
@override @useResult
$Res call({
 Pagination<QuestionModel> question, QuestionStatus status, String errorMessage, List<String> answers, List<AnswerModel> checkBoxAnswer, List<List<String>> checkboxQuestion, List<InitiativeModel> searchResults, int answerCount, Map<String, dynamic>? pieChartData
});




}
/// @nodoc
class __$QuestionsStateCopyWithImpl<$Res>
    implements _$QuestionsStateCopyWith<$Res> {
  __$QuestionsStateCopyWithImpl(this._self, this._then);

  final _QuestionsState _self;
  final $Res Function(_QuestionsState) _then;

/// Create a copy of QuestionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? status = null,Object? errorMessage = null,Object? answers = null,Object? checkBoxAnswer = null,Object? checkboxQuestion = null,Object? searchResults = null,Object? answerCount = null,Object? pieChartData = freezed,}) {
  return _then(_QuestionsState(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Pagination<QuestionModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuestionStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<String>,checkBoxAnswer: null == checkBoxAnswer ? _self._checkBoxAnswer : checkBoxAnswer // ignore: cast_nullable_to_non_nullable
as List<AnswerModel>,checkboxQuestion: null == checkboxQuestion ? _self._checkboxQuestion : checkboxQuestion // ignore: cast_nullable_to_non_nullable
as List<List<String>>,searchResults: null == searchResults ? _self._searchResults : searchResults // ignore: cast_nullable_to_non_nullable
as List<InitiativeModel>,answerCount: null == answerCount ? _self.answerCount : answerCount // ignore: cast_nullable_to_non_nullable
as int,pieChartData: freezed == pieChartData ? _self._pieChartData : pieChartData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
