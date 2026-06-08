// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initiative_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InitiativeState {

 InitiativeStatus get status; GetInitiativeStatus get getInitiativeStatus; DetailInitiativeStatus get detailInitiativeStatus; String get currentCluster; Pagination<InitiativeModel> get initiative; InitiativeModel get initiativeDetail; String get errorMessage;
/// Create a copy of InitiativeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitiativeStateCopyWith<InitiativeState> get copyWith => _$InitiativeStateCopyWithImpl<InitiativeState>(this as InitiativeState, _$identity);

  /// Serializes this InitiativeState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitiativeState&&(identical(other.status, status) || other.status == status)&&(identical(other.getInitiativeStatus, getInitiativeStatus) || other.getInitiativeStatus == getInitiativeStatus)&&(identical(other.detailInitiativeStatus, detailInitiativeStatus) || other.detailInitiativeStatus == detailInitiativeStatus)&&(identical(other.currentCluster, currentCluster) || other.currentCluster == currentCluster)&&(identical(other.initiative, initiative) || other.initiative == initiative)&&(identical(other.initiativeDetail, initiativeDetail) || other.initiativeDetail == initiativeDetail)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,getInitiativeStatus,detailInitiativeStatus,currentCluster,initiative,initiativeDetail,errorMessage);

@override
String toString() {
  return 'InitiativeState(status: $status, getInitiativeStatus: $getInitiativeStatus, detailInitiativeStatus: $detailInitiativeStatus, currentCluster: $currentCluster, initiative: $initiative, initiativeDetail: $initiativeDetail, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $InitiativeStateCopyWith<$Res>  {
  factory $InitiativeStateCopyWith(InitiativeState value, $Res Function(InitiativeState) _then) = _$InitiativeStateCopyWithImpl;
@useResult
$Res call({
 InitiativeStatus status, GetInitiativeStatus getInitiativeStatus, DetailInitiativeStatus detailInitiativeStatus, String currentCluster, Pagination<InitiativeModel> initiative, InitiativeModel initiativeDetail, String errorMessage
});


$InitiativeModelCopyWith<$Res> get initiativeDetail;

}
/// @nodoc
class _$InitiativeStateCopyWithImpl<$Res>
    implements $InitiativeStateCopyWith<$Res> {
  _$InitiativeStateCopyWithImpl(this._self, this._then);

  final InitiativeState _self;
  final $Res Function(InitiativeState) _then;

/// Create a copy of InitiativeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? getInitiativeStatus = null,Object? detailInitiativeStatus = null,Object? currentCluster = null,Object? initiative = null,Object? initiativeDetail = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InitiativeStatus,getInitiativeStatus: null == getInitiativeStatus ? _self.getInitiativeStatus : getInitiativeStatus // ignore: cast_nullable_to_non_nullable
as GetInitiativeStatus,detailInitiativeStatus: null == detailInitiativeStatus ? _self.detailInitiativeStatus : detailInitiativeStatus // ignore: cast_nullable_to_non_nullable
as DetailInitiativeStatus,currentCluster: null == currentCluster ? _self.currentCluster : currentCluster // ignore: cast_nullable_to_non_nullable
as String,initiative: null == initiative ? _self.initiative : initiative // ignore: cast_nullable_to_non_nullable
as Pagination<InitiativeModel>,initiativeDetail: null == initiativeDetail ? _self.initiativeDetail : initiativeDetail // ignore: cast_nullable_to_non_nullable
as InitiativeModel,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of InitiativeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InitiativeModelCopyWith<$Res> get initiativeDetail {
  
  return $InitiativeModelCopyWith<$Res>(_self.initiativeDetail, (value) {
    return _then(_self.copyWith(initiativeDetail: value));
  });
}
}


/// Adds pattern-matching-related methods to [InitiativeState].
extension InitiativeStatePatterns on InitiativeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InitiativeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitiativeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InitiativeState value)  $default,){
final _that = this;
switch (_that) {
case _InitiativeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InitiativeState value)?  $default,){
final _that = this;
switch (_that) {
case _InitiativeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InitiativeStatus status,  GetInitiativeStatus getInitiativeStatus,  DetailInitiativeStatus detailInitiativeStatus,  String currentCluster,  Pagination<InitiativeModel> initiative,  InitiativeModel initiativeDetail,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitiativeState() when $default != null:
return $default(_that.status,_that.getInitiativeStatus,_that.detailInitiativeStatus,_that.currentCluster,_that.initiative,_that.initiativeDetail,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InitiativeStatus status,  GetInitiativeStatus getInitiativeStatus,  DetailInitiativeStatus detailInitiativeStatus,  String currentCluster,  Pagination<InitiativeModel> initiative,  InitiativeModel initiativeDetail,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _InitiativeState():
return $default(_that.status,_that.getInitiativeStatus,_that.detailInitiativeStatus,_that.currentCluster,_that.initiative,_that.initiativeDetail,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InitiativeStatus status,  GetInitiativeStatus getInitiativeStatus,  DetailInitiativeStatus detailInitiativeStatus,  String currentCluster,  Pagination<InitiativeModel> initiative,  InitiativeModel initiativeDetail,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _InitiativeState() when $default != null:
return $default(_that.status,_that.getInitiativeStatus,_that.detailInitiativeStatus,_that.currentCluster,_that.initiative,_that.initiativeDetail,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InitiativeState extends InitiativeState {
   _InitiativeState({required this.status, required this.getInitiativeStatus, required this.detailInitiativeStatus, required this.currentCluster, required this.initiative, required this.initiativeDetail, required this.errorMessage}): super._();
  factory _InitiativeState.fromJson(Map<String, dynamic> json) => _$InitiativeStateFromJson(json);

@override final  InitiativeStatus status;
@override final  GetInitiativeStatus getInitiativeStatus;
@override final  DetailInitiativeStatus detailInitiativeStatus;
@override final  String currentCluster;
@override final  Pagination<InitiativeModel> initiative;
@override final  InitiativeModel initiativeDetail;
@override final  String errorMessage;

/// Create a copy of InitiativeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitiativeStateCopyWith<_InitiativeState> get copyWith => __$InitiativeStateCopyWithImpl<_InitiativeState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InitiativeStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitiativeState&&(identical(other.status, status) || other.status == status)&&(identical(other.getInitiativeStatus, getInitiativeStatus) || other.getInitiativeStatus == getInitiativeStatus)&&(identical(other.detailInitiativeStatus, detailInitiativeStatus) || other.detailInitiativeStatus == detailInitiativeStatus)&&(identical(other.currentCluster, currentCluster) || other.currentCluster == currentCluster)&&(identical(other.initiative, initiative) || other.initiative == initiative)&&(identical(other.initiativeDetail, initiativeDetail) || other.initiativeDetail == initiativeDetail)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,getInitiativeStatus,detailInitiativeStatus,currentCluster,initiative,initiativeDetail,errorMessage);

@override
String toString() {
  return 'InitiativeState(status: $status, getInitiativeStatus: $getInitiativeStatus, detailInitiativeStatus: $detailInitiativeStatus, currentCluster: $currentCluster, initiative: $initiative, initiativeDetail: $initiativeDetail, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$InitiativeStateCopyWith<$Res> implements $InitiativeStateCopyWith<$Res> {
  factory _$InitiativeStateCopyWith(_InitiativeState value, $Res Function(_InitiativeState) _then) = __$InitiativeStateCopyWithImpl;
@override @useResult
$Res call({
 InitiativeStatus status, GetInitiativeStatus getInitiativeStatus, DetailInitiativeStatus detailInitiativeStatus, String currentCluster, Pagination<InitiativeModel> initiative, InitiativeModel initiativeDetail, String errorMessage
});


@override $InitiativeModelCopyWith<$Res> get initiativeDetail;

}
/// @nodoc
class __$InitiativeStateCopyWithImpl<$Res>
    implements _$InitiativeStateCopyWith<$Res> {
  __$InitiativeStateCopyWithImpl(this._self, this._then);

  final _InitiativeState _self;
  final $Res Function(_InitiativeState) _then;

/// Create a copy of InitiativeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? getInitiativeStatus = null,Object? detailInitiativeStatus = null,Object? currentCluster = null,Object? initiative = null,Object? initiativeDetail = null,Object? errorMessage = null,}) {
  return _then(_InitiativeState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InitiativeStatus,getInitiativeStatus: null == getInitiativeStatus ? _self.getInitiativeStatus : getInitiativeStatus // ignore: cast_nullable_to_non_nullable
as GetInitiativeStatus,detailInitiativeStatus: null == detailInitiativeStatus ? _self.detailInitiativeStatus : detailInitiativeStatus // ignore: cast_nullable_to_non_nullable
as DetailInitiativeStatus,currentCluster: null == currentCluster ? _self.currentCluster : currentCluster // ignore: cast_nullable_to_non_nullable
as String,initiative: null == initiative ? _self.initiative : initiative // ignore: cast_nullable_to_non_nullable
as Pagination<InitiativeModel>,initiativeDetail: null == initiativeDetail ? _self.initiativeDetail : initiativeDetail // ignore: cast_nullable_to_non_nullable
as InitiativeModel,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of InitiativeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InitiativeModelCopyWith<$Res> get initiativeDetail {
  
  return $InitiativeModelCopyWith<$Res>(_self.initiativeDetail, (value) {
    return _then(_self.copyWith(initiativeDetail: value));
  });
}
}

// dart format on
