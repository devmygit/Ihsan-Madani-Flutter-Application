// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cluster_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClusterModel {

 String get clusterId; String get clusterTitle; String get shortName; String get clusterIcon; String get clusterImg;
/// Create a copy of ClusterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterModelCopyWith<ClusterModel> get copyWith => _$ClusterModelCopyWithImpl<ClusterModel>(this as ClusterModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterModel&&(identical(other.clusterId, clusterId) || other.clusterId == clusterId)&&(identical(other.clusterTitle, clusterTitle) || other.clusterTitle == clusterTitle)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.clusterIcon, clusterIcon) || other.clusterIcon == clusterIcon)&&(identical(other.clusterImg, clusterImg) || other.clusterImg == clusterImg));
}


@override
int get hashCode => Object.hash(runtimeType,clusterId,clusterTitle,shortName,clusterIcon,clusterImg);

@override
String toString() {
  return 'ClusterModel(clusterId: $clusterId, clusterTitle: $clusterTitle, shortName: $shortName, clusterIcon: $clusterIcon, clusterImg: $clusterImg)';
}


}

/// @nodoc
abstract mixin class $ClusterModelCopyWith<$Res>  {
  factory $ClusterModelCopyWith(ClusterModel value, $Res Function(ClusterModel) _then) = _$ClusterModelCopyWithImpl;
@useResult
$Res call({
 String clusterId, String clusterTitle, String shortName, String clusterIcon, String clusterImg
});




}
/// @nodoc
class _$ClusterModelCopyWithImpl<$Res>
    implements $ClusterModelCopyWith<$Res> {
  _$ClusterModelCopyWithImpl(this._self, this._then);

  final ClusterModel _self;
  final $Res Function(ClusterModel) _then;

/// Create a copy of ClusterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clusterId = null,Object? clusterTitle = null,Object? shortName = null,Object? clusterIcon = null,Object? clusterImg = null,}) {
  return _then(_self.copyWith(
clusterId: null == clusterId ? _self.clusterId : clusterId // ignore: cast_nullable_to_non_nullable
as String,clusterTitle: null == clusterTitle ? _self.clusterTitle : clusterTitle // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,clusterIcon: null == clusterIcon ? _self.clusterIcon : clusterIcon // ignore: cast_nullable_to_non_nullable
as String,clusterImg: null == clusterImg ? _self.clusterImg : clusterImg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClusterModel].
extension ClusterModelPatterns on ClusterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterModel value)  $default,){
final _that = this;
switch (_that) {
case _ClusterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clusterId,  String clusterTitle,  String shortName,  String clusterIcon,  String clusterImg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterModel() when $default != null:
return $default(_that.clusterId,_that.clusterTitle,_that.shortName,_that.clusterIcon,_that.clusterImg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clusterId,  String clusterTitle,  String shortName,  String clusterIcon,  String clusterImg)  $default,) {final _that = this;
switch (_that) {
case _ClusterModel():
return $default(_that.clusterId,_that.clusterTitle,_that.shortName,_that.clusterIcon,_that.clusterImg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clusterId,  String clusterTitle,  String shortName,  String clusterIcon,  String clusterImg)?  $default,) {final _that = this;
switch (_that) {
case _ClusterModel() when $default != null:
return $default(_that.clusterId,_that.clusterTitle,_that.shortName,_that.clusterIcon,_that.clusterImg);case _:
  return null;

}
}

}

/// @nodoc


class _ClusterModel implements ClusterModel {
   _ClusterModel({required this.clusterId, required this.clusterTitle, required this.shortName, required this.clusterIcon, required this.clusterImg});
  

@override final  String clusterId;
@override final  String clusterTitle;
@override final  String shortName;
@override final  String clusterIcon;
@override final  String clusterImg;

/// Create a copy of ClusterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterModelCopyWith<_ClusterModel> get copyWith => __$ClusterModelCopyWithImpl<_ClusterModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterModel&&(identical(other.clusterId, clusterId) || other.clusterId == clusterId)&&(identical(other.clusterTitle, clusterTitle) || other.clusterTitle == clusterTitle)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.clusterIcon, clusterIcon) || other.clusterIcon == clusterIcon)&&(identical(other.clusterImg, clusterImg) || other.clusterImg == clusterImg));
}


@override
int get hashCode => Object.hash(runtimeType,clusterId,clusterTitle,shortName,clusterIcon,clusterImg);

@override
String toString() {
  return 'ClusterModel(clusterId: $clusterId, clusterTitle: $clusterTitle, shortName: $shortName, clusterIcon: $clusterIcon, clusterImg: $clusterImg)';
}


}

/// @nodoc
abstract mixin class _$ClusterModelCopyWith<$Res> implements $ClusterModelCopyWith<$Res> {
  factory _$ClusterModelCopyWith(_ClusterModel value, $Res Function(_ClusterModel) _then) = __$ClusterModelCopyWithImpl;
@override @useResult
$Res call({
 String clusterId, String clusterTitle, String shortName, String clusterIcon, String clusterImg
});




}
/// @nodoc
class __$ClusterModelCopyWithImpl<$Res>
    implements _$ClusterModelCopyWith<$Res> {
  __$ClusterModelCopyWithImpl(this._self, this._then);

  final _ClusterModel _self;
  final $Res Function(_ClusterModel) _then;

/// Create a copy of ClusterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clusterId = null,Object? clusterTitle = null,Object? shortName = null,Object? clusterIcon = null,Object? clusterImg = null,}) {
  return _then(_ClusterModel(
clusterId: null == clusterId ? _self.clusterId : clusterId // ignore: cast_nullable_to_non_nullable
as String,clusterTitle: null == clusterTitle ? _self.clusterTitle : clusterTitle // ignore: cast_nullable_to_non_nullable
as String,shortName: null == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String,clusterIcon: null == clusterIcon ? _self.clusterIcon : clusterIcon // ignore: cast_nullable_to_non_nullable
as String,clusterImg: null == clusterImg ? _self.clusterImg : clusterImg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$InitiativeDetailOption {

 int get id; String get name; String get iconPath; String? get activeIconPath;
/// Create a copy of InitiativeDetailOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitiativeDetailOptionCopyWith<InitiativeDetailOption> get copyWith => _$InitiativeDetailOptionCopyWithImpl<InitiativeDetailOption>(this as InitiativeDetailOption, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitiativeDetailOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath)&&(identical(other.activeIconPath, activeIconPath) || other.activeIconPath == activeIconPath));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,iconPath,activeIconPath);

@override
String toString() {
  return 'InitiativeDetailOption(id: $id, name: $name, iconPath: $iconPath, activeIconPath: $activeIconPath)';
}


}

/// @nodoc
abstract mixin class $InitiativeDetailOptionCopyWith<$Res>  {
  factory $InitiativeDetailOptionCopyWith(InitiativeDetailOption value, $Res Function(InitiativeDetailOption) _then) = _$InitiativeDetailOptionCopyWithImpl;
@useResult
$Res call({
 int id, String name, String iconPath, String? activeIconPath
});




}
/// @nodoc
class _$InitiativeDetailOptionCopyWithImpl<$Res>
    implements $InitiativeDetailOptionCopyWith<$Res> {
  _$InitiativeDetailOptionCopyWithImpl(this._self, this._then);

  final InitiativeDetailOption _self;
  final $Res Function(InitiativeDetailOption) _then;

/// Create a copy of InitiativeDetailOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? iconPath = null,Object? activeIconPath = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconPath: null == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String,activeIconPath: freezed == activeIconPath ? _self.activeIconPath : activeIconPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InitiativeDetailOption].
extension InitiativeDetailOptionPatterns on InitiativeDetailOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InitiativeDetailOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitiativeDetailOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InitiativeDetailOption value)  $default,){
final _that = this;
switch (_that) {
case _InitiativeDetailOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InitiativeDetailOption value)?  $default,){
final _that = this;
switch (_that) {
case _InitiativeDetailOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String iconPath,  String? activeIconPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitiativeDetailOption() when $default != null:
return $default(_that.id,_that.name,_that.iconPath,_that.activeIconPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String iconPath,  String? activeIconPath)  $default,) {final _that = this;
switch (_that) {
case _InitiativeDetailOption():
return $default(_that.id,_that.name,_that.iconPath,_that.activeIconPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String iconPath,  String? activeIconPath)?  $default,) {final _that = this;
switch (_that) {
case _InitiativeDetailOption() when $default != null:
return $default(_that.id,_that.name,_that.iconPath,_that.activeIconPath);case _:
  return null;

}
}

}

/// @nodoc


class _InitiativeDetailOption implements InitiativeDetailOption {
   _InitiativeDetailOption({required this.id, required this.name, required this.iconPath, this.activeIconPath});
  

@override final  int id;
@override final  String name;
@override final  String iconPath;
@override final  String? activeIconPath;

/// Create a copy of InitiativeDetailOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitiativeDetailOptionCopyWith<_InitiativeDetailOption> get copyWith => __$InitiativeDetailOptionCopyWithImpl<_InitiativeDetailOption>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitiativeDetailOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconPath, iconPath) || other.iconPath == iconPath)&&(identical(other.activeIconPath, activeIconPath) || other.activeIconPath == activeIconPath));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,iconPath,activeIconPath);

@override
String toString() {
  return 'InitiativeDetailOption(id: $id, name: $name, iconPath: $iconPath, activeIconPath: $activeIconPath)';
}


}

/// @nodoc
abstract mixin class _$InitiativeDetailOptionCopyWith<$Res> implements $InitiativeDetailOptionCopyWith<$Res> {
  factory _$InitiativeDetailOptionCopyWith(_InitiativeDetailOption value, $Res Function(_InitiativeDetailOption) _then) = __$InitiativeDetailOptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String iconPath, String? activeIconPath
});




}
/// @nodoc
class __$InitiativeDetailOptionCopyWithImpl<$Res>
    implements _$InitiativeDetailOptionCopyWith<$Res> {
  __$InitiativeDetailOptionCopyWithImpl(this._self, this._then);

  final _InitiativeDetailOption _self;
  final $Res Function(_InitiativeDetailOption) _then;

/// Create a copy of InitiativeDetailOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? iconPath = null,Object? activeIconPath = freezed,}) {
  return _then(_InitiativeDetailOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconPath: null == iconPath ? _self.iconPath : iconPath // ignore: cast_nullable_to_non_nullable
as String,activeIconPath: freezed == activeIconPath ? _self.activeIconPath : activeIconPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
