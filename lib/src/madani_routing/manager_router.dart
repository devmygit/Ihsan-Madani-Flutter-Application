import 'package:flutter/material.dart';

abstract class ManagerRouter {
  void addRoute(String route);

  void clearRouteHistory({String? fromRoute});

  void popHistory();

  void reset();

  void router(RouteSettings settings);
}
