import 'dart:async';
import 'dart:developer';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'package:madani/src/index.dart';

part 'accessibility_state.dart';
part 'accessibility_cubit.freezed.dart';
part 'accessibility_cubit.g.dart';

class AccessibilityCubit extends HydratedCubit<AccessibilityState> {
  AccessibilityCubit() : super(AccessibilityState.initial());
  Timer? _timer;

  void openAccessibility(bool isOpen) => emit(state.copyWith(hide: isOpen));

  void postionedContainer(double top) =>
      emit(state.copyWith(topAccessibility: top));

  void colorIndex({required int i}) => emit(state.copyWith(indexColor: i));

  void resetColors({required bool reset}) =>
      emit(state.copyWith(resetColor: reset));

  void toggleAktif({required bool aktif}) =>
      emit(state.copyWith(magnifierHide: aktif));

  void initialDragging({required double dx, required double dy}) =>
      emit(state.copyWith(
        draggingX: dx,
        draggingY: dy,
      ));

  void draggingPositionX({required double x}) =>
      emit(state.copyWith(draggingX: x));
  void draggingPositionY({required double y}) =>
      emit(state.copyWith(draggingY: y));

  // Removed getCountdownTime method - API not used
  // Future<void> getCountdownTime() async {
  //   try {
  //     final data = await HomeRepo().getCountdownTime();
  //     log('syukur: $data');
  //       emit(state.copyWith(launchingStatusModel: data));
  //
  //       if (state.launchingStatusModel.launchingAt!.isNotEmpty) {
  //         final listTime = List<int>.from(parseDateTimeString(
  //             state.launchingStatusModel.launchingAt ??
  //                 DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())));
  //         emit(state.copyWith(dateTimeComponent: listTime));
  //       }
  //   } on StateException catch (e) {
  //     log('error: ${e.message}, ${e.data}');
  //   } on HttpException catch (e) {
  //     log('error: ${e.message}, ${e.data}');
  //   }
  //   catch (e) {
  //     log(e.toString());
  //   }
  // }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      try {
        if (state.launchingStatusModel.launchingAt!.isNotEmpty) {
          final currentTime = parseDateTimeString(
              state.launchingStatusModel.launchingAt ??
                  DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()));
          if (currentTime[3] > 0) {
            emit(state.copyWith(dateTimeComponent: [
              currentTime[0],
              currentTime[1],
              currentTime[2],
              currentTime[3] - 1
            ]));
          } else {
            if (currentTime[2] > 0) {
              emit(state.copyWith(dateTimeComponent: [
                currentTime[0],
                currentTime[1],
                currentTime[2] - 1,
                59
              ]));
            } else {
              if (currentTime[1] > 0) {
                emit(state.copyWith(dateTimeComponent: [
                  currentTime[0],
                  currentTime[1] - 1,
                  59,
                  59
                ]));
              } else {
                if (currentTime[0] > 0) {
                  emit(state.copyWith(
                      dateTimeComponent: [currentTime[0] - 1, 23, 59, 59]));
                } else {
                  _timer?.cancel();
                }
              }
            }
          }
        }
      } on StateException catch (e) {
        log('error: ${e.message}, ${e.data}');
      } on HttpException catch (e) {
        log('error: ${e.message}, ${e.data}');
      }
    });
  }

  @override
  AccessibilityState? fromJson(Map<String, dynamic> json) {
    try {
      final data = AccessibilityState.saveFromJson(json);
      return data;
    } on DataMapException catch (e) {
      return null;
    } catch (e) {
      log('Error fromJson: $e');
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AccessibilityState state) {
    try {
      final data = state.saveToJson();
      return data;
    } on DataMapException catch (e) {
      return null;
    } catch (e) {
      log('Error toJson: $e');
      return null;
    }
  }
}
