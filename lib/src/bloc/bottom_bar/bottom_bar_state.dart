part of 'bottom_bar_cubit.dart';

@freezed
abstract class BottomBarState with _$BottomBarState {
  const factory BottomBarState({
    final Object? argument,
    required final int index,
    required final int counter,
    required final ModuleRoute homeRoute,
    required final ModuleRoute initiativeRoute,
    required final ModuleRoute informationRoute,
  }) = _BottomBarState;

  factory BottomBarState.initial() {
    return const BottomBarState(
      index: 0,
      counter: 0,
      homeRoute: ModuleRoute(
        currentRoute: HomeRoutes.initialRoute,
        previousRoute: '',
      ),
      initiativeRoute: ModuleRoute(
        currentRoute: MadaniRoutes.initiativeRoute,
        previousRoute: '',
      ),
      informationRoute: ModuleRoute(
        currentRoute: '',
        previousRoute: '',
      ),
    );
  }
}
