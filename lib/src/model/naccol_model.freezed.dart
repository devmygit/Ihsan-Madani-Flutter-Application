// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'naccol_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NaccolModel {

 String get id; String get tajuk; String get kandungan;@JsonKey(name: 'kandungan_processed') String? get kandunganProcessed; int get sequence;
/// Create a copy of NaccolModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NaccolModelCopyWith<NaccolModel> get copyWith => _$NaccolModelCopyWithImpl<NaccolModel>(this as NaccolModel, _$identity);

  /// Serializes this NaccolModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NaccolModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tajuk, tajuk) || other.tajuk == tajuk)&&(identical(other.kandungan, kandungan) || other.kandungan == kandungan)&&(identical(other.kandunganProcessed, kandunganProcessed) || other.kandunganProcessed == kandunganProcessed)&&(identical(other.sequence, sequence) || other.sequence == sequence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tajuk,kandungan,kandunganProcessed,sequence);

@override
String toString() {
  return 'NaccolModel(id: $id, tajuk: $tajuk, kandungan: $kandungan, kandunganProcessed: $kandunganProcessed, sequence: $sequence)';
}


}

/// @nodoc
abstract mixin class $NaccolModelCopyWith<$Res>  {
  factory $NaccolModelCopyWith(NaccolModel value, $Res Function(NaccolModel) _then) = _$NaccolModelCopyWithImpl;
@useResult
$Res call({
 String id, String tajuk, String kandungan,@JsonKey(name: 'kandungan_processed') String? kandunganProcessed, int sequence
});




}
/// @nodoc
class _$NaccolModelCopyWithImpl<$Res>
    implements $NaccolModelCopyWith<$Res> {
  _$NaccolModelCopyWithImpl(this._self, this._then);

  final NaccolModel _self;
  final $Res Function(NaccolModel) _then;

/// Create a copy of NaccolModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tajuk = null,Object? kandungan = null,Object? kandunganProcessed = freezed,Object? sequence = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tajuk: null == tajuk ? _self.tajuk : tajuk // ignore: cast_nullable_to_non_nullable
as String,kandungan: null == kandungan ? _self.kandungan : kandungan // ignore: cast_nullable_to_non_nullable
as String,kandunganProcessed: freezed == kandunganProcessed ? _self.kandunganProcessed : kandunganProcessed // ignore: cast_nullable_to_non_nullable
as String?,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NaccolModel].
extension NaccolModelPatterns on NaccolModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NaccolModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NaccolModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NaccolModel value)  $default,){
final _that = this;
switch (_that) {
case _NaccolModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NaccolModel value)?  $default,){
final _that = this;
switch (_that) {
case _NaccolModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tajuk,  String kandungan, @JsonKey(name: 'kandungan_processed')  String? kandunganProcessed,  int sequence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NaccolModel() when $default != null:
return $default(_that.id,_that.tajuk,_that.kandungan,_that.kandunganProcessed,_that.sequence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tajuk,  String kandungan, @JsonKey(name: 'kandungan_processed')  String? kandunganProcessed,  int sequence)  $default,) {final _that = this;
switch (_that) {
case _NaccolModel():
return $default(_that.id,_that.tajuk,_that.kandungan,_that.kandunganProcessed,_that.sequence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tajuk,  String kandungan, @JsonKey(name: 'kandungan_processed')  String? kandunganProcessed,  int sequence)?  $default,) {final _that = this;
switch (_that) {
case _NaccolModel() when $default != null:
return $default(_that.id,_that.tajuk,_that.kandungan,_that.kandunganProcessed,_that.sequence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NaccolModel implements NaccolModel {
  const _NaccolModel({required this.id, required this.tajuk, required this.kandungan, @JsonKey(name: 'kandungan_processed') this.kandunganProcessed, required this.sequence});
  factory _NaccolModel.fromJson(Map<String, dynamic> json) => _$NaccolModelFromJson(json);

@override final  String id;
@override final  String tajuk;
@override final  String kandungan;
@override@JsonKey(name: 'kandungan_processed') final  String? kandunganProcessed;
@override final  int sequence;

/// Create a copy of NaccolModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NaccolModelCopyWith<_NaccolModel> get copyWith => __$NaccolModelCopyWithImpl<_NaccolModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NaccolModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NaccolModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tajuk, tajuk) || other.tajuk == tajuk)&&(identical(other.kandungan, kandungan) || other.kandungan == kandungan)&&(identical(other.kandunganProcessed, kandunganProcessed) || other.kandunganProcessed == kandunganProcessed)&&(identical(other.sequence, sequence) || other.sequence == sequence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tajuk,kandungan,kandunganProcessed,sequence);

@override
String toString() {
  return 'NaccolModel(id: $id, tajuk: $tajuk, kandungan: $kandungan, kandunganProcessed: $kandunganProcessed, sequence: $sequence)';
}


}

/// @nodoc
abstract mixin class _$NaccolModelCopyWith<$Res> implements $NaccolModelCopyWith<$Res> {
  factory _$NaccolModelCopyWith(_NaccolModel value, $Res Function(_NaccolModel) _then) = __$NaccolModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String tajuk, String kandungan,@JsonKey(name: 'kandungan_processed') String? kandunganProcessed, int sequence
});




}
/// @nodoc
class __$NaccolModelCopyWithImpl<$Res>
    implements _$NaccolModelCopyWith<$Res> {
  __$NaccolModelCopyWithImpl(this._self, this._then);

  final _NaccolModel _self;
  final $Res Function(_NaccolModel) _then;

/// Create a copy of NaccolModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tajuk = null,Object? kandungan = null,Object? kandunganProcessed = freezed,Object? sequence = null,}) {
  return _then(_NaccolModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tajuk: null == tajuk ? _self.tajuk : tajuk // ignore: cast_nullable_to_non_nullable
as String,kandungan: null == kandungan ? _self.kandungan : kandungan // ignore: cast_nullable_to_non_nullable
as String,kandunganProcessed: freezed == kandunganProcessed ? _self.kandunganProcessed : kandunganProcessed // ignore: cast_nullable_to_non_nullable
as String?,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
