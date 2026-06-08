// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FaqEvent {

 int get page;
/// Create a copy of FaqEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqEventCopyWith<FaqEvent> get copyWith => _$FaqEventCopyWithImpl<FaqEvent>(this as FaqEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqEvent&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'FaqEvent(page: $page)';
}


}

/// @nodoc
abstract mixin class $FaqEventCopyWith<$Res>  {
  factory $FaqEventCopyWith(FaqEvent value, $Res Function(FaqEvent) _then) = _$FaqEventCopyWithImpl;
@useResult
$Res call({
 int page
});




}
/// @nodoc
class _$FaqEventCopyWithImpl<$Res>
    implements $FaqEventCopyWith<$Res> {
  _$FaqEventCopyWithImpl(this._self, this._then);

  final FaqEvent _self;
  final $Res Function(FaqEvent) _then;

/// Create a copy of FaqEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqEvent].
extension FaqEventPatterns on FaqEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetFaqs value)?  getFaqs,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetFaqs() when getFaqs != null:
return getFaqs(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetFaqs value)  getFaqs,}){
final _that = this;
switch (_that) {
case GetFaqs():
return getFaqs(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetFaqs value)?  getFaqs,}){
final _that = this;
switch (_that) {
case GetFaqs() when getFaqs != null:
return getFaqs(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int page)?  getFaqs,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetFaqs() when getFaqs != null:
return getFaqs(_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int page)  getFaqs,}) {final _that = this;
switch (_that) {
case GetFaqs():
return getFaqs(_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int page)?  getFaqs,}) {final _that = this;
switch (_that) {
case GetFaqs() when getFaqs != null:
return getFaqs(_that.page);case _:
  return null;

}
}

}

/// @nodoc


class GetFaqs implements FaqEvent {
  const GetFaqs({this.page = 0});
  

@override@JsonKey() final  int page;

/// Create a copy of FaqEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetFaqsCopyWith<GetFaqs> get copyWith => _$GetFaqsCopyWithImpl<GetFaqs>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetFaqs&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'FaqEvent.getFaqs(page: $page)';
}


}

/// @nodoc
abstract mixin class $GetFaqsCopyWith<$Res> implements $FaqEventCopyWith<$Res> {
  factory $GetFaqsCopyWith(GetFaqs value, $Res Function(GetFaqs) _then) = _$GetFaqsCopyWithImpl;
@override @useResult
$Res call({
 int page
});




}
/// @nodoc
class _$GetFaqsCopyWithImpl<$Res>
    implements $GetFaqsCopyWith<$Res> {
  _$GetFaqsCopyWithImpl(this._self, this._then);

  final GetFaqs _self;
  final $Res Function(GetFaqs) _then;

/// Create a copy of FaqEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(GetFaqs(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$FaqState {

 Pagination<FaqModel> get faqs; FaqStatus get status; String get errorMessage;
/// Create a copy of FaqState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqStateCopyWith<FaqState> get copyWith => _$FaqStateCopyWithImpl<FaqState>(this as FaqState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqState&&(identical(other.faqs, faqs) || other.faqs == faqs)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,faqs,status,errorMessage);

@override
String toString() {
  return 'FaqState(faqs: $faqs, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $FaqStateCopyWith<$Res>  {
  factory $FaqStateCopyWith(FaqState value, $Res Function(FaqState) _then) = _$FaqStateCopyWithImpl;
@useResult
$Res call({
 Pagination<FaqModel> faqs, FaqStatus status, String errorMessage
});




}
/// @nodoc
class _$FaqStateCopyWithImpl<$Res>
    implements $FaqStateCopyWith<$Res> {
  _$FaqStateCopyWithImpl(this._self, this._then);

  final FaqState _self;
  final $Res Function(FaqState) _then;

/// Create a copy of FaqState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? faqs = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
faqs: null == faqs ? _self.faqs : faqs // ignore: cast_nullable_to_non_nullable
as Pagination<FaqModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FaqStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqState].
extension FaqStatePatterns on FaqState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqState value)  $default,){
final _that = this;
switch (_that) {
case _FaqState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqState value)?  $default,){
final _that = this;
switch (_that) {
case _FaqState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Pagination<FaqModel> faqs,  FaqStatus status,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqState() when $default != null:
return $default(_that.faqs,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Pagination<FaqModel> faqs,  FaqStatus status,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _FaqState():
return $default(_that.faqs,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Pagination<FaqModel> faqs,  FaqStatus status,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _FaqState() when $default != null:
return $default(_that.faqs,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _FaqState implements FaqState {
  const _FaqState({required this.faqs, required this.status, required this.errorMessage});
  

@override final  Pagination<FaqModel> faqs;
@override final  FaqStatus status;
@override final  String errorMessage;

/// Create a copy of FaqState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqStateCopyWith<_FaqState> get copyWith => __$FaqStateCopyWithImpl<_FaqState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqState&&(identical(other.faqs, faqs) || other.faqs == faqs)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,faqs,status,errorMessage);

@override
String toString() {
  return 'FaqState(faqs: $faqs, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$FaqStateCopyWith<$Res> implements $FaqStateCopyWith<$Res> {
  factory _$FaqStateCopyWith(_FaqState value, $Res Function(_FaqState) _then) = __$FaqStateCopyWithImpl;
@override @useResult
$Res call({
 Pagination<FaqModel> faqs, FaqStatus status, String errorMessage
});




}
/// @nodoc
class __$FaqStateCopyWithImpl<$Res>
    implements _$FaqStateCopyWith<$Res> {
  __$FaqStateCopyWithImpl(this._self, this._then);

  final _FaqState _self;
  final $Res Function(_FaqState) _then;

/// Create a copy of FaqState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? faqs = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_FaqState(
faqs: null == faqs ? _self.faqs : faqs // ignore: cast_nullable_to_non_nullable
as Pagination<FaqModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FaqStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
