import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class EnhancedBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    log('╔╣BLoC Observer', name: 'BLoC-Created');
    log('║   BLoC Created -- Bloc :${bloc.runtimeType}', name: 'BLoC-Created');
    log('╚═════════════════════════════════════════════════════════════════════════════╝',
        name: 'BLoC-Created');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('╔╣BLoC Observer', name: 'BLoC-Event');
    log('║   BLoC Event $event is added to bloc ${bloc.runtimeType}',
        name: 'BLoC-Event');
    log('╚═════════════════════════════════════════════════════════════════════════════╝',
        name: 'BLoC-Event');
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  //   log('╔╣BLoC Observer', name: 'BLoC-Created');
  //   log('║BLoC ${bloc.runtimeType} state changed: $change',
  //       name: 'BLoC-Created');
  //   log('╚═════════════════════════════════════════════════════════════════════════════╝',
  //       name: 'BLoC-onChanged');
  // }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('╔╣BLoC Observer', name: 'BLoC-onClosed');
    log('║   BLoC  ${bloc.runtimeType} is closed', name: 'BLoC-onClosed');
    log('╚═════════════════════════════════════════════════════════════════════════════╝',
        name: 'BLoC-onClosed');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('╔╣BLoC Observer', name: 'BLoC-onError');
    log('║   BLoC Error occurred in bloc ${bloc.runtimeType}: $error',
        name: 'BLoC-onError');
    log('╚═════════════════════════════════════════════════════════════════════════════╝',
        name: 'BLoC-onError');
  }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   log('╔╣BLoC Observer', name: 'BLoC-Created');
  //   log('║BLoC Transition: $transition', name: 'BLoC-Created');
  //   log('╚═════════════════════════════════════════════════════════════════════════════╝',
  //       name: 'BLoC-Transition');
  // }
}
