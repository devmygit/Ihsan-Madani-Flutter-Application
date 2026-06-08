import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madani/src/bloc/home/home_bloc.dart';
import 'package:madani/src/index.dart';

class HomepageStartPage extends StatefulWidget {
  const HomepageStartPage({
    super.key,
    this.startPage = MadaniRoutes.initiativeRoute,
    this.routeSettings,
  });

  static HomepageStartPageState of(BuildContext context) {
    return context.findAncestorStateOfType<HomepageStartPageState>()!;
  }

  final String startPage;
  final RouteSettings? routeSettings;

  @override
  State<HomepageStartPage> createState() => HomepageStartPageState();
}

class HomeStartPage extends StatefulWidget {
  const HomeStartPage({
    super.key,
    this.startPage = HomeRoutes.initialRoute,
    this.routeSettings,
  });

  static HomeStartPageState of(BuildContext context) {
    return context.findAncestorStateOfType<HomeStartPageState>()!;
  }

  final String startPage;
  final RouteSettings? routeSettings;

  @override
  State<HomeStartPage> createState() => HomeStartPageState();
}

class HomepageStartPageState extends State<HomepageStartPage> {
  final _navKey = GlobalKey<NavigatorState>();
  final MadaniRoutes madaniRoutes = MadaniRoutes();

  Future<void> onExit() async {
    if (mounted) {
      exit(context);
    }
  }

  void exit(BuildContext ctx) {
    if (madaniRoutes.routeHistory.length <= 1) {
      Navigator.of(context).pop();
    } else {
      madaniRoutes.popHistory();
      Navigator.of(ctx).pop();
    }
  }

  @override
  void dispose() {
    madaniRoutes.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get InitiativeBloc from parent context (MainPageMadani or root level)
    // This ensures ClusterPage uses the same InitiativeBloc instance as home_page.dart
    final initiativeBloc = context.read<InitiativeBloc>();
    
    return MultiBlocProvider(
      providers: [
        // Use BlocProvider.value to share the same InitiativeBloc instance from parent
        // This ensures state synchronization between home_page.dart and ClusterPage
        BlocProvider<InitiativeBloc>.value(
          value: initiativeBloc,
        ),
      ],
      child: Navigator(
        key: _navKey,
        initialRoute: widget.startPage,
        onGenerateRoute: (settings) {
          if (widget.routeSettings?.arguments == null) {
            return madaniRoutes.router(settings);
          } else {
            return madaniRoutes.router(widget.routeSettings!);
          }
        },
      ),
    );
  }
}

class HomeStartPageState extends State<HomeStartPage> {
  final _navKey = GlobalKey<NavigatorState>();
  final HomeRoutes homeRoutes = HomeRoutes();

  Future<void> onExit() async {
    if (mounted) {
      exit(context);
    }
  }

  void exit(BuildContext ctx) {
    if (homeRoutes.routeHistory.length <= 1) {
      // homeRoutes.clearRouteHistory();
      Navigator.of(context).pop();
    } else {
      homeRoutes.popHistory();
      Navigator.of(ctx).pop();
    }
  }

  void resetToMainScreen() {
    homeRoutes.clearRouteHistory();
    _navKey.currentState?.popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    homeRoutes.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get InitiativeBloc from parent context (MainPageMadani or root level)
    // This ensures ClusterPage uses the same InitiativeBloc instance as home_page.dart
    final initiativeBloc = context.read<InitiativeBloc>();
    
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          lazy: false,
          create: (context) => HomeBloc()..add(SaveVisitorId()),
        ),
        // BlocProvider<AccessibilityCubit>(
        //     lazy: false, create: (context) => AccessibilityCubit()),
        // Use BlocProvider.value to share the same InitiativeBloc instance from parent
        // This ensures state synchronization between home_page.dart and ClusterPage
        BlocProvider<InitiativeBloc>.value(
          value: initiativeBloc,
        ),
        BlocProvider<CarouselPosterCubit>(
          create: (create) => CarouselPosterCubit(),
        ),
      ],
      child: Navigator(
        key: _navKey,
        initialRoute: widget.startPage,
        onGenerateRoute: (settings) {
          if (widget.routeSettings?.arguments == null) {
            return homeRoutes.router(settings);
          } else {
            return homeRoutes.router(widget.routeSettings!);
          }
        },
      ),
    );
  }
}

