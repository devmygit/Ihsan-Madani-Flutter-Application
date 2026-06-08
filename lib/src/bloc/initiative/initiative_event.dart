part of 'initiative_bloc.dart';

@immutable
sealed class InitiativeEvent {}

class GetInitiative extends InitiativeEvent {
  final String cluster;
  final String search;
  final int page;

  GetInitiative({this.cluster = '', this.search = '', this.page = 0});
}

class GetInitiativeDetails extends InitiativeEvent {
  final String initiativeId;

  GetInitiativeDetails(this.initiativeId);

  @override
  String toString() => 'initiativeId: $initiativeId';
}

class InitialInitiative extends InitiativeEvent {}

class SearchInitiative extends InitiativeEvent {
  final String keyword;

  SearchInitiative(this.keyword);

  @override
  String toString() => 'keyword: $keyword';
}
