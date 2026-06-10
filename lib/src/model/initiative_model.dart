// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madani/src/model/index.dart';

part 'initiative_model.freezed.dart';
part 'initiative_model.g.dart';

@freezed
abstract class InitiativeModel with _$InitiativeModel {
  const InitiativeModel._();

  const factory InitiativeModel({
    required String id,
    required String cluster,
    required String name,
    required String? objectives,
    required String description,
    required List<String>? requirements,
    required List<String>? aids,
    String? faqs,
    String? url,
    @JsonKey(name: 'alternative_url') String? alternativeUrl,
    @JsonKey(name: 'enforce_date') String? enforceDate,
    @JsonKey(name: 'is_published') bool? isPublished,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required List<ClusterRefModel>? agencies,
    @JsonKey(name: 'target_groups')
    required List<ClusterRefModel>? targetGroups,
    @JsonKey(name: 'application_steps') required String? applicationSteps,
    @JsonKey(name: 'url_button_name') required String? urlButtonName,
    // New fields for article API
    String? uuid,
    String? body,
    @JsonKey(name: 'category_slug') String? categorySlug,
    @JsonKey(name: 'tab_kumpulan_sasar') String? tabKumpulanSasar,
    @JsonKey(name: 'tab_syarat_permohonan') String? tabSyaratPermohonan,
    @JsonKey(name: 'tab_kadar_bantuan') String? tabKadarBantuan,
    @JsonKey(name: 'tab_faq') String? tabFaq,
    @JsonKey(name: 'tab_agensi_pelaksana') String? tabAgensiPelaksana,
    @JsonKey(name: 'field_pautan_tambahan') String? fieldPautanTambahan,
    @JsonKey(name: 'field_pautan_tambahan_label') String? fieldPautanTambahanLabel,
    int? sequence,
    String? nid,
  }) = _InitiativeModel;

  factory InitiativeModel.initial() => const InitiativeModel(
        id: '',
        cluster: '',
        name: '',
        description: '',
        objectives: '',
        requirements: [],
        aids: [],
        faqs: '',
        url: '',
        alternativeUrl: '',
        enforceDate: '',
        isPublished: false,
        updatedAt: '',
        agencies: [],
        targetGroups: [],
        applicationSteps: '',
        urlButtonName: '',
        uuid: null,
        body: null,
        categorySlug: null,
        tabKumpulanSasar: null,
        tabSyaratPermohonan: null,
        tabKadarBantuan: null,
        tabFaq: null,
        tabAgensiPelaksana: null,
        fieldPautanTambahan: null,
        fieldPautanTambahanLabel: null,
        sequence: null,
        nid: null,
      );

  factory InitiativeModel.fromJson(Map<String, dynamic> json) =>
      _$InitiativeModelFromJson(json);

  /// ID untuk API `/articles/{id}` — sama logic dengan senarai inisiatif.
  String get detailArticleId {
    if (nid != null && nid!.isNotEmpty) {
      return nid!;
    }
    return id;
  }

  /// Popular-searches API kadang return id sequence (1,2,3...) tanpa nid/uuid.
  bool get needsDetailIdResolve =>
      (nid == null || nid!.isEmpty) &&
      (uuid == null || uuid!.isEmpty);
}
