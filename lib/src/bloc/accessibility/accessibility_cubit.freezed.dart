// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accessibility_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccessibilityState {

 bool get hide;@JsonKey(name: 'top_accessibility') double get topAccessibility;@JsonKey(name: 'selected_color') bool get selectedColor;@JsonKey(name: 'index_color') int get indexColor;@JsonKey(name: 'reset_color') bool get resetColor;@JsonKey(name: 'magnifier_hide') bool get magnifierHide;@JsonKey(name: 'dragging_x') double get draggingX;@JsonKey(name: 'dragging_y') double get draggingY;@JsonKey(name: 'launching_status_model') LaunchingStatusModel get launchingStatusModel; List<int> get dateTimeComponent;
/// Create a copy of AccessibilityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccessibilityStateCopyWith<AccessibilityState> get copyWith => _$AccessibilityStateCopyWithImpl<AccessibilityState>(this as AccessibilityState, _$identity);

  /// Serializes this AccessibilityState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccessibilityState&&(identical(other.hide, hide) || other.hide == hide)&&(identical(other.topAccessibility, topAccessibility) || other.topAccessibility == topAccessibility)&&(identical(other.selectedColor, selectedColor) || other.selectedColor == selectedColor)&&(identical(other.indexColor, indexColor) || other.indexColor == indexColor)&&(identical(other.resetColor, resetColor) || other.resetColor == resetColor)&&(identical(other.magnifierHide, magnifierHide) || other.magnifierHide == magnifierHide)&&(identical(other.draggingX, draggingX) || other.draggingX == draggingX)&&(identical(other.draggingY, draggingY) || other.draggingY == draggingY)&&(identical(other.launchingStatusModel, launchingStatusModel) || other.launchingStatusModel == launchingStatusModel)&&const DeepCollectionEquality().equals(other.dateTimeComponent, dateTimeComponent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hide,topAccessibility,selectedColor,indexColor,resetColor,magnifierHide,draggingX,draggingY,launchingStatusModel,const DeepCollectionEquality().hash(dateTimeComponent));

@override
String toString() {
  return 'AccessibilityState(hide: $hide, topAccessibility: $topAccessibility, selectedColor: $selectedColor, indexColor: $indexColor, resetColor: $resetColor, magnifierHide: $magnifierHide, draggingX: $draggingX, draggingY: $draggingY, launchingStatusModel: $launchingStatusModel, dateTimeComponent: $dateTimeComponent)';
}


}

/// @nodoc
abstract mixin class $AccessibilityStateCopyWith<$Res>  {
  factory $AccessibilityStateCopyWith(AccessibilityState value, $Res Function(AccessibilityState) _then) = _$AccessibilityStateCopyWithImpl;
@useResult
$Res call({
 bool hide,@JsonKey(name: 'top_accessibility') double topAccessibility,@JsonKey(name: 'selected_color') bool selectedColor,@JsonKey(name: 'index_color') int indexColor,@JsonKey(name: 'reset_color') bool resetColor,@JsonKey(name: 'magnifier_hide') bool magnifierHide,@JsonKey(name: 'dragging_x') double draggingX,@JsonKey(name: 'dragging_y') double draggingY,@JsonKey(name: 'launching_status_model') LaunchingStatusModel launchingStatusModel, List<int> dateTimeComponent
});


$LaunchingStatusModelCopyWith<$Res> get launchingStatusModel;

}
/// @nodoc
class _$AccessibilityStateCopyWithImpl<$Res>
    implements $AccessibilityStateCopyWith<$Res> {
  _$AccessibilityStateCopyWithImpl(this._self, this._then);

  final AccessibilityState _self;
  final $Res Function(AccessibilityState) _then;

/// Create a copy of AccessibilityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hide = null,Object? topAccessibility = null,Object? selectedColor = null,Object? indexColor = null,Object? resetColor = null,Object? magnifierHide = null,Object? draggingX = null,Object? draggingY = null,Object? launchingStatusModel = null,Object? dateTimeComponent = null,}) {
  return _then(_self.copyWith(
hide: null == hide ? _self.hide : hide // ignore: cast_nullable_to_non_nullable
as bool,topAccessibility: null == topAccessibility ? _self.topAccessibility : topAccessibility // ignore: cast_nullable_to_non_nullable
as double,selectedColor: null == selectedColor ? _self.selectedColor : selectedColor // ignore: cast_nullable_to_non_nullable
as bool,indexColor: null == indexColor ? _self.indexColor : indexColor // ignore: cast_nullable_to_non_nullable
as int,resetColor: null == resetColor ? _self.resetColor : resetColor // ignore: cast_nullable_to_non_nullable
as bool,magnifierHide: null == magnifierHide ? _self.magnifierHide : magnifierHide // ignore: cast_nullable_to_non_nullable
as bool,draggingX: null == draggingX ? _self.draggingX : draggingX // ignore: cast_nullable_to_non_nullable
as double,draggingY: null == draggingY ? _self.draggingY : draggingY // ignore: cast_nullable_to_non_nullable
as double,launchingStatusModel: null == launchingStatusModel ? _self.launchingStatusModel : launchingStatusModel // ignore: cast_nullable_to_non_nullable
as LaunchingStatusModel,dateTimeComponent: null == dateTimeComponent ? _self.dateTimeComponent : dateTimeComponent // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}
/// Create a copy of AccessibilityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LaunchingStatusModelCopyWith<$Res> get launchingStatusModel {
  
  return $LaunchingStatusModelCopyWith<$Res>(_self.launchingStatusModel, (value) {
    return _then(_self.copyWith(launchingStatusModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccessibilityState].
extension AccessibilityStatePatterns on AccessibilityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccessibilityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccessibilityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccessibilityState value)  $default,){
final _that = this;
switch (_that) {
case _AccessibilityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccessibilityState value)?  $default,){
final _that = this;
switch (_that) {
case _AccessibilityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hide, @JsonKey(name: 'top_accessibility')  double topAccessibility, @JsonKey(name: 'selected_color')  bool selectedColor, @JsonKey(name: 'index_color')  int indexColor, @JsonKey(name: 'reset_color')  bool resetColor, @JsonKey(name: 'magnifier_hide')  bool magnifierHide, @JsonKey(name: 'dragging_x')  double draggingX, @JsonKey(name: 'dragging_y')  double draggingY, @JsonKey(name: 'launching_status_model')  LaunchingStatusModel launchingStatusModel,  List<int> dateTimeComponent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccessibilityState() when $default != null:
return $default(_that.hide,_that.topAccessibility,_that.selectedColor,_that.indexColor,_that.resetColor,_that.magnifierHide,_that.draggingX,_that.draggingY,_that.launchingStatusModel,_that.dateTimeComponent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hide, @JsonKey(name: 'top_accessibility')  double topAccessibility, @JsonKey(name: 'selected_color')  bool selectedColor, @JsonKey(name: 'index_color')  int indexColor, @JsonKey(name: 'reset_color')  bool resetColor, @JsonKey(name: 'magnifier_hide')  bool magnifierHide, @JsonKey(name: 'dragging_x')  double draggingX, @JsonKey(name: 'dragging_y')  double draggingY, @JsonKey(name: 'launching_status_model')  LaunchingStatusModel launchingStatusModel,  List<int> dateTimeComponent)  $default,) {final _that = this;
switch (_that) {
case _AccessibilityState():
return $default(_that.hide,_that.topAccessibility,_that.selectedColor,_that.indexColor,_that.resetColor,_that.magnifierHide,_that.draggingX,_that.draggingY,_that.launchingStatusModel,_that.dateTimeComponent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hide, @JsonKey(name: 'top_accessibility')  double topAccessibility, @JsonKey(name: 'selected_color')  bool selectedColor, @JsonKey(name: 'index_color')  int indexColor, @JsonKey(name: 'reset_color')  bool resetColor, @JsonKey(name: 'magnifier_hide')  bool magnifierHide, @JsonKey(name: 'dragging_x')  double draggingX, @JsonKey(name: 'dragging_y')  double draggingY, @JsonKey(name: 'launching_status_model')  LaunchingStatusModel launchingStatusModel,  List<int> dateTimeComponent)?  $default,) {final _that = this;
switch (_that) {
case _AccessibilityState() when $default != null:
return $default(_that.hide,_that.topAccessibility,_that.selectedColor,_that.indexColor,_that.resetColor,_that.magnifierHide,_that.draggingX,_that.draggingY,_that.launchingStatusModel,_that.dateTimeComponent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccessibilityState extends AccessibilityState {
   _AccessibilityState({required this.hide, @JsonKey(name: 'top_accessibility') required this.topAccessibility, @JsonKey(name: 'selected_color') required this.selectedColor, @JsonKey(name: 'index_color') required this.indexColor, @JsonKey(name: 'reset_color') required this.resetColor, @JsonKey(name: 'magnifier_hide') required this.magnifierHide, @JsonKey(name: 'dragging_x') required this.draggingX, @JsonKey(name: 'dragging_y') required this.draggingY, @JsonKey(name: 'launching_status_model') required this.launchingStatusModel, required final  List<int> dateTimeComponent}): _dateTimeComponent = dateTimeComponent,super._();
  factory _AccessibilityState.fromJson(Map<String, dynamic> json) => _$AccessibilityStateFromJson(json);

@override final  bool hide;
@override@JsonKey(name: 'top_accessibility') final  double topAccessibility;
@override@JsonKey(name: 'selected_color') final  bool selectedColor;
@override@JsonKey(name: 'index_color') final  int indexColor;
@override@JsonKey(name: 'reset_color') final  bool resetColor;
@override@JsonKey(name: 'magnifier_hide') final  bool magnifierHide;
@override@JsonKey(name: 'dragging_x') final  double draggingX;
@override@JsonKey(name: 'dragging_y') final  double draggingY;
@override@JsonKey(name: 'launching_status_model') final  LaunchingStatusModel launchingStatusModel;
 final  List<int> _dateTimeComponent;
@override List<int> get dateTimeComponent {
  if (_dateTimeComponent is EqualUnmodifiableListView) return _dateTimeComponent;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dateTimeComponent);
}


/// Create a copy of AccessibilityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccessibilityStateCopyWith<_AccessibilityState> get copyWith => __$AccessibilityStateCopyWithImpl<_AccessibilityState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccessibilityStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccessibilityState&&(identical(other.hide, hide) || other.hide == hide)&&(identical(other.topAccessibility, topAccessibility) || other.topAccessibility == topAccessibility)&&(identical(other.selectedColor, selectedColor) || other.selectedColor == selectedColor)&&(identical(other.indexColor, indexColor) || other.indexColor == indexColor)&&(identical(other.resetColor, resetColor) || other.resetColor == resetColor)&&(identical(other.magnifierHide, magnifierHide) || other.magnifierHide == magnifierHide)&&(identical(other.draggingX, draggingX) || other.draggingX == draggingX)&&(identical(other.draggingY, draggingY) || other.draggingY == draggingY)&&(identical(other.launchingStatusModel, launchingStatusModel) || other.launchingStatusModel == launchingStatusModel)&&const DeepCollectionEquality().equals(other._dateTimeComponent, _dateTimeComponent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hide,topAccessibility,selectedColor,indexColor,resetColor,magnifierHide,draggingX,draggingY,launchingStatusModel,const DeepCollectionEquality().hash(_dateTimeComponent));

@override
String toString() {
  return 'AccessibilityState(hide: $hide, topAccessibility: $topAccessibility, selectedColor: $selectedColor, indexColor: $indexColor, resetColor: $resetColor, magnifierHide: $magnifierHide, draggingX: $draggingX, draggingY: $draggingY, launchingStatusModel: $launchingStatusModel, dateTimeComponent: $dateTimeComponent)';
}


}

/// @nodoc
abstract mixin class _$AccessibilityStateCopyWith<$Res> implements $AccessibilityStateCopyWith<$Res> {
  factory _$AccessibilityStateCopyWith(_AccessibilityState value, $Res Function(_AccessibilityState) _then) = __$AccessibilityStateCopyWithImpl;
@override @useResult
$Res call({
 bool hide,@JsonKey(name: 'top_accessibility') double topAccessibility,@JsonKey(name: 'selected_color') bool selectedColor,@JsonKey(name: 'index_color') int indexColor,@JsonKey(name: 'reset_color') bool resetColor,@JsonKey(name: 'magnifier_hide') bool magnifierHide,@JsonKey(name: 'dragging_x') double draggingX,@JsonKey(name: 'dragging_y') double draggingY,@JsonKey(name: 'launching_status_model') LaunchingStatusModel launchingStatusModel, List<int> dateTimeComponent
});


@override $LaunchingStatusModelCopyWith<$Res> get launchingStatusModel;

}
/// @nodoc
class __$AccessibilityStateCopyWithImpl<$Res>
    implements _$AccessibilityStateCopyWith<$Res> {
  __$AccessibilityStateCopyWithImpl(this._self, this._then);

  final _AccessibilityState _self;
  final $Res Function(_AccessibilityState) _then;

/// Create a copy of AccessibilityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hide = null,Object? topAccessibility = null,Object? selectedColor = null,Object? indexColor = null,Object? resetColor = null,Object? magnifierHide = null,Object? draggingX = null,Object? draggingY = null,Object? launchingStatusModel = null,Object? dateTimeComponent = null,}) {
  return _then(_AccessibilityState(
hide: null == hide ? _self.hide : hide // ignore: cast_nullable_to_non_nullable
as bool,topAccessibility: null == topAccessibility ? _self.topAccessibility : topAccessibility // ignore: cast_nullable_to_non_nullable
as double,selectedColor: null == selectedColor ? _self.selectedColor : selectedColor // ignore: cast_nullable_to_non_nullable
as bool,indexColor: null == indexColor ? _self.indexColor : indexColor // ignore: cast_nullable_to_non_nullable
as int,resetColor: null == resetColor ? _self.resetColor : resetColor // ignore: cast_nullable_to_non_nullable
as bool,magnifierHide: null == magnifierHide ? _self.magnifierHide : magnifierHide // ignore: cast_nullable_to_non_nullable
as bool,draggingX: null == draggingX ? _self.draggingX : draggingX // ignore: cast_nullable_to_non_nullable
as double,draggingY: null == draggingY ? _self.draggingY : draggingY // ignore: cast_nullable_to_non_nullable
as double,launchingStatusModel: null == launchingStatusModel ? _self.launchingStatusModel : launchingStatusModel // ignore: cast_nullable_to_non_nullable
as LaunchingStatusModel,dateTimeComponent: null == dateTimeComponent ? _self._dateTimeComponent : dateTimeComponent // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

/// Create a copy of AccessibilityState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LaunchingStatusModelCopyWith<$Res> get launchingStatusModel {
  
  return $LaunchingStatusModelCopyWith<$Res>(_self.launchingStatusModel, (value) {
    return _then(_self.copyWith(launchingStatusModel: value));
  });
}
}

// dart format on
