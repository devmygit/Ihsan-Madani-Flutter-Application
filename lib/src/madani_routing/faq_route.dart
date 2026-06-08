import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madani/src/index.dart';

class FaqRoutes implements ManagerRouter {
  FaqRoutes();

  static const initialRoute = 'faq';

  static const faqPage = '$initialRoute/faq_page';
  
  // Use faqPage as the default route when initialRoute is accessed
  static const String defaultRoute = faqPage;

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
      } on RouteNotFoundException {
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
    } on RouteNotFoundException {
      log('RouteNotFoundException');
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
    log('FAQ ROUTE: route in faq: ${settings.name}');

    if (!settings.name!.contains(initialRoute)) {
      log('FAQ ROUTE: Not FAQ route, delegating to RoutesHandler');
      return RoutesHandler.handler(settings);
    }
    log('FAQ ROUTE: Processing FAQ route: ${settings.name}');

    addRoute(settings.name!);
    Widget page = const PageNotFound();

    switch (settings.name!) {
      case faqPage:
        log('FAQ ROUTE: Creating FaqPage');
        page = BlocProvider(
          create: (context) {
            log('FAQ ROUTE: Creating FaqBloc');
            return FaqBloc();
          },
          child: const FaqPage(),
        );
        break;
      default:
        log('FAQ ROUTE: Default case - Creating FaqPage');
        page = BlocProvider(
          create: (context) {
            log('FAQ ROUTE: Creating FaqBloc (default)');
            return FaqBloc();
          },
          child: const FaqPage(),
        );
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}

