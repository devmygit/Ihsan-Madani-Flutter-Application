import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madani/src/index.dart';

class QuestionPageStartPage extends StatefulWidget {
  const QuestionPageStartPage({
    super.key,
    this.startPage = QuestionPageRoutes.initialRoute,
    this.routeSettings,
  });

  static QuestionPageStartPageState of(BuildContext context) {
    return context.findAncestorStateOfType<QuestionPageStartPageState>()!;
  }

  final String startPage;
  final RouteSettings? routeSettings;

  @override
  State<QuestionPageStartPage> createState() => QuestionPageStartPageState();
}

class QuestionPageStartPageState extends State<QuestionPageStartPage> {
  final _navKey = GlobalKey<NavigatorState>();
  final QuestionPageRoutes questionPageRoutes = QuestionPageRoutes();

  Future<void> onExit() async {
    if (mounted) {
      exit(context);
    }
  }

  void exit(BuildContext ctx) {
    if (questionPageRoutes.routeHistory.length <= 1) {
      questionPageRoutes.clearRouteHistory();
      log('route exit 1: ${questionPageRoutes.routeHistory}');
      Navigator.of(context).pop();
    } else {
      questionPageRoutes.popHistory();
      log('route exit 2: ${questionPageRoutes.routeHistory}');
      Navigator.of(ctx).pop();
    }
  }

  @override
  void dispose() {
    questionPageRoutes.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuestionsBloc>(
          create: (context) => QuestionsBloc()..add(LoadStaticQuestions()),
        ),
        // BlocProvider<InitiativeBloc>(
        //   create: (context) => InitiativeBloc(),
        // ),
      ],
      child: Navigator(
        key: _navKey,
        initialRoute: widget.startPage,
        onGenerateRoute: (settings) {
          if (widget.routeSettings?.arguments == null) {
            return questionPageRoutes.router(settings);
          } else {
            return questionPageRoutes.router(widget.routeSettings!);
          }
        },
      ),
    );
  }
}
