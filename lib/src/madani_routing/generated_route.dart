import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:madani/src/index.dart';

Route<dynamic> generatedRoute(RouteSettings settings) {
  log('generated route: ${settings.name}');

  RouteSettings routeSettings = RouteSettings(
    name: settings.name,
    arguments: settings.arguments,
  );

  log('route: ${routeSettings.name}');

  return RoutesHandler.handler(routeSettings);
}
