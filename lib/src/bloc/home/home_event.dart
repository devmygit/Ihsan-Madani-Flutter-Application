part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class GetAnnoucement extends HomeEvent {
  final int page;
  GetAnnoucement({
    this.page = 0,
  });
}

class GetBanner extends HomeEvent {
  final int page;
  GetBanner({
    this.page = 0,
  });
}

class GetPoster extends HomeEvent {
  final int page;
  GetPoster({
    this.page = 0,
  });
}

class GetPopularSearches extends HomeEvent {
  final int page;
  GetPopularSearches({
    this.page = 0,
  });
}

class GetInfographics extends HomeEvent {
  final int page;
  GetInfographics({
    this.page = 0,
  });
}

class CheckingData extends HomeEvent {}

class SaveVisitorId extends HomeEvent {}
