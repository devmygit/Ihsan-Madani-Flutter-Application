// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaqModel {

 String get id; String get uuid; String get title; String get body;@JsonKey(name: 'body_processed') String? get bodyProcessed;@JsonKey(name: 'body_summary') String? get bodySummary; String? get description;@JsonKey(name: 'publish_date') String? get publishDate;@JsonKey(name: 'is_published') bool? get isPublished; int? get sequence;@JsonKey(name: 'created_at') String? get createdAt; String? get created; String? get changed; String? get langcode;
/// Create a copy of FaqModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqModelCopyWith<FaqModel> get copyWith => _$FaqModelCopyWithImpl<FaqModel>(this as FaqModel, _$identity);

  /// Serializes this FaqModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.bodyProcessed, bodyProcessed) || other.bodyProcessed == bodyProcessed)&&(identical(other.bodySummary, bodySummary) || other.bodySummary == bodySummary)&&(identical(other.description, description) || other.description == description)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.created, created) || other.created == created)&&(identical(other.changed, changed) || other.changed == changed)&&(identical(other.langcode, langcode) || other.langcode == langcode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uuid,title,body,bodyProcessed,bodySummary,description,publishDate,isPublished,sequence,createdAt,created,changed,langcode);

@override
String toString() {
  return 'FaqModel(id: $id, uuid: $uuid, title: $title, body: $body, bodyProcessed: $bodyProcessed, bodySummary: $bodySummary, description: $description, publishDate: $publishDate, isPublished: $isPublished, sequence: $sequence, createdAt: $createdAt, created: $created, changed: $changed, langcode: $langcode)';
}


}

/// @nodoc
abstract mixin class $FaqModelCopyWith<$Res>  {
  factory $FaqModelCopyWith(FaqModel value, $Res Function(FaqModel) _then) = _$FaqModelCopyWithImpl;
@useResult
$Res call({
 String id, String uuid, String title, String body,@JsonKey(name: 'body_processed') String? bodyProcessed,@JsonKey(name: 'body_summary') String? bodySummary, String? description,@JsonKey(name: 'publish_date') String? publishDate,@JsonKey(name: 'is_published') bool? isPublished, int? sequence,@JsonKey(name: 'created_at') String? createdAt, String? created, String? changed, String? langcode
});




}
/// @nodoc
class _$FaqModelCopyWithImpl<$Res>
    implements $FaqModelCopyWith<$Res> {
  _$FaqModelCopyWithImpl(this._self, this._then);

  final FaqModel _self;
  final $Res Function(FaqModel) _then;

/// Create a copy of FaqModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uuid = null,Object? title = null,Object? body = null,Object? bodyProcessed = freezed,Object? bodySummary = freezed,Object? description = freezed,Object? publishDate = freezed,Object? isPublished = freezed,Object? sequence = freezed,Object? createdAt = freezed,Object? created = freezed,Object? changed = freezed,Object? langcode = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,bodyProcessed: freezed == bodyProcessed ? _self.bodyProcessed : bodyProcessed // ignore: cast_nullable_to_non_nullable
as String?,bodySummary: freezed == bodySummary ? _self.bodySummary : bodySummary // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,publishDate: freezed == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String?,isPublished: freezed == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool?,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String?,changed: freezed == changed ? _self.changed : changed // ignore: cast_nullable_to_non_nullable
as String?,langcode: freezed == langcode ? _self.langcode : langcode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqModel].
extension FaqModelPatterns on FaqModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqModel value)  $default,){
final _that = this;
switch (_that) {
case _FaqModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqModel value)?  $default,){
final _that = this;
switch (_that) {
case _FaqModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String uuid,  String title,  String body, @JsonKey(name: 'body_processed')  String? bodyProcessed, @JsonKey(name: 'body_summary')  String? bodySummary,  String? description, @JsonKey(name: 'publish_date')  String? publishDate, @JsonKey(name: 'is_published')  bool? isPublished,  int? sequence, @JsonKey(name: 'created_at')  String? createdAt,  String? created,  String? changed,  String? langcode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqModel() when $default != null:
return $default(_that.id,_that.uuid,_that.title,_that.body,_that.bodyProcessed,_that.bodySummary,_that.description,_that.publishDate,_that.isPublished,_that.sequence,_that.createdAt,_that.created,_that.changed,_that.langcode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String uuid,  String title,  String body, @JsonKey(name: 'body_processed')  String? bodyProcessed, @JsonKey(name: 'body_summary')  String? bodySummary,  String? description, @JsonKey(name: 'publish_date')  String? publishDate, @JsonKey(name: 'is_published')  bool? isPublished,  int? sequence, @JsonKey(name: 'created_at')  String? createdAt,  String? created,  String? changed,  String? langcode)  $default,) {final _that = this;
switch (_that) {
case _FaqModel():
return $default(_that.id,_that.uuid,_that.title,_that.body,_that.bodyProcessed,_that.bodySummary,_that.description,_that.publishDate,_that.isPublished,_that.sequence,_that.createdAt,_that.created,_that.changed,_that.langcode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String uuid,  String title,  String body, @JsonKey(name: 'body_processed')  String? bodyProcessed, @JsonKey(name: 'body_summary')  String? bodySummary,  String? description, @JsonKey(name: 'publish_date')  String? publishDate, @JsonKey(name: 'is_published')  bool? isPublished,  int? sequence, @JsonKey(name: 'created_at')  String? createdAt,  String? created,  String? changed,  String? langcode)?  $default,) {final _that = this;
switch (_that) {
case _FaqModel() when $default != null:
return $default(_that.id,_that.uuid,_that.title,_that.body,_that.bodyProcessed,_that.bodySummary,_that.description,_that.publishDate,_that.isPublished,_that.sequence,_that.createdAt,_that.created,_that.changed,_that.langcode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqModel implements FaqModel {
  const _FaqModel({required this.id, required this.uuid, required this.title, required this.body, @JsonKey(name: 'body_processed') this.bodyProcessed, @JsonKey(name: 'body_summary') this.bodySummary, this.description, @JsonKey(name: 'publish_date') this.publishDate, @JsonKey(name: 'is_published') this.isPublished, this.sequence, @JsonKey(name: 'created_at') this.createdAt, this.created, this.changed, this.langcode});
  factory _FaqModel.fromJson(Map<String, dynamic> json) => _$FaqModelFromJson(json);

@override final  String id;
@override final  String uuid;
@override final  String title;
@override final  String body;
@override@JsonKey(name: 'body_processed') final  String? bodyProcessed;
@override@JsonKey(name: 'body_summary') final  String? bodySummary;
@override final  String? description;
@override@JsonKey(name: 'publish_date') final  String? publishDate;
@override@JsonKey(name: 'is_published') final  bool? isPublished;
@override final  int? sequence;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override final  String? created;
@override final  String? changed;
@override final  String? langcode;

/// Create a copy of FaqModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqModelCopyWith<_FaqModel> get copyWith => __$FaqModelCopyWithImpl<_FaqModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.bodyProcessed, bodyProcessed) || other.bodyProcessed == bodyProcessed)&&(identical(other.bodySummary, bodySummary) || other.bodySummary == bodySummary)&&(identical(other.description, description) || other.description == description)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.created, created) || other.created == created)&&(identical(other.changed, changed) || other.changed == changed)&&(identical(other.langcode, langcode) || other.langcode == langcode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uuid,title,body,bodyProcessed,bodySummary,description,publishDate,isPublished,sequence,createdAt,created,changed,langcode);

@override
String toString() {
  return 'FaqModel(id: $id, uuid: $uuid, title: $title, body: $body, bodyProcessed: $bodyProcessed, bodySummary: $bodySummary, description: $description, publishDate: $publishDate, isPublished: $isPublished, sequence: $sequence, createdAt: $createdAt, created: $created, changed: $changed, langcode: $langcode)';
}


}

/// @nodoc
abstract mixin class _$FaqModelCopyWith<$Res> implements $FaqModelCopyWith<$Res> {
  factory _$FaqModelCopyWith(_FaqModel value, $Res Function(_FaqModel) _then) = __$FaqModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String uuid, String title, String body,@JsonKey(name: 'body_processed') String? bodyProcessed,@JsonKey(name: 'body_summary') String? bodySummary, String? description,@JsonKey(name: 'publish_date') String? publishDate,@JsonKey(name: 'is_published') bool? isPublished, int? sequence,@JsonKey(name: 'created_at') String? createdAt, String? created, String? changed, String? langcode
});




}
/// @nodoc
class __$FaqModelCopyWithImpl<$Res>
    implements _$FaqModelCopyWith<$Res> {
  __$FaqModelCopyWithImpl(this._self, this._then);

  final _FaqModel _self;
  final $Res Function(_FaqModel) _then;

/// Create a copy of FaqModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uuid = null,Object? title = null,Object? body = null,Object? bodyProcessed = freezed,Object? bodySummary = freezed,Object? description = freezed,Object? publishDate = freezed,Object? isPublished = freezed,Object? sequence = freezed,Object? createdAt = freezed,Object? created = freezed,Object? changed = freezed,Object? langcode = freezed,}) {
  return _then(_FaqModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,bodyProcessed: freezed == bodyProcessed ? _self.bodyProcessed : bodyProcessed // ignore: cast_nullable_to_non_nullable
as String?,bodySummary: freezed == bodySummary ? _self.bodySummary : bodySummary // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,publishDate: freezed == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String?,isPublished: freezed == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool?,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as String?,changed: freezed == changed ? _self.changed : changed // ignore: cast_nullable_to_non_nullable
as String?,langcode: freezed == langcode ? _self.langcode : langcode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
