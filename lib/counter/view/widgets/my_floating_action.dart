import 'package:flutter/material.dart';
import '../../counter_cubit/counter_cubit.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
    required this.counterCubit,
  });

  final CounterCubit counterCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => counterCubit.incrementCounter(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        SizedBox(
          height: 6.0,
        ),
        FloatingActionButton(
          onPressed: () => counterCubit.decrementCounter(),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
