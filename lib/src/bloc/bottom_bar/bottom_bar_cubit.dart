import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madani/src/index.dart';
import 'package:madani/src/model/module_route.dart';

part 'bottom_bar_state.dart';
part 'bottom_bar_cubit.freezed.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarState.initial());

  // Method to change the current index and route
  void changeNavigation({
    required int index,
    String? homeRoute,
    String? initiativeRoute,
    String? informationRoute,
    Object? args,
  }) {
    emit(
      state.copyWith(
        counter: index == state.index ? state.counter + 1 : 0,
        index: index,
        argument: args,
        homeRoute: state.homeRoute.copyWith(
          previousRoute: state.homeRoute.currentRoute,
          currentRoute: homeRoute,
        ),
        initiativeRoute: state.initiativeRoute.copyWith(
          previousRoute: state.initiativeRoute.currentRoute,
          currentRoute: initiativeRoute,
        ),
        informationRoute: state.informationRoute.copyWith(
          previousRoute: state.informationRoute.currentRoute,
          currentRoute: informationRoute,
        ),
      ),
    );
  }

  // Method to navigate to a different screen
  void navigateTo(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  // Method to pop the current screen from the navigation stack
  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  // Method to replace the current screen with a new one
  void navigateReplacement(BuildContext context, String newRouteName,
      {Object? arguments}) {
    Navigator.of(context)
        .pushReplacementNamed(newRouteName, arguments: arguments);
  }

  // Method to reset the navigation state to initial values
  void resetNavigation() {
    emit(BottomBarState.initial());
  }
}
