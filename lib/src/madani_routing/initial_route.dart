import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madani/src/index.dart';
import 'package:madani/src/madani_repos/cluster/cluster_model.dart';

class MadaniRoutes implements ManagerRouter {
  MadaniRoutes();

  static const homeRoute = 'home';

  static const splashscreenRoute = '$homeRoute/madani_splashscreen';
  static const countdownRoute = '$homeRoute/madani_countdown';
  static const mainpageRoute = '$homeRoute/madani_mainpage';
  static const initiativeRoute = '$homeRoute/madani_initiative';
  static const klusterRoute = '$homeRoute/madani_kluster';
  static const klusterDetailRoute = '$homeRoute/madani_kluster_detail';
  static const searchPageRoute = '$homeRoute/search_initiative';

  final List<String> routeHistory = [];

  @override
  void addRoute(String route) {
    routeHistory.add(route);
    log('route initiative add history: $routeHistory');
  }

  @override
  void clearRouteHistory({String? fromRoute}) {
    if (fromRoute != null) {
      try {
        routeHistory.removeRange(
            routeHistory.indexOf(fromRoute) + 1, routeHistory.length);
      } on RouteNotFoundException catch (e) {

        log('Route does not exist');
      } catch (_) {
        log('Route does not exist');
      }
    } else {
      routeHistory.clear();
      log('route add history: $routeHistory');
    }
  }

  @override
  void popHistory() {
    try {
      routeHistory.removeLast();
    } on RouteNotFoundException catch (e) {
      log(e.toString());
    } catch (e) {
      log(e.toString());
    }
    log('route history: $routeHistory');
  }

  @override
  void reset() {
    clearRouteHistory();
    log('route add history: $routeHistory');
  }

  @override
  Route router(RouteSettings settings) {
    log('route in initiative setting: $settings');
    log('route in initiative routeName: ${settings.name!}');
    log('route in initiative object: ${settings.arguments}');

    if (!settings.name!.contains(homeRoute)) {
      return RoutesHandler.handler(settings);
    }

    addRoute(settings.name!);
    // final List<String> route = settings.name!.split('/');
    Widget page = const PageNotFound();
    switch (settings.name!) {
      case splashscreenRoute:
        page = const SplashScreenPage();
        break;
      case countdownRoute:
        page = CountdownPage();
        break;
      case mainpageRoute:
        page = MainPageMadani();
        break;
      case initiativeRoute:
        // Show ClusterPage with default UMUM cluster
        final defaultCluster = clusterModel.first;
        page = ClusterPage(
          titleHeader: 'Inisiatif',
          shortName: defaultCluster.shortName.toLowerCase(),
          icon: SvgPicture.asset(
            defaultCluster.clusterIcon,
            colorFilter: const ColorFilter.mode(
              Colors.transparent,
              BlendMode.srcIn,
            ),
          ),
        );
        break;
      case klusterRoute:
        final dynamic args = settings.arguments;
        if (args != null && args is Map) {
          page = ClusterPage(
            titleHeader: args['title'] ?? 'Inisiatif',
            shortName: args['shortName'] ?? '',
            icon: args['icon'] ?? SvgPicture.asset(
              clusterModel.first.clusterIcon,
              colorFilter: const ColorFilter.mode(
                Colors.transparent,
                BlendMode.srcIn,
              ),
            ),
          );
        } else {
          // Fallback to default cluster if no arguments
          final defaultCluster = clusterModel.first;
          page = ClusterPage(
            titleHeader: 'Inisiatif',
            shortName: defaultCluster.shortName.toLowerCase(),
            icon: SvgPicture.asset(
              defaultCluster.clusterIcon,
              colorFilter: const ColorFilter.mode(
                Colors.transparent,
                BlendMode.srcIn,
              ),
            ),
          );
        }
        break;
      case klusterDetailRoute:
        final dynamic args = settings.arguments;
        if (args != null && args is Map) {
          page = ClusterDetailsPage(
            titleHeader: args['appBarTitle'] ?? 'Inisiatif',
            category: args['category'] ?? '',
            fromHomepage: args['fromHomepage'] ?? false,
            fromResultPage: args['fromResultPage'] ?? false,
          );
        } else {
          // Fallback to default if no arguments
          page = ClusterDetailsPage(
            titleHeader: 'Inisiatif',
            category: '',
            fromHomepage: false,
            fromResultPage: false,
          );
        }
        break;
      case searchPageRoute:
        page = const SearchPage();
        break;
      default:
        // Default to ClusterPage with UMUM cluster
        final defaultCluster = clusterModel.first;
        page = ClusterPage(
          titleHeader: 'Inisiatif',
          shortName: defaultCluster.shortName.toLowerCase(),
          icon: SvgPicture.asset(
            defaultCluster.clusterIcon,
            colorFilter: const ColorFilter.mode(
              Colors.transparent,
              BlendMode.srcIn,
            ),
          ),
        );
    }

    // Use fullscreenDialog for SearchPage to hide bottom navigation bar
    final isSearchPageRoute = settings.name == searchPageRoute;
    
    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
      maintainState: true, // Maintain state of previous routes (like result_page)
      fullscreenDialog: isSearchPageRoute, // Fullscreen for SearchPage to hide bottom menu
    );
  }
}
