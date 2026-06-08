import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:madani/src/index.dart';

class RoutesHandler {
  RoutesHandler._();

  static const List<String> routes = [];

  static Route handler(RouteSettings settings) {
    log('route handler: ${settings.name!.split('/').first}');
    log('route handler: ${settings.arguments}');
    log('route handler: ${settings.name}');
    Widget page = const PageNotFound();

    switch (settings.name!.split('/').first) {
      case MadaniRoutes.homeRoute:
        page = HomepageStartPage(
          startPage: settings.name!,
          routeSettings: settings,
        );
        break;
      case HomeRoutes.initialRoute:
        page = HomeStartPage(
          startPage: settings.name!,
          routeSettings: settings,
        );
        break;
      case QuestionPageRoutes.initialRoute:
        // If route is just 'question', use questionPage as default
        final questionStartPage = settings.name == QuestionPageRoutes.initialRoute 
            ? QuestionPageRoutes.questionPage 
            : settings.name!;
        page = QuestionPageStartPage(
          startPage: questionStartPage,
          routeSettings: settings,
        );
        break;
      case FaqRoutes.initialRoute:
        // If route is just 'faq', use faqPage as default
        final faqStartPage = settings.name == FaqRoutes.initialRoute 
            ? FaqRoutes.faqPage 
            : settings.name!;
        page = FaqStartPage(
          startPage: faqStartPage,
          routeSettings: settings,
        );
        break;
      default:
    }

    // Use fullscreenDialog for FAQ and Question pages to make them fullscreen and hide bottom menu
    final isFaqRoute = settings.name!.split('/').first == FaqRoutes.initialRoute;
    final isQuestionRoute = settings.name!.split('/').first == QuestionPageRoutes.initialRoute;
    
    return MaterialPageRoute<dynamic>(
      builder: (context) => page,
      settings: settings,
      maintainState: true,
      fullscreenDialog: isFaqRoute || isQuestionRoute,
    );
  }
}
