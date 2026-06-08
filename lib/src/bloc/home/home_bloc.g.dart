// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeState _$HomeStateFromJson(Map<String, dynamic> json) => _HomeState(
  status: $enumDecode(_$HomeStatusEnumMap, json['status']),
  errorMessage: json['errorMessage'] as String,
  annoucement: Pagination<AnnoucementModel>.fromJson(
    json['annoucement'] as String,
  ),
  banner: Pagination<BannerModel>.fromJson(json['banner'] as String),
  poster: Pagination<PosterModel>.fromJson(json['poster'] as String),
  popularSearches: Pagination<InitiativeModel>.fromJson(
    json['popularSearches'] as String,
  ),
  infographics: Pagination<InfographicModel>.fromJson(
    json['infographics'] as String,
  ),
  initPageCarousel: (json['initPageCarousel'] as num).toInt(),
  visitorId: json['visitorId'] as String,
);

Map<String, dynamic> _$HomeStateToJson(_HomeState instance) =>
    <String, dynamic>{
      'status': _$HomeStatusEnumMap[instance.status]!,
      'errorMessage': instance.errorMessage,
      'annoucement': instance.annoucement,
      'banner': instance.banner,
      'poster': instance.poster,
      'popularSearches': instance.popularSearches,
      'infographics': instance.infographics,
      'initPageCarousel': instance.initPageCarousel,
      'visitorId': instance.visitorId,
    };

const _$HomeStatusEnumMap = {
  HomeStatus.visitor: 'visitor',
  HomeStatus.initial: 'initial',
  HomeStatus.loading: 'loading',
  HomeStatus.completed: 'completed',
  HomeStatus.error: 'error',
};
