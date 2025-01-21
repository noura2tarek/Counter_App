import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

// Create a BlocObserver to observe all state changes in the application.
class CounterObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('${bloc.runtimeType} $change');
  }
}
