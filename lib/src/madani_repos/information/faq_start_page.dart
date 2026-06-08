import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madani/src/index.dart';

class FaqStartPage extends StatefulWidget {
  const FaqStartPage({
    super.key,
    this.startPage = FaqRoutes.initialRoute,
    this.routeSettings,
  });

  static FaqStartPageState of(BuildContext context) {
    return context.findAncestorStateOfType<FaqStartPageState>()!;
  }

  final String startPage;
  final RouteSettings? routeSettings;

  @override
  State<FaqStartPage> createState() => FaqStartPageState();
}

class FaqStartPageState extends State<FaqStartPage> {
  final _navKey = GlobalKey<NavigatorState>();
  final FaqRoutes faqRoutes = FaqRoutes();

  Future<void> onExit() async {
    if (mounted) {
      exit(context);
    }
  }

  void exit(BuildContext ctx) {
    if (faqRoutes.routeHistory.length <= 1) {
      faqRoutes.clearRouteHistory();
      log('route exit 1: ${faqRoutes.routeHistory}');
      // Use rootNavigator to ensure we pop from the correct Navigator
      if (Navigator.of(context, rootNavigator: true).canPop()) {
        Navigator.of(context, rootNavigator: true).pop();
      } else {
        Navigator.of(context).pop();
      }
    } else {
      faqRoutes.popHistory();
      log('route exit 2: ${faqRoutes.routeHistory}');
      // Use nested Navigator for internal navigation
      if (_navKey.currentState?.canPop() ?? false) {
        _navKey.currentState?.pop();
      } else {
        Navigator.of(ctx).pop();
      }
    }
  }

  @override
  void dispose() {
    faqRoutes.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericCubit<int>.withValue(-1),
      child: Navigator(
        key: _navKey,
        initialRoute: widget.startPage,
        onGenerateRoute: (settings) {
          if (widget.routeSettings?.arguments == null) {
            return faqRoutes.router(settings);
          } else {
            return faqRoutes.router(widget.routeSettings!);
          }
        },
      ),
    );
  }
}

