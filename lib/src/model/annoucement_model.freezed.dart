// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annoucement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnoucementModel {

 String get id; String get title; String? get description;@JsonKey(name: 'embedded_url') String? get embeddedURL;@JsonKey(name: 'is_published') bool get isPublished; int get sequence;
/// Create a copy of AnnoucementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnoucementModelCopyWith<AnnoucementModel> get copyWith => _$AnnoucementModelCopyWithImpl<AnnoucementModel>(this as AnnoucementModel, _$identity);

  /// Serializes this AnnoucementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnoucementModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.embeddedURL, embeddedURL) || other.embeddedURL == embeddedURL)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.sequence, sequence) || other.sequence == sequence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,embeddedURL,isPublished,sequence);

@override
String toString() {
  return 'AnnoucementModel(id: $id, title: $title, description: $description, embeddedURL: $embeddedURL, isPublished: $isPublished, sequence: $sequence)';
}


}

/// @nodoc
abstract mixin class $AnnoucementModelCopyWith<$Res>  {
  factory $AnnoucementModelCopyWith(AnnoucementModel value, $Res Function(AnnoucementModel) _then) = _$AnnoucementModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description,@JsonKey(name: 'embedded_url') String? embeddedURL,@JsonKey(name: 'is_published') bool isPublished, int sequence
});




}
/// @nodoc
class _$AnnoucementModelCopyWithImpl<$Res>
    implements $AnnoucementModelCopyWith<$Res> {
  _$AnnoucementModelCopyWithImpl(this._self, this._then);

  final AnnoucementModel _self;
  final $Res Function(AnnoucementModel) _then;

/// Create a copy of AnnoucementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? embeddedURL = freezed,Object? isPublished = null,Object? sequence = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,embeddedURL: freezed == embeddedURL ? _self.embeddedURL : embeddedURL // ignore: cast_nullable_to_non_nullable
as String?,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnoucementModel].
extension AnnoucementModelPatterns on AnnoucementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnoucementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnoucementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnoucementModel value)  $default,){
final _that = this;
switch (_that) {
case _AnnoucementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnoucementModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnnoucementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description, @JsonKey(name: 'embedded_url')  String? embeddedURL, @JsonKey(name: 'is_published')  bool isPublished,  int sequence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnoucementModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.embeddedURL,_that.isPublished,_that.sequence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description, @JsonKey(name: 'embedded_url')  String? embeddedURL, @JsonKey(name: 'is_published')  bool isPublished,  int sequence)  $default,) {final _that = this;
switch (_that) {
case _AnnoucementModel():
return $default(_that.id,_that.title,_that.description,_that.embeddedURL,_that.isPublished,_that.sequence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description, @JsonKey(name: 'embedded_url')  String? embeddedURL, @JsonKey(name: 'is_published')  bool isPublished,  int sequence)?  $default,) {final _that = this;
switch (_that) {
case _AnnoucementModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.embeddedURL,_that.isPublished,_that.sequence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnoucementModel implements AnnoucementModel {
  const _AnnoucementModel({required this.id, required this.title, required this.description, @JsonKey(name: 'embedded_url') required this.embeddedURL, @JsonKey(name: 'is_published') required this.isPublished, required this.sequence});
  factory _AnnoucementModel.fromJson(Map<String, dynamic> json) => _$AnnoucementModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override@JsonKey(name: 'embedded_url') final  String? embeddedURL;
@override@JsonKey(name: 'is_published') final  bool isPublished;
@override final  int sequence;

/// Create a copy of AnnoucementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnoucementModelCopyWith<_AnnoucementModel> get copyWith => __$AnnoucementModelCopyWithImpl<_AnnoucementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnoucementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnoucementModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.embeddedURL, embeddedURL) || other.embeddedURL == embeddedURL)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.sequence, sequence) || other.sequence == sequence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,embeddedURL,isPublished,sequence);

@override
String toString() {
  return 'AnnoucementModel(id: $id, title: $title, description: $description, embeddedURL: $embeddedURL, isPublished: $isPublished, sequence: $sequence)';
}


}

/// @nodoc
abstract mixin class _$AnnoucementModelCopyWith<$Res> implements $AnnoucementModelCopyWith<$Res> {
  factory _$AnnoucementModelCopyWith(_AnnoucementModel value, $Res Function(_AnnoucementModel) _then) = __$AnnoucementModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description,@JsonKey(name: 'embedded_url') String? embeddedURL,@JsonKey(name: 'is_published') bool isPublished, int sequence
});




}
/// @nodoc
class __$AnnoucementModelCopyWithImpl<$Res>
    implements _$AnnoucementModelCopyWith<$Res> {
  __$AnnoucementModelCopyWithImpl(this._self, this._then);

  final _AnnoucementModel _self;
  final $Res Function(_AnnoucementModel) _then;

/// Create a copy of AnnoucementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? embeddedURL = freezed,Object? isPublished = null,Object? sequence = null,}) {
  return _then(_AnnoucementModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,embeddedURL: freezed == embeddedURL ? _self.embeddedURL : embeddedURL // ignore: cast_nullable_to_non_nullable
as String?,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
