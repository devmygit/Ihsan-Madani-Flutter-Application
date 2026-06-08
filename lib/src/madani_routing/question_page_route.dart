import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:madani/src/index.dart';

class QuestionPageRoutes implements ManagerRouter {
  QuestionPageRoutes();

  static const initialRoute = 'question';

  static const questionPage = '$initialRoute/question_page';
  static const resultPage = '$initialRoute/result_page';

  final List<String> routeHistory = [];

  @override
  void addRoute(String route) {
    routeHistory.add(route);
    log('route add history: $routeHistory');
  }

  @override
  void clearRouteHistory({String? fromRoute}) {
    if (fromRoute != null) {
      try {
        routeHistory.removeWhere((el) => el != fromRoute);
      } on RouteNotFoundException catch (e) {
        log('Route does not exist');
      } catch (_) {
        log('Route does not exist');
      }
    } else {
      routeHistory.clear();
    }
  }

  @override
  void popHistory() {
    try {
      routeHistory.removeLast();
    } on RouteNotFoundException catch (e) {
      log('Route does not exist');
    } catch (e) {
      log(e.toString());
    }
    log('route pop history: $routeHistory');
  }

  @override
  void reset() {
    clearRouteHistory();
  }

  @override
  Route router(RouteSettings settings) {
    log('route in question: ${settings.name}');

    if (!settings.name!.contains(initialRoute)) {
      return RoutesHandler.handler(settings);
    }
    log('route 1: ${settings.name}');

    addRoute(settings.name!);
    // final List<String> route = settings.name!.split('/');
    Widget page = const PageNotFound();

    switch (settings.name!) {
      case questionPage:
        page = const MadaniQuestionPage();
        break;
      case resultPage:
        page = const ResultPage();
        break;
      default:
        page = const MadaniQuestionPage();
    }

    // Use fullscreenDialog for questionPage and resultPage to hide bottom navigation bar
    final isQuestionPageRoute = settings.name == questionPage || settings.name == resultPage;

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
      fullscreenDialog: isQuestionPageRoute, // Fullscreen for question pages to hide bottom menu
    );
  }
}
