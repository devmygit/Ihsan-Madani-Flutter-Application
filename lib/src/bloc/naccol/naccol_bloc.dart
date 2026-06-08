import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madani/src/index.dart';

part 'naccol_bloc.freezed.dart';

enum NaccolStatus {
  initial,
  loading,
  completed,
  error,
}

@freezed
abstract class NaccolState with _$NaccolState {
  const factory NaccolState({
    required List<NaccolModel> data,
    required NaccolStatus status,
    required String errorMessage,
  }) = _NaccolState;

  factory NaccolState.initial() => const NaccolState(
        data: [],
        status: NaccolStatus.initial,
        errorMessage: '',
      );
}

class NaccolBloc extends Cubit<NaccolState> {
  NaccolBloc() : super(NaccolState.initial());

  Future<void> loadNaccolData() async {
    try {
      print('LOGAPP BLOC: NACCOL - Starting to load data');
      emit(state.copyWith(status: NaccolStatus.loading));
      print('LOGAPP BLOC: NACCOL - State updated to loading');

      print('LOGAPP BLOC: NACCOL - Calling NaccolRepo().getNaccolData()');
      List<NaccolModel> naccolData = await NaccolRepo().getNaccolData();
      print('LOGAPP BLOC: NACCOL - Data received from API: ${naccolData.length} items');

      // Ensure data is sorted by sequence
      naccolData.sort((a, b) => a.sequence.compareTo(b.sequence));
      print('LOGAPP BLOC: NACCOL - Data sorted by sequence');

      emit(state.copyWith(
        status: NaccolStatus.completed,
        data: naccolData,
      ));
      print('LOGAPP BLOC: NACCOL - State updated to completed with ${naccolData.length} items');
    } on HttpException catch (e) {
      print('LOGAPP BLOC: NACCOL - HttpException error: $e');
      log('Error loading NACCOL data: $e');
      emit(state.copyWith(
        status: NaccolStatus.error,
        errorMessage: 'Error loading NACCOL data: $e',
      ));
    } catch (e) {
      print('LOGAPP BLOC: NACCOL - General error: $e');
      log('Error loading NACCOL data: $e');
      emit(state.copyWith(
        status: NaccolStatus.error,
        errorMessage: 'Error loading NACCOL data: $e',
      ));
    }
  }
}

