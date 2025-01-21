import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      if (event is CounterIncrementPressedEvent) {
        emit(state + 1);
      }
      if (event is CounterDecrementPressedEvent) {
        emit(state - 1);
      }
    });
  }
}
