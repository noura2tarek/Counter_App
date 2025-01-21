part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class CounterIncrementPressedEvent extends CounterEvent {}
class CounterDecrementPressedEvent extends CounterEvent {}