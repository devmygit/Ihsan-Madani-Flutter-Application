// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionModel {

 String get id;@JsonKey(name: 'criteria_ref_id') String get criteriaRefId; String get question;@JsonKey(name: 'answer_type') String get answerType; List<String>? get answers;
/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionModelCopyWith<QuestionModel> get copyWith => _$QuestionModelCopyWithImpl<QuestionModel>(this as QuestionModel, _$identity);

  /// Serializes this QuestionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.criteriaRefId, criteriaRefId) || other.criteriaRefId == criteriaRefId)&&(identical(other.question, question) || other.question == question)&&(identical(other.answerType, answerType) || other.answerType == answerType)&&const DeepCollectionEquality().equals(other.answers, answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,criteriaRefId,question,answerType,const DeepCollectionEquality().hash(answers));

@override
String toString() {
  return 'QuestionModel(id: $id, criteriaRefId: $criteriaRefId, question: $question, answerType: $answerType, answers: $answers)';
}


}

/// @nodoc
abstract mixin class $QuestionModelCopyWith<$Res>  {
  factory $QuestionModelCopyWith(QuestionModel value, $Res Function(QuestionModel) _then) = _$QuestionModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'criteria_ref_id') String criteriaRefId, String question,@JsonKey(name: 'answer_type') String answerType, List<String>? answers
});




}
/// @nodoc
class _$QuestionModelCopyWithImpl<$Res>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._self, this._then);

  final QuestionModel _self;
  final $Res Function(QuestionModel) _then;

/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? criteriaRefId = null,Object? question = null,Object? answerType = null,Object? answers = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,criteriaRefId: null == criteriaRefId ? _self.criteriaRefId : criteriaRefId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answerType: null == answerType ? _self.answerType : answerType // ignore: cast_nullable_to_non_nullable
as String,answers: freezed == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionModel].
extension QuestionModelPatterns on QuestionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionModel value)  $default,){
final _that = this;
switch (_that) {
case _QuestionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'criteria_ref_id')  String criteriaRefId,  String question, @JsonKey(name: 'answer_type')  String answerType,  List<String>? answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
return $default(_that.id,_that.criteriaRefId,_that.question,_that.answerType,_that.answers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'criteria_ref_id')  String criteriaRefId,  String question, @JsonKey(name: 'answer_type')  String answerType,  List<String>? answers)  $default,) {final _that = this;
switch (_that) {
case _QuestionModel():
return $default(_that.id,_that.criteriaRefId,_that.question,_that.answerType,_that.answers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'criteria_ref_id')  String criteriaRefId,  String question, @JsonKey(name: 'answer_type')  String answerType,  List<String>? answers)?  $default,) {final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
return $default(_that.id,_that.criteriaRefId,_that.question,_that.answerType,_that.answers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestionModel implements QuestionModel {
  const _QuestionModel({required this.id, @JsonKey(name: 'criteria_ref_id') required this.criteriaRefId, required this.question, @JsonKey(name: 'answer_type') required this.answerType, required final  List<String>? answers}): _answers = answers;
  factory _QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'criteria_ref_id') final  String criteriaRefId;
@override final  String question;
@override@JsonKey(name: 'answer_type') final  String answerType;
 final  List<String>? _answers;
@override List<String>? get answers {
  final value = _answers;
  if (value == null) return null;
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionModelCopyWith<_QuestionModel> get copyWith => __$QuestionModelCopyWithImpl<_QuestionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.criteriaRefId, criteriaRefId) || other.criteriaRefId == criteriaRefId)&&(identical(other.question, question) || other.question == question)&&(identical(other.answerType, answerType) || other.answerType == answerType)&&const DeepCollectionEquality().equals(other._answers, _answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,criteriaRefId,question,answerType,const DeepCollectionEquality().hash(_answers));

@override
String toString() {
  return 'QuestionModel(id: $id, criteriaRefId: $criteriaRefId, question: $question, answerType: $answerType, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$QuestionModelCopyWith<$Res> implements $QuestionModelCopyWith<$Res> {
  factory _$QuestionModelCopyWith(_QuestionModel value, $Res Function(_QuestionModel) _then) = __$QuestionModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'criteria_ref_id') String criteriaRefId, String question,@JsonKey(name: 'answer_type') String answerType, List<String>? answers
});




}
/// @nodoc
class __$QuestionModelCopyWithImpl<$Res>
    implements _$QuestionModelCopyWith<$Res> {
  __$QuestionModelCopyWithImpl(this._self, this._then);

  final _QuestionModel _self;
  final $Res Function(_QuestionModel) _then;

/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? criteriaRefId = null,Object? question = null,Object? answerType = null,Object? answers = freezed,}) {
  return _then(_QuestionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,criteriaRefId: null == criteriaRefId ? _self.criteriaRefId : criteriaRefId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answerType: null == answerType ? _self.answerType : answerType // ignore: cast_nullable_to_non_nullable
as String,answers: freezed == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
