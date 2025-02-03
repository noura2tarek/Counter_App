part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

// increment event
class CounterIncrementPressedEvent extends CounterEvent {}
// Decrement event
class CounterDecrementPressedEvent extends CounterEvent {}