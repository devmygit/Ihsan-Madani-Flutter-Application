part of 'initiative_bloc.dart';

enum InitiativeStatus {
  initial,
  loading,
  completed,
  error,
}

enum GetInitiativeStatus {
  initial,
  loading,
  completed,
  error,
}

enum DetailInitiativeStatus {
  initial,
  loading,
  completed,
  error,
}

@freezed
abstract class InitiativeState with _$InitiativeState {
  InitiativeState._();
  factory InitiativeState({
    required final InitiativeStatus status,
    required final GetInitiativeStatus getInitiativeStatus,
    required final DetailInitiativeStatus detailInitiativeStatus,
    required final String currentCluster,
    required final Pagination<InitiativeModel> initiative,
    required final InitiativeModel initiativeDetail,
    required final String errorMessage,
  }) = _InitiativeState;
  factory InitiativeState.initial() => InitiativeState(
        status: InitiativeStatus.initial,
        currentCluster: '',
        initiative: Pagination<InitiativeModel>.initial(),
        initiativeDetail: InitiativeModel.initial(),
        errorMessage: '',
        getInitiativeStatus: GetInitiativeStatus.initial,
        detailInitiativeStatus: DetailInitiativeStatus.initial,
      );

  factory InitiativeState.fromJson(Map<String, dynamic> json) =>
      _$InitiativeStateFromJson(json);

  factory InitiativeState.saveFromJson(Map<String, dynamic> json) =>
      InitiativeState(
        status: InitiativeStatus.initial,
        currentCluster: json['currentCluster'] ?? '',
        initiative: Pagination<InitiativeModel>.fromJson(json['initiative']),
        initiativeDetail: InitiativeModel.fromJson(json['initiativeDetail']),
        errorMessage: json['errorMessage'] ?? '',
        getInitiativeStatus: GetInitiativeStatus.initial,
        detailInitiativeStatus: DetailInitiativeStatus.initial,
      );

  Map<String, dynamic> saveToJson() => {
        'initiative': initiative.toJson(),
        'currentCluster': currentCluster,
        'initiativeDetail': initiativeDetail.toJson(),
        'status': status.name,
        'errorMessage': errorMessage,
        'getInitiativeStatus': getInitiativeStatus.name,
        'detailInitiativeStatus': detailInitiativeStatus.name,
      };
}
