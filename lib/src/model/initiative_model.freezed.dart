// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initiative_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InitiativeModel {

 String get id; String get cluster; String get name; String? get objectives; String get description; List<String>? get requirements; List<String>? get aids; String? get faqs; String? get url;@JsonKey(name: 'alternative_url') String? get alternativeUrl;@JsonKey(name: 'enforce_date') String? get enforceDate;@JsonKey(name: 'is_published') bool? get isPublished;@JsonKey(name: 'updated_at') String get updatedAt; List<ClusterRefModel>? get agencies;@JsonKey(name: 'target_groups') List<ClusterRefModel>? get targetGroups;@JsonKey(name: 'application_steps') String? get applicationSteps;@JsonKey(name: 'url_button_name') String? get urlButtonName;// New fields for article API
 String? get uuid; String? get body;@JsonKey(name: 'category_slug') String? get categorySlug;@JsonKey(name: 'tab_kumpulan_sasar') String? get tabKumpulanSasar;@JsonKey(name: 'tab_syarat_permohonan') String? get tabSyaratPermohonan;@JsonKey(name: 'tab_kadar_bantuan') String? get tabKadarBantuan;@JsonKey(name: 'tab_faq') String? get tabFaq;@JsonKey(name: 'tab_agensi_pelaksana') String? get tabAgensiPelaksana;@JsonKey(name: 'field_pautan_tambahan') String? get fieldPautanTambahan;@JsonKey(name: 'field_pautan_tambahan_label') String? get fieldPautanTambahanLabel; int? get sequence; String? get nid;
/// Create a copy of InitiativeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitiativeModelCopyWith<InitiativeModel> get copyWith => _$InitiativeModelCopyWithImpl<InitiativeModel>(this as InitiativeModel, _$identity);

  /// Serializes this InitiativeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitiativeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.cluster, cluster) || other.cluster == cluster)&&(identical(other.name, name) || other.name == name)&&(identical(other.objectives, objectives) || other.objectives == objectives)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.requirements, requirements)&&const DeepCollectionEquality().equals(other.aids, aids)&&(identical(other.faqs, faqs) || other.faqs == faqs)&&(identical(other.url, url) || other.url == url)&&(identical(other.alternativeUrl, alternativeUrl) || other.alternativeUrl == alternativeUrl)&&(identical(other.enforceDate, enforceDate) || other.enforceDate == enforceDate)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.agencies, agencies)&&const DeepCollectionEquality().equals(other.targetGroups, targetGroups)&&(identical(other.applicationSteps, applicationSteps) || other.applicationSteps == applicationSteps)&&(identical(other.urlButtonName, urlButtonName) || other.urlButtonName == urlButtonName)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.body, body) || other.body == body)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.tabKumpulanSasar, tabKumpulanSasar) || other.tabKumpulanSasar == tabKumpulanSasar)&&(identical(other.tabSyaratPermohonan, tabSyaratPermohonan) || other.tabSyaratPermohonan == tabSyaratPermohonan)&&(identical(other.tabKadarBantuan, tabKadarBantuan) || other.tabKadarBantuan == tabKadarBantuan)&&(identical(other.tabFaq, tabFaq) || other.tabFaq == tabFaq)&&(identical(other.tabAgensiPelaksana, tabAgensiPelaksana) || other.tabAgensiPelaksana == tabAgensiPelaksana)&&(identical(other.fieldPautanTambahan, fieldPautanTambahan) || other.fieldPautanTambahan == fieldPautanTambahan)&&(identical(other.fieldPautanTambahanLabel, fieldPautanTambahanLabel) || other.fieldPautanTambahanLabel == fieldPautanTambahanLabel)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.nid, nid) || other.nid == nid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,cluster,name,objectives,description,const DeepCollectionEquality().hash(requirements),const DeepCollectionEquality().hash(aids),faqs,url,alternativeUrl,enforceDate,isPublished,updatedAt,const DeepCollectionEquality().hash(agencies),const DeepCollectionEquality().hash(targetGroups),applicationSteps,urlButtonName,uuid,body,categorySlug,tabKumpulanSasar,tabSyaratPermohonan,tabKadarBantuan,tabFaq,tabAgensiPelaksana,fieldPautanTambahan,fieldPautanTambahanLabel,sequence,nid]);

@override
String toString() {
  return 'InitiativeModel(id: $id, cluster: $cluster, name: $name, objectives: $objectives, description: $description, requirements: $requirements, aids: $aids, faqs: $faqs, url: $url, alternativeUrl: $alternativeUrl, enforceDate: $enforceDate, isPublished: $isPublished, updatedAt: $updatedAt, agencies: $agencies, targetGroups: $targetGroups, applicationSteps: $applicationSteps, urlButtonName: $urlButtonName, uuid: $uuid, body: $body, categorySlug: $categorySlug, tabKumpulanSasar: $tabKumpulanSasar, tabSyaratPermohonan: $tabSyaratPermohonan, tabKadarBantuan: $tabKadarBantuan, tabFaq: $tabFaq, tabAgensiPelaksana: $tabAgensiPelaksana, fieldPautanTambahan: $fieldPautanTambahan, fieldPautanTambahanLabel: $fieldPautanTambahanLabel, sequence: $sequence, nid: $nid)';
}


}

/// @nodoc
abstract mixin class $InitiativeModelCopyWith<$Res>  {
  factory $InitiativeModelCopyWith(InitiativeModel value, $Res Function(InitiativeModel) _then) = _$InitiativeModelCopyWithImpl;
@useResult
$Res call({
 String id, String cluster, String name, String? objectives, String description, List<String>? requirements, List<String>? aids, String? faqs, String? url,@JsonKey(name: 'alternative_url') String? alternativeUrl,@JsonKey(name: 'enforce_date') String? enforceDate,@JsonKey(name: 'is_published') bool? isPublished,@JsonKey(name: 'updated_at') String updatedAt, List<ClusterRefModel>? agencies,@JsonKey(name: 'target_groups') List<ClusterRefModel>? targetGroups,@JsonKey(name: 'application_steps') String? applicationSteps,@JsonKey(name: 'url_button_name') String? urlButtonName, String? uuid, String? body,@JsonKey(name: 'category_slug') String? categorySlug,@JsonKey(name: 'tab_kumpulan_sasar') String? tabKumpulanSasar,@JsonKey(name: 'tab_syarat_permohonan') String? tabSyaratPermohonan,@JsonKey(name: 'tab_kadar_bantuan') String? tabKadarBantuan,@JsonKey(name: 'tab_faq') String? tabFaq,@JsonKey(name: 'tab_agensi_pelaksana') String? tabAgensiPelaksana,@JsonKey(name: 'field_pautan_tambahan') String? fieldPautanTambahan,@JsonKey(name: 'field_pautan_tambahan_label') String? fieldPautanTambahanLabel, int? sequence, String? nid
});




}
/// @nodoc
class _$InitiativeModelCopyWithImpl<$Res>
    implements $InitiativeModelCopyWith<$Res> {
  _$InitiativeModelCopyWithImpl(this._self, this._then);

  final InitiativeModel _self;
  final $Res Function(InitiativeModel) _then;

/// Create a copy of InitiativeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cluster = null,Object? name = null,Object? objectives = freezed,Object? description = null,Object? requirements = freezed,Object? aids = freezed,Object? faqs = freezed,Object? url = freezed,Object? alternativeUrl = freezed,Object? enforceDate = freezed,Object? isPublished = freezed,Object? updatedAt = null,Object? agencies = freezed,Object? targetGroups = freezed,Object? applicationSteps = freezed,Object? urlButtonName = freezed,Object? uuid = freezed,Object? body = freezed,Object? categorySlug = freezed,Object? tabKumpulanSasar = freezed,Object? tabSyaratPermohonan = freezed,Object? tabKadarBantuan = freezed,Object? tabFaq = freezed,Object? tabAgensiPelaksana = freezed,Object? fieldPautanTambahan = freezed,Object? fieldPautanTambahanLabel = freezed,Object? sequence = freezed,Object? nid = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cluster: null == cluster ? _self.cluster : cluster // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,objectives: freezed == objectives ? _self.objectives : objectives // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,requirements: freezed == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<String>?,aids: freezed == aids ? _self.aids : aids // ignore: cast_nullable_to_non_nullable
as List<String>?,faqs: freezed == faqs ? _self.faqs : faqs // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,alternativeUrl: freezed == alternativeUrl ? _self.alternativeUrl : alternativeUrl // ignore: cast_nullable_to_non_nullable
as String?,enforceDate: freezed == enforceDate ? _self.enforceDate : enforceDate // ignore: cast_nullable_to_non_nullable
as String?,isPublished: freezed == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,agencies: freezed == agencies ? _self.agencies : agencies // ignore: cast_nullable_to_non_nullable
as List<ClusterRefModel>?,targetGroups: freezed == targetGroups ? _self.targetGroups : targetGroups // ignore: cast_nullable_to_non_nullable
as List<ClusterRefModel>?,applicationSteps: freezed == applicationSteps ? _self.applicationSteps : applicationSteps // ignore: cast_nullable_to_non_nullable
as String?,urlButtonName: freezed == urlButtonName ? _self.urlButtonName : urlButtonName // ignore: cast_nullable_to_non_nullable
as String?,uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,categorySlug: freezed == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String?,tabKumpulanSasar: freezed == tabKumpulanSasar ? _self.tabKumpulanSasar : tabKumpulanSasar // ignore: cast_nullable_to_non_nullable
as String?,tabSyaratPermohonan: freezed == tabSyaratPermohonan ? _self.tabSyaratPermohonan : tabSyaratPermohonan // ignore: cast_nullable_to_non_nullable
as String?,tabKadarBantuan: freezed == tabKadarBantuan ? _self.tabKadarBantuan : tabKadarBantuan // ignore: cast_nullable_to_non_nullable
as String?,tabFaq: freezed == tabFaq ? _self.tabFaq : tabFaq // ignore: cast_nullable_to_non_nullable
as String?,tabAgensiPelaksana: freezed == tabAgensiPelaksana ? _self.tabAgensiPelaksana : tabAgensiPelaksana // ignore: cast_nullable_to_non_nullable
as String?,fieldPautanTambahan: freezed == fieldPautanTambahan ? _self.fieldPautanTambahan : fieldPautanTambahan // ignore: cast_nullable_to_non_nullable
as String?,fieldPautanTambahanLabel: freezed == fieldPautanTambahanLabel ? _self.fieldPautanTambahanLabel : fieldPautanTambahanLabel // ignore: cast_nullable_to_non_nullable
as String?,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int?,nid: freezed == nid ? _self.nid : nid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InitiativeModel].
extension InitiativeModelPatterns on InitiativeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InitiativeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitiativeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InitiativeModel value)  $default,){
final _that = this;
switch (_that) {
case _InitiativeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InitiativeModel value)?  $default,){
final _that = this;
switch (_that) {
case _InitiativeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String cluster,  String name,  String? objectives,  String description,  List<String>? requirements,  List<String>? aids,  String? faqs,  String? url, @JsonKey(name: 'alternative_url')  String? alternativeUrl, @JsonKey(name: 'enforce_date')  String? enforceDate, @JsonKey(name: 'is_published')  bool? isPublished, @JsonKey(name: 'updated_at')  String updatedAt,  List<ClusterRefModel>? agencies, @JsonKey(name: 'target_groups')  List<ClusterRefModel>? targetGroups, @JsonKey(name: 'application_steps')  String? applicationSteps, @JsonKey(name: 'url_button_name')  String? urlButtonName,  String? uuid,  String? body, @JsonKey(name: 'category_slug')  String? categorySlug, @JsonKey(name: 'tab_kumpulan_sasar')  String? tabKumpulanSasar, @JsonKey(name: 'tab_syarat_permohonan')  String? tabSyaratPermohonan, @JsonKey(name: 'tab_kadar_bantuan')  String? tabKadarBantuan, @JsonKey(name: 'tab_faq')  String? tabFaq, @JsonKey(name: 'tab_agensi_pelaksana')  String? tabAgensiPelaksana, @JsonKey(name: 'field_pautan_tambahan')  String? fieldPautanTambahan, @JsonKey(name: 'field_pautan_tambahan_label')  String? fieldPautanTambahanLabel,  int? sequence,  String? nid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitiativeModel() when $default != null:
return $default(_that.id,_that.cluster,_that.name,_that.objectives,_that.description,_that.requirements,_that.aids,_that.faqs,_that.url,_that.alternativeUrl,_that.enforceDate,_that.isPublished,_that.updatedAt,_that.agencies,_that.targetGroups,_that.applicationSteps,_that.urlButtonName,_that.uuid,_that.body,_that.categorySlug,_that.tabKumpulanSasar,_that.tabSyaratPermohonan,_that.tabKadarBantuan,_that.tabFaq,_that.tabAgensiPelaksana,_that.fieldPautanTambahan,_that.fieldPautanTambahanLabel,_that.sequence,_that.nid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String cluster,  String name,  String? objectives,  String description,  List<String>? requirements,  List<String>? aids,  String? faqs,  String? url, @JsonKey(name: 'alternative_url')  String? alternativeUrl, @JsonKey(name: 'enforce_date')  String? enforceDate, @JsonKey(name: 'is_published')  bool? isPublished, @JsonKey(name: 'updated_at')  String updatedAt,  List<ClusterRefModel>? agencies, @JsonKey(name: 'target_groups')  List<ClusterRefModel>? targetGroups, @JsonKey(name: 'application_steps')  String? applicationSteps, @JsonKey(name: 'url_button_name')  String? urlButtonName,  String? uuid,  String? body, @JsonKey(name: 'category_slug')  String? categorySlug, @JsonKey(name: 'tab_kumpulan_sasar')  String? tabKumpulanSasar, @JsonKey(name: 'tab_syarat_permohonan')  String? tabSyaratPermohonan, @JsonKey(name: 'tab_kadar_bantuan')  String? tabKadarBantuan, @JsonKey(name: 'tab_faq')  String? tabFaq, @JsonKey(name: 'tab_agensi_pelaksana')  String? tabAgensiPelaksana, @JsonKey(name: 'field_pautan_tambahan')  String? fieldPautanTambahan, @JsonKey(name: 'field_pautan_tambahan_label')  String? fieldPautanTambahanLabel,  int? sequence,  String? nid)  $default,) {final _that = this;
switch (_that) {
case _InitiativeModel():
return $default(_that.id,_that.cluster,_that.name,_that.objectives,_that.description,_that.requirements,_that.aids,_that.faqs,_that.url,_that.alternativeUrl,_that.enforceDate,_that.isPublished,_that.updatedAt,_that.agencies,_that.targetGroups,_that.applicationSteps,_that.urlButtonName,_that.uuid,_that.body,_that.categorySlug,_that.tabKumpulanSasar,_that.tabSyaratPermohonan,_that.tabKadarBantuan,_that.tabFaq,_that.tabAgensiPelaksana,_that.fieldPautanTambahan,_that.fieldPautanTambahanLabel,_that.sequence,_that.nid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String cluster,  String name,  String? objectives,  String description,  List<String>? requirements,  List<String>? aids,  String? faqs,  String? url, @JsonKey(name: 'alternative_url')  String? alternativeUrl, @JsonKey(name: 'enforce_date')  String? enforceDate, @JsonKey(name: 'is_published')  bool? isPublished, @JsonKey(name: 'updated_at')  String updatedAt,  List<ClusterRefModel>? agencies, @JsonKey(name: 'target_groups')  List<ClusterRefModel>? targetGroups, @JsonKey(name: 'application_steps')  String? applicationSteps, @JsonKey(name: 'url_button_name')  String? urlButtonName,  String? uuid,  String? body, @JsonKey(name: 'category_slug')  String? categorySlug, @JsonKey(name: 'tab_kumpulan_sasar')  String? tabKumpulanSasar, @JsonKey(name: 'tab_syarat_permohonan')  String? tabSyaratPermohonan, @JsonKey(name: 'tab_kadar_bantuan')  String? tabKadarBantuan, @JsonKey(name: 'tab_faq')  String? tabFaq, @JsonKey(name: 'tab_agensi_pelaksana')  String? tabAgensiPelaksana, @JsonKey(name: 'field_pautan_tambahan')  String? fieldPautanTambahan, @JsonKey(name: 'field_pautan_tambahan_label')  String? fieldPautanTambahanLabel,  int? sequence,  String? nid)?  $default,) {final _that = this;
switch (_that) {
case _InitiativeModel() when $default != null:
return $default(_that.id,_that.cluster,_that.name,_that.objectives,_that.description,_that.requirements,_that.aids,_that.faqs,_that.url,_that.alternativeUrl,_that.enforceDate,_that.isPublished,_that.updatedAt,_that.agencies,_that.targetGroups,_that.applicationSteps,_that.urlButtonName,_that.uuid,_that.body,_that.categorySlug,_that.tabKumpulanSasar,_that.tabSyaratPermohonan,_that.tabKadarBantuan,_that.tabFaq,_that.tabAgensiPelaksana,_that.fieldPautanTambahan,_that.fieldPautanTambahanLabel,_that.sequence,_that.nid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InitiativeModel implements InitiativeModel {
  const _InitiativeModel({required this.id, required this.cluster, required this.name, required this.objectives, required this.description, required final  List<String>? requirements, required final  List<String>? aids, this.faqs, this.url, @JsonKey(name: 'alternative_url') this.alternativeUrl, @JsonKey(name: 'enforce_date') this.enforceDate, @JsonKey(name: 'is_published') this.isPublished, @JsonKey(name: 'updated_at') required this.updatedAt, required final  List<ClusterRefModel>? agencies, @JsonKey(name: 'target_groups') required final  List<ClusterRefModel>? targetGroups, @JsonKey(name: 'application_steps') required this.applicationSteps, @JsonKey(name: 'url_button_name') required this.urlButtonName, this.uuid, this.body, @JsonKey(name: 'category_slug') this.categorySlug, @JsonKey(name: 'tab_kumpulan_sasar') this.tabKumpulanSasar, @JsonKey(name: 'tab_syarat_permohonan') this.tabSyaratPermohonan, @JsonKey(name: 'tab_kadar_bantuan') this.tabKadarBantuan, @JsonKey(name: 'tab_faq') this.tabFaq, @JsonKey(name: 'tab_agensi_pelaksana') this.tabAgensiPelaksana, @JsonKey(name: 'field_pautan_tambahan') this.fieldPautanTambahan, @JsonKey(name: 'field_pautan_tambahan_label') this.fieldPautanTambahanLabel, this.sequence, this.nid}): _requirements = requirements,_aids = aids,_agencies = agencies,_targetGroups = targetGroups;
  factory _InitiativeModel.fromJson(Map<String, dynamic> json) => _$InitiativeModelFromJson(json);

@override final  String id;
@override final  String cluster;
@override final  String name;
@override final  String? objectives;
@override final  String description;
 final  List<String>? _requirements;
@override List<String>? get requirements {
  final value = _requirements;
  if (value == null) return null;
  if (_requirements is EqualUnmodifiableListView) return _requirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _aids;
@override List<String>? get aids {
  final value = _aids;
  if (value == null) return null;
  if (_aids is EqualUnmodifiableListView) return _aids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? faqs;
@override final  String? url;
@override@JsonKey(name: 'alternative_url') final  String? alternativeUrl;
@override@JsonKey(name: 'enforce_date') final  String? enforceDate;
@override@JsonKey(name: 'is_published') final  bool? isPublished;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
 final  List<ClusterRefModel>? _agencies;
@override List<ClusterRefModel>? get agencies {
  final value = _agencies;
  if (value == null) return null;
  if (_agencies is EqualUnmodifiableListView) return _agencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ClusterRefModel>? _targetGroups;
@override@JsonKey(name: 'target_groups') List<ClusterRefModel>? get targetGroups {
  final value = _targetGroups;
  if (value == null) return null;
  if (_targetGroups is EqualUnmodifiableListView) return _targetGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'application_steps') final  String? applicationSteps;
@override@JsonKey(name: 'url_button_name') final  String? urlButtonName;
// New fields for article API
@override final  String? uuid;
@override final  String? body;
@override@JsonKey(name: 'category_slug') final  String? categorySlug;
@override@JsonKey(name: 'tab_kumpulan_sasar') final  String? tabKumpulanSasar;
@override@JsonKey(name: 'tab_syarat_permohonan') final  String? tabSyaratPermohonan;
@override@JsonKey(name: 'tab_kadar_bantuan') final  String? tabKadarBantuan;
@override@JsonKey(name: 'tab_faq') final  String? tabFaq;
@override@JsonKey(name: 'tab_agensi_pelaksana') final  String? tabAgensiPelaksana;
@override@JsonKey(name: 'field_pautan_tambahan') final  String? fieldPautanTambahan;
@override@JsonKey(name: 'field_pautan_tambahan_label') final  String? fieldPautanTambahanLabel;
@override final  int? sequence;
@override final  String? nid;

/// Create a copy of InitiativeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitiativeModelCopyWith<_InitiativeModel> get copyWith => __$InitiativeModelCopyWithImpl<_InitiativeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InitiativeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitiativeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.cluster, cluster) || other.cluster == cluster)&&(identical(other.name, name) || other.name == name)&&(identical(other.objectives, objectives) || other.objectives == objectives)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._requirements, _requirements)&&const DeepCollectionEquality().equals(other._aids, _aids)&&(identical(other.faqs, faqs) || other.faqs == faqs)&&(identical(other.url, url) || other.url == url)&&(identical(other.alternativeUrl, alternativeUrl) || other.alternativeUrl == alternativeUrl)&&(identical(other.enforceDate, enforceDate) || other.enforceDate == enforceDate)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._agencies, _agencies)&&const DeepCollectionEquality().equals(other._targetGroups, _targetGroups)&&(identical(other.applicationSteps, applicationSteps) || other.applicationSteps == applicationSteps)&&(identical(other.urlButtonName, urlButtonName) || other.urlButtonName == urlButtonName)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.body, body) || other.body == body)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.tabKumpulanSasar, tabKumpulanSasar) || other.tabKumpulanSasar == tabKumpulanSasar)&&(identical(other.tabSyaratPermohonan, tabSyaratPermohonan) || other.tabSyaratPermohonan == tabSyaratPermohonan)&&(identical(other.tabKadarBantuan, tabKadarBantuan) || other.tabKadarBantuan == tabKadarBantuan)&&(identical(other.tabFaq, tabFaq) || other.tabFaq == tabFaq)&&(identical(other.tabAgensiPelaksana, tabAgensiPelaksana) || other.tabAgensiPelaksana == tabAgensiPelaksana)&&(identical(other.fieldPautanTambahan, fieldPautanTambahan) || other.fieldPautanTambahan == fieldPautanTambahan)&&(identical(other.fieldPautanTambahanLabel, fieldPautanTambahanLabel) || other.fieldPautanTambahanLabel == fieldPautanTambahanLabel)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.nid, nid) || other.nid == nid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,cluster,name,objectives,description,const DeepCollectionEquality().hash(_requirements),const DeepCollectionEquality().hash(_aids),faqs,url,alternativeUrl,enforceDate,isPublished,updatedAt,const DeepCollectionEquality().hash(_agencies),const DeepCollectionEquality().hash(_targetGroups),applicationSteps,urlButtonName,uuid,body,categorySlug,tabKumpulanSasar,tabSyaratPermohonan,tabKadarBantuan,tabFaq,tabAgensiPelaksana,fieldPautanTambahan,fieldPautanTambahanLabel,sequence,nid]);

@override
String toString() {
  return 'InitiativeModel(id: $id, cluster: $cluster, name: $name, objectives: $objectives, description: $description, requirements: $requirements, aids: $aids, faqs: $faqs, url: $url, alternativeUrl: $alternativeUrl, enforceDate: $enforceDate, isPublished: $isPublished, updatedAt: $updatedAt, agencies: $agencies, targetGroups: $targetGroups, applicationSteps: $applicationSteps, urlButtonName: $urlButtonName, uuid: $uuid, body: $body, categorySlug: $categorySlug, tabKumpulanSasar: $tabKumpulanSasar, tabSyaratPermohonan: $tabSyaratPermohonan, tabKadarBantuan: $tabKadarBantuan, tabFaq: $tabFaq, tabAgensiPelaksana: $tabAgensiPelaksana, fieldPautanTambahan: $fieldPautanTambahan, fieldPautanTambahanLabel: $fieldPautanTambahanLabel, sequence: $sequence, nid: $nid)';
}


}

/// @nodoc
abstract mixin class _$InitiativeModelCopyWith<$Res> implements $InitiativeModelCopyWith<$Res> {
  factory _$InitiativeModelCopyWith(_InitiativeModel value, $Res Function(_InitiativeModel) _then) = __$InitiativeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String cluster, String name, String? objectives, String description, List<String>? requirements, List<String>? aids, String? faqs, String? url,@JsonKey(name: 'alternative_url') String? alternativeUrl,@JsonKey(name: 'enforce_date') String? enforceDate,@JsonKey(name: 'is_published') bool? isPublished,@JsonKey(name: 'updated_at') String updatedAt, List<ClusterRefModel>? agencies,@JsonKey(name: 'target_groups') List<ClusterRefModel>? targetGroups,@JsonKey(name: 'application_steps') String? applicationSteps,@JsonKey(name: 'url_button_name') String? urlButtonName, String? uuid, String? body,@JsonKey(name: 'category_slug') String? categorySlug,@JsonKey(name: 'tab_kumpulan_sasar') String? tabKumpulanSasar,@JsonKey(name: 'tab_syarat_permohonan') String? tabSyaratPermohonan,@JsonKey(name: 'tab_kadar_bantuan') String? tabKadarBantuan,@JsonKey(name: 'tab_faq') String? tabFaq,@JsonKey(name: 'tab_agensi_pelaksana') String? tabAgensiPelaksana,@JsonKey(name: 'field_pautan_tambahan') String? fieldPautanTambahan,@JsonKey(name: 'field_pautan_tambahan_label') String? fieldPautanTambahanLabel, int? sequence, String? nid
});




}
/// @nodoc
class __$InitiativeModelCopyWithImpl<$Res>
    implements _$InitiativeModelCopyWith<$Res> {
  __$InitiativeModelCopyWithImpl(this._self, this._then);

  final _InitiativeModel _self;
  final $Res Function(_InitiativeModel) _then;

/// Create a copy of InitiativeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cluster = null,Object? name = null,Object? objectives = freezed,Object? description = null,Object? requirements = freezed,Object? aids = freezed,Object? faqs = freezed,Object? url = freezed,Object? alternativeUrl = freezed,Object? enforceDate = freezed,Object? isPublished = freezed,Object? updatedAt = null,Object? agencies = freezed,Object? targetGroups = freezed,Object? applicationSteps = freezed,Object? urlButtonName = freezed,Object? uuid = freezed,Object? body = freezed,Object? categorySlug = freezed,Object? tabKumpulanSasar = freezed,Object? tabSyaratPermohonan = freezed,Object? tabKadarBantuan = freezed,Object? tabFaq = freezed,Object? tabAgensiPelaksana = freezed,Object? fieldPautanTambahan = freezed,Object? fieldPautanTambahanLabel = freezed,Object? sequence = freezed,Object? nid = freezed,}) {
  return _then(_InitiativeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cluster: null == cluster ? _self.cluster : cluster // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,objectives: freezed == objectives ? _self.objectives : objectives // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,requirements: freezed == requirements ? _self._requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<String>?,aids: freezed == aids ? _self._aids : aids // ignore: cast_nullable_to_non_nullable
as List<String>?,faqs: freezed == faqs ? _self.faqs : faqs // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,alternativeUrl: freezed == alternativeUrl ? _self.alternativeUrl : alternativeUrl // ignore: cast_nullable_to_non_nullable
as String?,enforceDate: freezed == enforceDate ? _self.enforceDate : enforceDate // ignore: cast_nullable_to_non_nullable
as String?,isPublished: freezed == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,agencies: freezed == agencies ? _self._agencies : agencies // ignore: cast_nullable_to_non_nullable
as List<ClusterRefModel>?,targetGroups: freezed == targetGroups ? _self._targetGroups : targetGroups // ignore: cast_nullable_to_non_nullable
as List<ClusterRefModel>?,applicationSteps: freezed == applicationSteps ? _self.applicationSteps : applicationSteps // ignore: cast_nullable_to_non_nullable
as String?,urlButtonName: freezed == urlButtonName ? _self.urlButtonName : urlButtonName // ignore: cast_nullable_to_non_nullable
as String?,uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,categorySlug: freezed == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String?,tabKumpulanSasar: freezed == tabKumpulanSasar ? _self.tabKumpulanSasar : tabKumpulanSasar // ignore: cast_nullable_to_non_nullable
as String?,tabSyaratPermohonan: freezed == tabSyaratPermohonan ? _self.tabSyaratPermohonan : tabSyaratPermohonan // ignore: cast_nullable_to_non_nullable
as String?,tabKadarBantuan: freezed == tabKadarBantuan ? _self.tabKadarBantuan : tabKadarBantuan // ignore: cast_nullable_to_non_nullable
as String?,tabFaq: freezed == tabFaq ? _self.tabFaq : tabFaq // ignore: cast_nullable_to_non_nullable
as String?,tabAgensiPelaksana: freezed == tabAgensiPelaksana ? _self.tabAgensiPelaksana : tabAgensiPelaksana // ignore: cast_nullable_to_non_nullable
as String?,fieldPautanTambahan: freezed == fieldPautanTambahan ? _self.fieldPautanTambahan : fieldPautanTambahan // ignore: cast_nullable_to_non_nullable
as String?,fieldPautanTambahanLabel: freezed == fieldPautanTambahanLabel ? _self.fieldPautanTambahanLabel : fieldPautanTambahanLabel // ignore: cast_nullable_to_non_nullable
as String?,sequence: freezed == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int?,nid: freezed == nid ? _self.nid : nid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
