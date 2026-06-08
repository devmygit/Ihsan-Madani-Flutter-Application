part of 'home_bloc.dart';

enum HomeStatus { visitor, initial, loading, completed, error }

@freezed
abstract class HomeState with _$HomeState {
  HomeState._();
  factory HomeState({
    required HomeStatus status,
    required String errorMessage,
    required Pagination<AnnoucementModel> annoucement,
    required Pagination<BannerModel> banner,
    required Pagination<PosterModel> poster,
    required Pagination<InitiativeModel> popularSearches,
    required Pagination<InfographicModel> infographics,
    required int initPageCarousel,
    required String visitorId,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        status: HomeStatus.initial,
        errorMessage: '',
        annoucement: Pagination<AnnoucementModel>.initial(),
        banner: Pagination<BannerModel>.initial(),
        poster: Pagination<PosterModel>.initial(),
        popularSearches: Pagination<InitiativeModel>.initial(),
        infographics: Pagination<InfographicModel>.initial(),
        initPageCarousel: 0,
        visitorId: '',
      );

  factory HomeState.saveFromJson(Map<String, dynamic> json) {
    List<PosterModel> poster = List<PosterModel>.from(
      jsonDecode(json['poster'])['data'].map(
        (e) => PosterModel.fromJson(e),
      ),
    );
    List<BannerModel> banner = List<BannerModel>.from(
      jsonDecode(json['banner'])['data'].map(
        (e) => BannerModel.fromJson(e),
      ),
    );
    List<AnnoucementModel> annoucement = List<AnnoucementModel>.from(
      jsonDecode(json['annoucement'])['data'].map(
        (e) => AnnoucementModel.fromJson(e),
      ),
    );
    List<InitiativeModel> popularSearches = json['popularSearches'] != null
        ? List<InitiativeModel>.from(
            jsonDecode(json['popularSearches'])['data'].map(
              (e) => InitiativeModel.fromJson(e),
            ),
          )
        : [];
    List<InfographicModel> infographics = json['infographics'] != null
        ? List<InfographicModel>.from(
            jsonDecode(json['infographics'])['data'].map(
              (e) => InfographicModel.fromJson(e),
            ),
          )
        : [];

    return HomeState(
      poster:
          Pagination<PosterModel>.fromMap(jsonDecode(json['poster']), poster),
      status: HomeStatus.values.byName(json['status']),
      errorMessage: '',
      annoucement: Pagination<AnnoucementModel>.fromMap(
          jsonDecode(json['annoucement']), annoucement),
      banner:
          Pagination<BannerModel>.fromMap(jsonDecode(json['banner']), banner),
      popularSearches: json['popularSearches'] != null
          ? Pagination<InitiativeModel>.fromMap(
              jsonDecode(json['popularSearches']), popularSearches)
          : Pagination<InitiativeModel>.initial(),
      infographics: json['infographics'] != null
          ? Pagination<InfographicModel>.fromMap(
              jsonDecode(json['infographics']), infographics)
          : Pagination<InfographicModel>.initial(),
      initPageCarousel: 0,
      visitorId: json['visitorId'],
    );
  }

  Map<String, dynamic> saveToJson() {
    return {
      'poster': poster.toJson(),
      'banner': banner.toJson(),
      'status': status.name,
      'annoucement': annoucement.toJson(),
      'popularSearches': popularSearches.toJson(),
      'infographics': infographics.toJson(),
      'errorMessage': errorMessage,
      'initPageCarousel': initPageCarousel.toInt(),
      'visitorId': visitorId,
    };
  }

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
