// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'module_route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModuleRoute {

 String? get currentRoute; String? get previousRoute;
/// Create a copy of ModuleRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModuleRouteCopyWith<ModuleRoute> get copyWith => _$ModuleRouteCopyWithImpl<ModuleRoute>(this as ModuleRoute, _$identity);

  /// Serializes this ModuleRoute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModuleRoute&&(identical(other.currentRoute, currentRoute) || other.currentRoute == currentRoute)&&(identical(other.previousRoute, previousRoute) || other.previousRoute == previousRoute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentRoute,previousRoute);

@override
String toString() {
  return 'ModuleRoute(currentRoute: $currentRoute, previousRoute: $previousRoute)';
}


}

/// @nodoc
abstract mixin class $ModuleRouteCopyWith<$Res>  {
  factory $ModuleRouteCopyWith(ModuleRoute value, $Res Function(ModuleRoute) _then) = _$ModuleRouteCopyWithImpl;
@useResult
$Res call({
 String? currentRoute, String? previousRoute
});




}
/// @nodoc
class _$ModuleRouteCopyWithImpl<$Res>
    implements $ModuleRouteCopyWith<$Res> {
  _$ModuleRouteCopyWithImpl(this._self, this._then);

  final ModuleRoute _self;
  final $Res Function(ModuleRoute) _then;

/// Create a copy of ModuleRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentRoute = freezed,Object? previousRoute = freezed,}) {
  return _then(_self.copyWith(
currentRoute: freezed == currentRoute ? _self.currentRoute : currentRoute // ignore: cast_nullable_to_non_nullable
as String?,previousRoute: freezed == previousRoute ? _self.previousRoute : previousRoute // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModuleRoute].
extension ModuleRoutePatterns on ModuleRoute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModuleRoute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModuleRoute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModuleRoute value)  $default,){
final _that = this;
switch (_that) {
case _ModuleRoute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModuleRoute value)?  $default,){
final _that = this;
switch (_that) {
case _ModuleRoute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? currentRoute,  String? previousRoute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModuleRoute() when $default != null:
return $default(_that.currentRoute,_that.previousRoute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? currentRoute,  String? previousRoute)  $default,) {final _that = this;
switch (_that) {
case _ModuleRoute():
return $default(_that.currentRoute,_that.previousRoute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? currentRoute,  String? previousRoute)?  $default,) {final _that = this;
switch (_that) {
case _ModuleRoute() when $default != null:
return $default(_that.currentRoute,_that.previousRoute);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModuleRoute implements ModuleRoute {
  const _ModuleRoute({this.currentRoute, this.previousRoute});
  factory _ModuleRoute.fromJson(Map<String, dynamic> json) => _$ModuleRouteFromJson(json);

@override final  String? currentRoute;
@override final  String? previousRoute;

/// Create a copy of ModuleRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModuleRouteCopyWith<_ModuleRoute> get copyWith => __$ModuleRouteCopyWithImpl<_ModuleRoute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModuleRouteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModuleRoute&&(identical(other.currentRoute, currentRoute) || other.currentRoute == currentRoute)&&(identical(other.previousRoute, previousRoute) || other.previousRoute == previousRoute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentRoute,previousRoute);

@override
String toString() {
  return 'ModuleRoute(currentRoute: $currentRoute, previousRoute: $previousRoute)';
}


}

/// @nodoc
abstract mixin class _$ModuleRouteCopyWith<$Res> implements $ModuleRouteCopyWith<$Res> {
  factory _$ModuleRouteCopyWith(_ModuleRoute value, $Res Function(_ModuleRoute) _then) = __$ModuleRouteCopyWithImpl;
@override @useResult
$Res call({
 String? currentRoute, String? previousRoute
});




}
/// @nodoc
class __$ModuleRouteCopyWithImpl<$Res>
    implements _$ModuleRouteCopyWith<$Res> {
  __$ModuleRouteCopyWithImpl(this._self, this._then);

  final _ModuleRoute _self;
  final $Res Function(_ModuleRoute) _then;

/// Create a copy of ModuleRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentRoute = freezed,Object? previousRoute = freezed,}) {
  return _then(_ModuleRoute(
currentRoute: freezed == currentRoute ? _self.currentRoute : currentRoute // ignore: cast_nullable_to_non_nullable
as String?,previousRoute: freezed == previousRoute ? _self.previousRoute : previousRoute // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
