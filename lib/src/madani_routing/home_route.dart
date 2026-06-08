import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:madani/src/index.dart';

class HomeRoutes implements ManagerRouter {
  HomeRoutes();

  static const initialRoute = 'home';

  static const madaniHome = '$initialRoute/madani_dashboard_home';

  final List<String> routeHistory = [];

  @override
  void addRoute(String route) {
    routeHistory.add(route);
    log('route home add history: $routeHistory');
  }

  @override
  void clearRouteHistory({String? fromRoute}) {
    if (fromRoute != null) {
      try {
        routeHistory.removeWhere((el) => el != fromRoute);
      } on HttpException catch (e) {
        log(e.toString());
      }
      catch (_) {
        log('Route does not exist');
        throw RouteNotFoundException(message: 'Route does not exist');
      }
    } else {
      routeHistory.clear();
    }
  }

  @override
  void popHistory() {
    try {
      routeHistory.removeLast();
    } on HttpException catch (e) {
      log(e.toString());
    }
    catch (e) {
      log('Route does not exist');
      throw RouteNotFoundException(message: 'Route does not exist');
    }
    log('route pop history: $routeHistory');
  }

  @override
  void reset() {
    clearRouteHistory();
  }

  @override
  Route router(RouteSettings settings) {
    log('route in Home: ${settings.name}');
    log('route in Home: ${settings.arguments}');

    if (!settings.name!.contains(initialRoute)) {
      return RoutesHandler.handler(settings);
    }
    log('route 1: ${settings.name}');

    addRoute(settings.name!);
    // final List<String> route = settings.name!.split('/');
    Widget page = const PageNotFound();

    switch (settings.name!) {
      case madaniHome:
        page = MadaniHomePage();
        break;
      default:
        page = MadaniHomePage();
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}
