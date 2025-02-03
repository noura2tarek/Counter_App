import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

// Create a BlocObserver to observe all state changes in the application.
class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('${bloc.runtimeType} $change');
  }

  // Observe events
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('${bloc.runtimeType} $event');
  }
}
