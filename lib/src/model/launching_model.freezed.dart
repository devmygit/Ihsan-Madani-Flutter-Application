// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launching_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LaunchingStatusModel {

@JsonKey(name: 'is_launched_mobile') bool get status;@JsonKey(name: 'launching_at') String? get launchingAt;
/// Create a copy of LaunchingStatusModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LaunchingStatusModelCopyWith<LaunchingStatusModel> get copyWith => _$LaunchingStatusModelCopyWithImpl<LaunchingStatusModel>(this as LaunchingStatusModel, _$identity);

  /// Serializes this LaunchingStatusModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LaunchingStatusModel&&(identical(other.status, status) || other.status == status)&&(identical(other.launchingAt, launchingAt) || other.launchingAt == launchingAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,launchingAt);

@override
String toString() {
  return 'LaunchingStatusModel(status: $status, launchingAt: $launchingAt)';
}


}

/// @nodoc
abstract mixin class $LaunchingStatusModelCopyWith<$Res>  {
  factory $LaunchingStatusModelCopyWith(LaunchingStatusModel value, $Res Function(LaunchingStatusModel) _then) = _$LaunchingStatusModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_launched_mobile') bool status,@JsonKey(name: 'launching_at') String? launchingAt
});




}
/// @nodoc
class _$LaunchingStatusModelCopyWithImpl<$Res>
    implements $LaunchingStatusModelCopyWith<$Res> {
  _$LaunchingStatusModelCopyWithImpl(this._self, this._then);

  final LaunchingStatusModel _self;
  final $Res Function(LaunchingStatusModel) _then;

/// Create a copy of LaunchingStatusModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? launchingAt = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,launchingAt: freezed == launchingAt ? _self.launchingAt : launchingAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LaunchingStatusModel].
extension LaunchingStatusModelPatterns on LaunchingStatusModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LaunchingStatusModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LaunchingStatusModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LaunchingStatusModel value)  $default,){
final _that = this;
switch (_that) {
case _LaunchingStatusModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LaunchingStatusModel value)?  $default,){
final _that = this;
switch (_that) {
case _LaunchingStatusModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_launched_mobile')  bool status, @JsonKey(name: 'launching_at')  String? launchingAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LaunchingStatusModel() when $default != null:
return $default(_that.status,_that.launchingAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_launched_mobile')  bool status, @JsonKey(name: 'launching_at')  String? launchingAt)  $default,) {final _that = this;
switch (_that) {
case _LaunchingStatusModel():
return $default(_that.status,_that.launchingAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_launched_mobile')  bool status, @JsonKey(name: 'launching_at')  String? launchingAt)?  $default,) {final _that = this;
switch (_that) {
case _LaunchingStatusModel() when $default != null:
return $default(_that.status,_that.launchingAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LaunchingStatusModel implements LaunchingStatusModel {
   _LaunchingStatusModel({@JsonKey(name: 'is_launched_mobile') this.status = false, @JsonKey(name: 'launching_at') required this.launchingAt});
  factory _LaunchingStatusModel.fromJson(Map<String, dynamic> json) => _$LaunchingStatusModelFromJson(json);

@override@JsonKey(name: 'is_launched_mobile') final  bool status;
@override@JsonKey(name: 'launching_at') final  String? launchingAt;

/// Create a copy of LaunchingStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LaunchingStatusModelCopyWith<_LaunchingStatusModel> get copyWith => __$LaunchingStatusModelCopyWithImpl<_LaunchingStatusModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LaunchingStatusModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LaunchingStatusModel&&(identical(other.status, status) || other.status == status)&&(identical(other.launchingAt, launchingAt) || other.launchingAt == launchingAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,launchingAt);

@override
String toString() {
  return 'LaunchingStatusModel(status: $status, launchingAt: $launchingAt)';
}


}

/// @nodoc
abstract mixin class _$LaunchingStatusModelCopyWith<$Res> implements $LaunchingStatusModelCopyWith<$Res> {
  factory _$LaunchingStatusModelCopyWith(_LaunchingStatusModel value, $Res Function(_LaunchingStatusModel) _then) = __$LaunchingStatusModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_launched_mobile') bool status,@JsonKey(name: 'launching_at') String? launchingAt
});




}
/// @nodoc
class __$LaunchingStatusModelCopyWithImpl<$Res>
    implements _$LaunchingStatusModelCopyWith<$Res> {
  __$LaunchingStatusModelCopyWithImpl(this._self, this._then);

  final _LaunchingStatusModel _self;
  final $Res Function(_LaunchingStatusModel) _then;

/// Create a copy of LaunchingStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? launchingAt = freezed,}) {
  return _then(_LaunchingStatusModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,launchingAt: freezed == launchingAt ? _self.launchingAt : launchingAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
