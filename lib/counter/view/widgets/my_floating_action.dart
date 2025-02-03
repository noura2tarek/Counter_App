import 'package:counter_app/counter/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
    required this.counterBloc,
  });

  final CounterBloc counterBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //-- Add button //
        FloatingActionButton(
          // create an event of type CounterIncrementPressedEvent to update the state
          onPressed: () => counterBloc.add(CounterIncrementPressedEvent()),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        SizedBox(
          height: 6.0,
        ),
        //-- Decrement button //
        FloatingActionButton(
          // create an event of type CounterDecrementPressedEvent to update the state
          onPressed: () => counterBloc.add(CounterDecrementPressedEvent()),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
