import 'dart:convert';
import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:madani/src/index.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';
part 'home_bloc.g.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  HomeBloc() : super((HomeState.initial())) {
    // on<GetAnnoucement>(_getAnnoucement, transformer: droppable()); // Removed - API not used
    on<GetBanner>(_getBanner); // Removed transformer untuk debug
    // on<GetPoster>(_getPoster, transformer: droppable()); // Removed - API not used
    on<GetPopularSearches>(_getPopularSearches, transformer: droppable());
    on<GetInfographics>(_getInfographics, transformer: droppable());
    on<CheckingData>(_checkingData);
    on<SaveVisitorId>(_saveVisitorId);
  }

  // Removed _getAnnoucement method - API getAnnoucement() not used
  // Future<void> _getAnnoucement(GetAnnoucement event, Emitter emit) async {
  //   try {
  //     emit(state.copyWith(status: HomeStatus.loading));
  //
  //     Pagination<AnnoucementModel> annoucement =
  //         await HomeRepo().getAnnoucement(page: event.page);
  //
  //     final List<AnnoucementModel> newAnnoucement =
  //         event.page >= 2 ? [...state.annoucement.data] : [];
  //
  //     emit(state.copyWith(
  //         status: HomeStatus.completed,
  //         annoucement: annoucement.copyWith(
  //           data: [
  //             ...newAnnoucement,
  //             ...annoucement.data,
  //           ],
  //         )));
  //   } on HttpException catch (e) {
  //     log('Error getting annoucement: $e');
  //     emit(state.copyWith(
  //       status: HomeStatus.error,
  //       errorMessage: 'Error getting annoucement: $e',
  //     ));
  //   } catch (e) {
  //     log('Error getting annoucement: $e');
  //     emit(state.copyWith(
  //       status: HomeStatus.error,
  //       errorMessage: 'Error getting annoucement: $e',
  //     ));
  //   }
  // }

  Future<void> _getBanner(GetBanner event, Emitter emit) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      
      Pagination<BannerModel> banner =
          await HomeRepo().getBanner(page: event.page);

      print('LOGAPP BLOC: Banner data dari repo: ${banner.data.length} items');
      print('LOGAPP BLOC: Banner IDs dari repo: ${banner.data.map((e) => e.id).toList()}');

      final List<BannerModel> newBanner =
          event.page >= 2 ? [...state.banner.data] : [];

      emit(state.copyWith(
          status: HomeStatus.completed,
          banner: banner.copyWith(
            data: [
              ...newBanner,
              ...banner.data,
            ],
          )));
      
      print('LOGAPP BLOC: Total banner dalam state: ${state.banner.data.length} items');
      print('LOGAPP BLOC: Banner IDs dalam state: ${state.banner.data.map((e) => e.id).toList()}');
    } on HttpException catch (e) {
      log('Error getting banner: $e');
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: 'Error getting banner: $e',
      ));
    } catch (e, stackTrace) {
      log('Error getting banner: $e');
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: 'Error getting banner: $e',
      ));
    }
  }

  // Removed _getPoster method - API getPoster() not used
  // Future<void> _getPoster(GetPoster event, Emitter emit) async {
  //   try {
  //     emit(state.copyWith(status: HomeStatus.loading));
  //
  //     Pagination<PosterModel> poster =
  //         await HomeRepo().getPoster(page: event.page);
  //
  //     final List<PosterModel> newPoster =
  //         event.page >= 2 ? [...state.poster.data] : [];
  //
  //     log('url poster: ${poster.data}');
  //
  //     emit(state.copyWith(
  //         status: HomeStatus.completed,
  //         poster: poster.copyWith(
  //           data: [
  //             ...newPoster,
  //             ...poster.data,
  //           ],
  //         )));
  //   } on HttpException catch (e) {
  //     log('Error getting poster: $e');
  //     emit(state.copyWith(
  //       status: HomeStatus.error,
  //       errorMessage: 'Error getting poster: $e',
  //     ));
  //   } catch (e) {
  //     log('Error getting poster: $e');
  //     emit(state.copyWith(
  //       status: HomeStatus.error,
  //       errorMessage: 'Error getting poster: $e',
  //     ));
  //   }
  // }

  Future<void> _getPopularSearches(GetPopularSearches event, Emitter emit) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      
      Pagination<InitiativeModel> popularSearches =
          await HomeRepo().getPopularSearches(page: event.page);

      print('LOGAPP BLOC: Popular searches data dari repo: ${popularSearches.data.length} items');
      print('LOGAPP BLOC: Popular searches IDs dari repo: ${popularSearches.data.map((e) => e.id).toList()}');

      emit(state.copyWith(
          status: HomeStatus.completed,
          popularSearches: popularSearches));
      
      print('LOGAPP BLOC: Total popular searches dalam state: ${state.popularSearches.data.length} items');
      print('LOGAPP BLOC: Popular searches IDs dalam state: ${state.popularSearches.data.map((e) => e.id).toList()}');
      print('LOGAPP BLOC: Popular searches sequences dalam state: ${state.popularSearches.data.map((e) => e.sequence).toList()}');
    } on HttpException catch (e) {
      log('Error getting popular searches: $e');
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: 'Error getting popular searches: $e',
      ));
    } catch (e) {
      log('Error getting popular searches: $e');
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: 'Error getting popular searches: $e',
      ));
    }
  }

  Future<void> _getInfographics(GetInfographics event, Emitter emit) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      
      Pagination<InfographicModel> infographics =
          await HomeRepo().getInfographics(page: event.page);

      print('LOGAPP BLOC: Infographics data dari repo: ${infographics.data.length} items');
      print('LOGAPP BLOC: Infographic IDs dari repo: ${infographics.data.map((e) => e.id).toList()}');

      emit(state.copyWith(
          status: HomeStatus.completed,
          infographics: infographics));
      
      print('LOGAPP BLOC: Total infographics dalam state: ${state.infographics.data.length} items');
      print('LOGAPP BLOC: Infographic IDs dalam state: ${state.infographics.data.map((e) => e.id).toList()}');
    } on HttpException catch (e) {
      log('Error getting infographics: $e');
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: 'Error getting infographics: $e',
      ));
    } catch (e) {
      log('Error getting infographics: $e');
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: 'Error getting infographics: $e',
      ));
    }
  }

  void _checkingData(CheckingData event, Emitter emit) {
    log('status sekarang : ${state.status}');
    if (state.status == HomeStatus.visitor) {
      add(GetBanner());
      // add(GetAnnoucement()); // Removed - API not used
      // add(GetPoster()); // Removed - API not used
      add(GetPopularSearches());
      add(GetInfographics());
    }
    log('status sekarang1 : ${state.status}');
  }

  Future<void> _saveVisitorId(SaveVisitorId event, Emitter emit) async {
    add(GetBanner());
    // add(GetAnnoucement()); // Removed - API not used
    // add(GetPoster()); // Removed - API not used
    add(GetPopularSearches());
    add(GetInfographics());
    
    if (state.status == HomeStatus.initial) {
      try {
        emit(state.copyWith(status: HomeStatus.loading));

        // Removed - API getVisitorIdMeta() not used
        // final visitorId = await HomeRepo().getVisitorIdMeta();
        // Using empty string as default visitor ID
        final visitorId = '';

        emit(state.copyWith(
          status: HomeStatus.visitor,
          visitorId: visitorId,
        ));

        Visitor.getId = visitorId;
      } on HttpException catch (e) {
        log('Error getting poster: $e');
        emit(state.copyWith(
          status: HomeStatus.error,
          errorMessage: 'Error getting poster: $e',
        ));
      } catch (e) {
        log('Error saving visitor id: $e');
        emit(state.copyWith(
          status: HomeStatus.error,
          errorMessage: 'Error saving visitor id: $e',
        ));
      }
    }

    Visitor.getId = state.visitorId;
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    try {
      final state = HomeState.saveFromJson(json);
      return state;
    } on DataMapException catch (e) {
      return null;
    } catch (e) {
      log('Home FromJson : $e');
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    if (state.status == HomeStatus.completed) {
      return state.saveToJson();
    }
    return null;
  }
}
