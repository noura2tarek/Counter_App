import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressedEvent>(_counterIncrementPressed);
    on<CounterDecrementPressedEvent>(_counterDecrementPressed);
  }

  // Handle counter increment event
  Future<void> _counterIncrementPressed(
      CounterIncrementPressedEvent event, emit) async {
    emit(state + 1);
  }

  // Handle counter decrement event
  Future<void> _counterDecrementPressed(
      CounterDecrementPressedEvent event, emit) async {
    emit(state - 1);
  }
}
