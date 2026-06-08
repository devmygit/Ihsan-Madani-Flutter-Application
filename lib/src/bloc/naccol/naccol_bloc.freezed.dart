// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'naccol_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NaccolState {

 List<NaccolModel> get data; NaccolStatus get status; String get errorMessage;
/// Create a copy of NaccolState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NaccolStateCopyWith<NaccolState> get copyWith => _$NaccolStateCopyWithImpl<NaccolState>(this as NaccolState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NaccolState&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),status,errorMessage);

@override
String toString() {
  return 'NaccolState(data: $data, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $NaccolStateCopyWith<$Res>  {
  factory $NaccolStateCopyWith(NaccolState value, $Res Function(NaccolState) _then) = _$NaccolStateCopyWithImpl;
@useResult
$Res call({
 List<NaccolModel> data, NaccolStatus status, String errorMessage
});




}
/// @nodoc
class _$NaccolStateCopyWithImpl<$Res>
    implements $NaccolStateCopyWith<$Res> {
  _$NaccolStateCopyWithImpl(this._self, this._then);

  final NaccolState _self;
  final $Res Function(NaccolState) _then;

/// Create a copy of NaccolState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<NaccolModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NaccolStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NaccolState].
extension NaccolStatePatterns on NaccolState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NaccolState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NaccolState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NaccolState value)  $default,){
final _that = this;
switch (_that) {
case _NaccolState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NaccolState value)?  $default,){
final _that = this;
switch (_that) {
case _NaccolState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NaccolModel> data,  NaccolStatus status,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NaccolState() when $default != null:
return $default(_that.data,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NaccolModel> data,  NaccolStatus status,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _NaccolState():
return $default(_that.data,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NaccolModel> data,  NaccolStatus status,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _NaccolState() when $default != null:
return $default(_that.data,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _NaccolState implements NaccolState {
  const _NaccolState({required final  List<NaccolModel> data, required this.status, required this.errorMessage}): _data = data;
  

 final  List<NaccolModel> _data;
@override List<NaccolModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  NaccolStatus status;
@override final  String errorMessage;

/// Create a copy of NaccolState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NaccolStateCopyWith<_NaccolState> get copyWith => __$NaccolStateCopyWithImpl<_NaccolState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NaccolState&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),status,errorMessage);

@override
String toString() {
  return 'NaccolState(data: $data, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$NaccolStateCopyWith<$Res> implements $NaccolStateCopyWith<$Res> {
  factory _$NaccolStateCopyWith(_NaccolState value, $Res Function(_NaccolState) _then) = __$NaccolStateCopyWithImpl;
@override @useResult
$Res call({
 List<NaccolModel> data, NaccolStatus status, String errorMessage
});




}
/// @nodoc
class __$NaccolStateCopyWithImpl<$Res>
    implements _$NaccolStateCopyWith<$Res> {
  __$NaccolStateCopyWithImpl(this._self, this._then);

  final _NaccolState _self;
  final $Res Function(_NaccolState) _then;

/// Create a copy of NaccolState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_NaccolState(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<NaccolModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NaccolStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
