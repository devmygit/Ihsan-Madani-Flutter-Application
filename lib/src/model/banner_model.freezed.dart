// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerModel {

 String get id; String get title; String get description;@JsonKey(name: 'publish_date') String get publisDate;@JsonKey(name: 'is_published') bool get isPublished; int get sequence;@JsonKey(fromJson: _parseMedia) MediaModel? get media;@JsonKey(fromJson: _parseMedia) MediaModel? get logo;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'button_name') String? get buttonName; String? get url;
/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerModelCopyWith<BannerModel> get copyWith => _$BannerModelCopyWithImpl<BannerModel>(this as BannerModel, _$identity);

  /// Serializes this BannerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.publisDate, publisDate) || other.publisDate == publisDate)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.media, media) || other.media == media)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.buttonName, buttonName) || other.buttonName == buttonName)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,publisDate,isPublished,sequence,media,logo,createdAt,buttonName,url);

@override
String toString() {
  return 'BannerModel(id: $id, title: $title, description: $description, publisDate: $publisDate, isPublished: $isPublished, sequence: $sequence, media: $media, logo: $logo, createdAt: $createdAt, buttonName: $buttonName, url: $url)';
}


}

/// @nodoc
abstract mixin class $BannerModelCopyWith<$Res>  {
  factory $BannerModelCopyWith(BannerModel value, $Res Function(BannerModel) _then) = _$BannerModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description,@JsonKey(name: 'publish_date') String publisDate,@JsonKey(name: 'is_published') bool isPublished, int sequence,@JsonKey(fromJson: _parseMedia) MediaModel? media,@JsonKey(fromJson: _parseMedia) MediaModel? logo,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'button_name') String? buttonName, String? url
});


$MediaModelCopyWith<$Res>? get media;$MediaModelCopyWith<$Res>? get logo;

}
/// @nodoc
class _$BannerModelCopyWithImpl<$Res>
    implements $BannerModelCopyWith<$Res> {
  _$BannerModelCopyWithImpl(this._self, this._then);

  final BannerModel _self;
  final $Res Function(BannerModel) _then;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? publisDate = null,Object? isPublished = null,Object? sequence = null,Object? media = freezed,Object? logo = freezed,Object? createdAt = null,Object? buttonName = freezed,Object? url = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,publisDate: null == publisDate ? _self.publisDate : publisDate // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as MediaModel?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as MediaModel?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,buttonName: freezed == buttonName ? _self.buttonName : buttonName // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaModelCopyWith<$Res>? get media {
    if (_self.media == null) {
    return null;
  }

  return $MediaModelCopyWith<$Res>(_self.media!, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaModelCopyWith<$Res>? get logo {
    if (_self.logo == null) {
    return null;
  }

  return $MediaModelCopyWith<$Res>(_self.logo!, (value) {
    return _then(_self.copyWith(logo: value));
  });
}
}


/// Adds pattern-matching-related methods to [BannerModel].
extension BannerModelPatterns on BannerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description, @JsonKey(name: 'publish_date')  String publisDate, @JsonKey(name: 'is_published')  bool isPublished,  int sequence, @JsonKey(fromJson: _parseMedia)  MediaModel? media, @JsonKey(fromJson: _parseMedia)  MediaModel? logo, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'button_name')  String? buttonName,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.publisDate,_that.isPublished,_that.sequence,_that.media,_that.logo,_that.createdAt,_that.buttonName,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description, @JsonKey(name: 'publish_date')  String publisDate, @JsonKey(name: 'is_published')  bool isPublished,  int sequence, @JsonKey(fromJson: _parseMedia)  MediaModel? media, @JsonKey(fromJson: _parseMedia)  MediaModel? logo, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'button_name')  String? buttonName,  String? url)  $default,) {final _that = this;
switch (_that) {
case _BannerModel():
return $default(_that.id,_that.title,_that.description,_that.publisDate,_that.isPublished,_that.sequence,_that.media,_that.logo,_that.createdAt,_that.buttonName,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description, @JsonKey(name: 'publish_date')  String publisDate, @JsonKey(name: 'is_published')  bool isPublished,  int sequence, @JsonKey(fromJson: _parseMedia)  MediaModel? media, @JsonKey(fromJson: _parseMedia)  MediaModel? logo, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'button_name')  String? buttonName,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.publisDate,_that.isPublished,_that.sequence,_that.media,_that.logo,_that.createdAt,_that.buttonName,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerModel implements BannerModel {
  const _BannerModel({required this.id, required this.title, required this.description, @JsonKey(name: 'publish_date') required this.publisDate, @JsonKey(name: 'is_published') required this.isPublished, required this.sequence, @JsonKey(fromJson: _parseMedia) required this.media, @JsonKey(fromJson: _parseMedia) required this.logo, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'button_name') required this.buttonName, required this.url});
  factory _BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override@JsonKey(name: 'publish_date') final  String publisDate;
@override@JsonKey(name: 'is_published') final  bool isPublished;
@override final  int sequence;
@override@JsonKey(fromJson: _parseMedia) final  MediaModel? media;
@override@JsonKey(fromJson: _parseMedia) final  MediaModel? logo;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'button_name') final  String? buttonName;
@override final  String? url;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerModelCopyWith<_BannerModel> get copyWith => __$BannerModelCopyWithImpl<_BannerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.publisDate, publisDate) || other.publisDate == publisDate)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.media, media) || other.media == media)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.buttonName, buttonName) || other.buttonName == buttonName)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,publisDate,isPublished,sequence,media,logo,createdAt,buttonName,url);

@override
String toString() {
  return 'BannerModel(id: $id, title: $title, description: $description, publisDate: $publisDate, isPublished: $isPublished, sequence: $sequence, media: $media, logo: $logo, createdAt: $createdAt, buttonName: $buttonName, url: $url)';
}


}

/// @nodoc
abstract mixin class _$BannerModelCopyWith<$Res> implements $BannerModelCopyWith<$Res> {
  factory _$BannerModelCopyWith(_BannerModel value, $Res Function(_BannerModel) _then) = __$BannerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description,@JsonKey(name: 'publish_date') String publisDate,@JsonKey(name: 'is_published') bool isPublished, int sequence,@JsonKey(fromJson: _parseMedia) MediaModel? media,@JsonKey(fromJson: _parseMedia) MediaModel? logo,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'button_name') String? buttonName, String? url
});


@override $MediaModelCopyWith<$Res>? get media;@override $MediaModelCopyWith<$Res>? get logo;

}
/// @nodoc
class __$BannerModelCopyWithImpl<$Res>
    implements _$BannerModelCopyWith<$Res> {
  __$BannerModelCopyWithImpl(this._self, this._then);

  final _BannerModel _self;
  final $Res Function(_BannerModel) _then;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? publisDate = null,Object? isPublished = null,Object? sequence = null,Object? media = freezed,Object? logo = freezed,Object? createdAt = null,Object? buttonName = freezed,Object? url = freezed,}) {
  return _then(_BannerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,publisDate: null == publisDate ? _self.publisDate : publisDate // ignore: cast_nullable_to_non_nullable
as String,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as MediaModel?,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as MediaModel?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,buttonName: freezed == buttonName ? _self.buttonName : buttonName // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaModelCopyWith<$Res>? get media {
    if (_self.media == null) {
    return null;
  }

  return $MediaModelCopyWith<$Res>(_self.media!, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaModelCopyWith<$Res>? get logo {
    if (_self.logo == null) {
    return null;
  }

  return $MediaModelCopyWith<$Res>(_self.logo!, (value) {
    return _then(_self.copyWith(logo: value));
  });
}
}

// dart format on
