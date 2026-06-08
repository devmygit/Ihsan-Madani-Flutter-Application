// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BottomBarState {

 Object? get argument; int get index; int get counter; ModuleRoute get homeRoute; ModuleRoute get initiativeRoute; ModuleRoute get informationRoute;
/// Create a copy of BottomBarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BottomBarStateCopyWith<BottomBarState> get copyWith => _$BottomBarStateCopyWithImpl<BottomBarState>(this as BottomBarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BottomBarState&&const DeepCollectionEquality().equals(other.argument, argument)&&(identical(other.index, index) || other.index == index)&&(identical(other.counter, counter) || other.counter == counter)&&(identical(other.homeRoute, homeRoute) || other.homeRoute == homeRoute)&&(identical(other.initiativeRoute, initiativeRoute) || other.initiativeRoute == initiativeRoute)&&(identical(other.informationRoute, informationRoute) || other.informationRoute == informationRoute));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(argument),index,counter,homeRoute,initiativeRoute,informationRoute);

@override
String toString() {
  return 'BottomBarState(argument: $argument, index: $index, counter: $counter, homeRoute: $homeRoute, initiativeRoute: $initiativeRoute, informationRoute: $informationRoute)';
}


}

/// @nodoc
abstract mixin class $BottomBarStateCopyWith<$Res>  {
  factory $BottomBarStateCopyWith(BottomBarState value, $Res Function(BottomBarState) _then) = _$BottomBarStateCopyWithImpl;
@useResult
$Res call({
 Object? argument, int index, int counter, ModuleRoute homeRoute, ModuleRoute initiativeRoute, ModuleRoute informationRoute
});


$ModuleRouteCopyWith<$Res> get homeRoute;$ModuleRouteCopyWith<$Res> get initiativeRoute;$ModuleRouteCopyWith<$Res> get informationRoute;

}
/// @nodoc
class _$BottomBarStateCopyWithImpl<$Res>
    implements $BottomBarStateCopyWith<$Res> {
  _$BottomBarStateCopyWithImpl(this._self, this._then);

  final BottomBarState _self;
  final $Res Function(BottomBarState) _then;

/// Create a copy of BottomBarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? argument = freezed,Object? index = null,Object? counter = null,Object? homeRoute = null,Object? initiativeRoute = null,Object? informationRoute = null,}) {
  return _then(_self.copyWith(
argument: freezed == argument ? _self.argument : argument ,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,counter: null == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as int,homeRoute: null == homeRoute ? _self.homeRoute : homeRoute // ignore: cast_nullable_to_non_nullable
as ModuleRoute,initiativeRoute: null == initiativeRoute ? _self.initiativeRoute : initiativeRoute // ignore: cast_nullable_to_non_nullable
as ModuleRoute,informationRoute: null == informationRoute ? _self.informationRoute : informationRoute // ignore: cast_nullable_to_non_nullable
as ModuleRoute,
  ));
}
/// Create a copy of BottomBarState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModuleRouteCopyWith<$Res> get homeRoute {
  
  return $ModuleRouteCopyWith<$Res>(_self.homeRoute, (value) {
    return _then(_self.copyWith(homeRoute: value));
  });
}/// Create a copy of BottomBarState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModuleRouteCopyWith<$Res> get initiativeRoute {
  
  return $ModuleRouteCopyWith<$Res>(_self.initiativeRoute, (value) {
    return _then(_self.copyWith(initiativeRoute: value));
  });
}/// Create a copy of BottomBarState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModuleRouteCopyWith<$Res> get informationRoute {
  
  return $ModuleRouteCopyWith<$Res>(_self.informationRoute, (value) {
    return _then(_self.copyWith(informationRoute: value));
  });
}
}


/// Adds pattern-matching-related methods to [BottomBarState].
extension BottomBarStatePatterns on BottomBarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BottomBarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BottomBarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BottomBarState value)  $default,){
final _that = this;
switch (_that) {
case _BottomBarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BottomBarState value)?  $default,){
final _that = this;
switch (_that) {
case _BottomBarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Object? argument,  int index,  int counter,  ModuleRoute homeRoute,  ModuleRoute initiativeRoute,  ModuleRoute informationRoute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BottomBarState() when $default != null:
return $default(_that.argument,_that.index,_that.counter,_that.homeRoute,_that.initiativeRoute,_that.informationRoute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Object? argument,  int index,  int counter,  ModuleRoute homeRoute,  ModuleRoute initiativeRoute,  ModuleRoute informationRoute)  $default,) {final _that = this;
switch (_that) {
case _BottomBarState():
return $default(_that.argument,_that.index,_that.counter,_that.homeRoute,_that.initiativeRoute,_that.informationRoute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Object? argument,  int index,  int counter,  ModuleRoute homeRoute,  ModuleRoute initiativeRoute,  ModuleRoute informationRoute)?  $default,) {final _that = this;
switch (_that) {
case _BottomBarState() when $default != null:
return $default(_that.argument,_that.index,_that.counter,_that.homeRoute,_that.initiativeRoute,_that.informationRoute);case _:
  return null;

}
}

}

/// @nodoc


class _BottomBarState implements BottomBarState {
  const _BottomBarState({this.argument, required this.index, required this.counter, required this.homeRoute, required this.initiativeRoute, required this.informationRoute});
  

@override final  Object? argument;
@override final  int index;
@override final  int counter;
@override final  ModuleRoute homeRoute;
@override final  ModuleRoute initiativeRoute;
@override final  ModuleRoute informationRoute;

/// Create a copy of BottomBarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BottomBarStateCopyWith<_BottomBarState> get copyWith => __$BottomBarStateCopyWithImpl<_BottomBarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BottomBarState&&const DeepCollectionEquality().equals(other.argument, argument)&&(identical(other.index, index) || other.index == index)&&(identical(other.counter, counter) || other.counter == counter)&&(identical(other.homeRoute, homeRoute) || other.homeRoute == homeRoute)&&(identical(other.initiativeRoute, initiativeRoute) || other.initiativeRoute == initiativeRoute)&&(identical(other.informationRoute, informationRoute) || other.informationRoute == informationRoute));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(argument),index,counter,homeRoute,initiativeRoute,informationRoute);

@override
String toString() {
  return 'BottomBarState(argument: $argument, index: $index, counter: $counter, homeRoute: $homeRoute, initiativeRoute: $initiativeRoute, informationRoute: $informationRoute)';
}


}

/// @nodoc
abstract mixin class _$BottomBarStateCopyWith<$Res> implements $BottomBarStateCopyWith<$Res> {
  factory _$BottomBarStateCopyWith(_BottomBarState value, $Res Function(_BottomBarState) _then) = __$BottomBarStateCopyWithImpl;
@override @useResult
$Res call({
 Object? argument, int index, int counter, ModuleRoute homeRoute, ModuleRoute initiativeRoute, ModuleRoute informationRoute
});


@override $ModuleRouteCopyWith<$Res> get homeRoute;@override $ModuleRouteCopyWith<$Res> get initiativeRoute;@override $ModuleRouteCopyWith<$Res> get informationRoute;

}
/// @nodoc
class __$BottomBarStateCopyWithImpl<$Res>
    implements _$BottomBarStateCopyWith<$Res> {
  __$BottomBarStateCopyWithImpl(this._self, this._then);

  final _BottomBarState _self;
  final $Res Function(_BottomBarState) _then;

/// Create a copy of BottomBarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? argument = freezed,Object? index = null,Object? counter = null,Object? homeRoute = null,Object? initiativeRoute = null,Object? informationRoute = null,}) {
  return _then(_BottomBarState(
argument: freezed == argument ? _self.argument : argument ,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,counter: null == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as int,homeRoute: null == homeRoute ? _self.homeRoute : homeRoute // ignore: cast_nullable_to_non_nullable
as ModuleRoute,initiativeRoute: null == initiativeRoute ? _self.initiativeRoute : initiativeRoute // ignore: cast_nullable_to_non_nullable
as ModuleRoute,informationRoute: null == informationRoute ? _self.informationRoute : informationRoute // ignore: cast_nullable_to_non_nullable
as ModuleRoute,
  ));
}

/// Create a copy of BottomBarState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModuleRouteCopyWith<$Res> get homeRoute {
  
  return $ModuleRouteCopyWith<$Res>(_self.homeRoute, (value) {
    return _then(_self.copyWith(homeRoute: value));
  });
}/// Create a copy of BottomBarState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModuleRouteCopyWith<$Res> get initiativeRoute {
  
  return $ModuleRouteCopyWith<$Res>(_self.initiativeRoute, (value) {
    return _then(_self.copyWith(initiativeRoute: value));
  });
}/// Create a copy of BottomBarState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModuleRouteCopyWith<$Res> get informationRoute {
  
  return $ModuleRouteCopyWith<$Res>(_self.informationRoute, (value) {
    return _then(_self.copyWith(informationRoute: value));
  });
}
}

// dart format on
