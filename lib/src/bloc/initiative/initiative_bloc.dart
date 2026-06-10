import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:madani/src/index.dart';

part 'initiative_event.dart';
part 'initiative_state.dart';
part 'initiative_bloc.freezed.dart';
part 'initiative_bloc.g.dart';

class InitiativeBloc extends HydratedBloc<InitiativeEvent, InitiativeState> {
  InitiativeBloc() : super(InitiativeState.initial()) {
    on<GetInitiative>(_getInitiative, transformer: droppable());
    on<GetInitiativeDetails>(_getInitiativeDetails);
    on<InitialInitiative>(_initialInitiative);
    on<SearchInitiative>(_searchInitiative, transformer: droppable());
    
    // Reset status to initial after hydration to prevent auto-navigation
    // This ensures that hydrated state doesn't trigger navigation listeners
    if (state.getInitiativeStatus != GetInitiativeStatus.initial) {
      emit(state.copyWith(getInitiativeStatus: GetInitiativeStatus.initial));
    }
  }

  Future<void> _getInitiative(GetInitiative event, Emitter emit) async {
    emit(state.copyWith(getInitiativeStatus: GetInitiativeStatus.loading));
    print('LOGAPP BLOC: GetInitiative event - page value: ${event.page}');
    try {
      final Pagination<InitiativeModel> initiative =
          await InitiativeRepo().getIndexInitiative(
        cluster: event.cluster,
        search: event.search,
        page: event.page,
      );

      // If page > 0 AND same cluster, append to existing data. Otherwise, replace data (first load or cluster change)
      final isSameCluster = event.cluster.toLowerCase() == state.currentCluster.toLowerCase();
      final shouldAppend = event.page > 0 && isSameCluster;
      final List<InitiativeModel> data =
          shouldAppend ? [...state.initiative.data] : [];
      
      print('LOGAPP BLOC: Initiative - page: ${event.page}, cluster: ${event.cluster}, currentCluster: ${state.currentCluster}, existing data: ${state.initiative.data.length}, new data from API: ${initiative.data.length}, isSameCluster: $isSameCluster, will append: $shouldAppend');
      
      // Create the new initiative data with merged data
      final newInitiative = initiative.copyWith(
        data: [
          ...data,
          ...initiative.data,
        ],
      );
      
      print('LOGAPP BLOC: Initiative - Final data count after merge: ${newInitiative.data.length}');
      
      // Emit completed state
      emit(
        state.copyWith(
          getInitiativeStatus: GetInitiativeStatus.completed,
          currentCluster: event.cluster,
          initiative: newInitiative,
        ),
      );
      
      // Reset to initial after emit (for navigation logic)
      // This ensures UI can detect when data is ready
      emit(
        state.copyWith(
          getInitiativeStatus: GetInitiativeStatus.initial,
          currentCluster: event.cluster,
          initiative: newInitiative,
        ),
      );
    } on HttpException catch (e) {
      emit(state.copyWith(getInitiativeStatus: GetInitiativeStatus.error));
    } on StateException catch (e) {
      emit(state.copyWith(getInitiativeStatus: GetInitiativeStatus.error));
    } catch (e) {
      log('Error getting initiative $e');
      emit(state.copyWith(getInitiativeStatus: GetInitiativeStatus.error));
    }
  }

  Future<void> _getInitiativeDetails(
      GetInitiativeDetails event, Emitter emit) async {
    emit(state.copyWith(detailInitiativeStatus: DetailInitiativeStatus.loading));
    try {
      final initiative = await InitiativeRepo()
          .getDetailInitiative(initiativeId: event.initiativeId);

      emit(state.copyWith(
        detailInitiativeStatus: DetailInitiativeStatus.completed,
        initiativeDetail: initiative,
      ));
      emit(
        state.copyWith(detailInitiativeStatus: DetailInitiativeStatus.initial),
      );
    } on HttpException catch (e) {
      emit(state.copyWith(detailInitiativeStatus: DetailInitiativeStatus.error));
      log('Error getting detail initiative $e');
    } on StateException catch (e) {
      emit(state.copyWith(detailInitiativeStatus: DetailInitiativeStatus.error));
      log('Error getting detail initiative $e');
    } catch (e) {
      emit(state.copyWith(detailInitiativeStatus: DetailInitiativeStatus.error));
      log('Error getting detail initiative $e');
    }
  }

  void _initialInitiative(InitialInitiative event, Emitter emit) {
    emit(
      state.copyWith(
        status: InitiativeStatus.initial,
        initiative: Pagination<InitiativeModel>.initial(),
      ),
    );
  }

  Future<void> _searchInitiative(SearchInitiative event, Emitter emit) async {
    emit(state.copyWith(getInitiativeStatus: GetInitiativeStatus.loading));
    try {
      final Pagination<InitiativeModel> initiative =
          await InitiativeRepo().searchArticlesByKeyword(
        keyword: event.keyword,
      );
      
      print('BLOC: Search completed - keyword="${event.keyword}", data.length=${initiative.data.length}');
      emit(
        state.copyWith(
          getInitiativeStatus: GetInitiativeStatus.completed,
          initiative: initiative,
        ),
      );
      print('BLOC: Emitting initial state after search');
      emit(
        state.copyWith(
          getInitiativeStatus: GetInitiativeStatus.initial,
          initiative: initiative,
        ),
      );
    } on HttpException catch (e) {
      emit(state.copyWith(getInitiativeStatus: GetInitiativeStatus.error));
    } on StateException catch (e) {
      emit(state.copyWith(getInitiativeStatus: GetInitiativeStatus.error));
    } catch (e) {
      log('Error searching initiative $e');
      emit(state.copyWith(getInitiativeStatus: GetInitiativeStatus.error));
    }
  }

  @override
  InitiativeState? fromJson(Map<String, dynamic> json) {
    final hydratedState = InitiativeState.saveFromJson(json);
    // Reset status to initial after hydration to prevent auto-navigation
    // This ensures that hydrated state doesn't trigger navigation listeners
    if (hydratedState != null && hydratedState.getInitiativeStatus != GetInitiativeStatus.initial) {
      return hydratedState.copyWith(getInitiativeStatus: GetInitiativeStatus.initial);
    }
    return hydratedState;
  }

  @override
  Map<String, dynamic>? toJson(InitiativeState state) {
    return state.saveToJson();
  }
}
