import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  // Increment the cubit current state by 1
  void incrementCounter() {
    emit(state + 1);
  }

  // Decrement the cubit current state by 1

  void decrementCounter() {
    emit(state - 1);
  }
}
