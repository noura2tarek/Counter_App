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
        MyFloatingButton(
          onPressed: () => counterBloc.add(CounterIncrementPressedEvent()),
          tooltip: 'Increment',
          icon: Icons.add,
        ),
        SizedBox(
          height: 6.0,
        ),
        //-- Decrement button //
        MyFloatingButton(
          onPressed: () => counterBloc.add(CounterDecrementPressedEvent()),
          tooltip: 'Decrement',
          icon: Icons.remove,
        ),
      ],
    );
  }
}

////////////////////////////////////////
class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({
    super.key,
    required this.tooltip,
    required this.icon,
    this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor:
          Theme.of(context).floatingActionButtonTheme.foregroundColor,
      backgroundColor:
          Theme.of(context).floatingActionButtonTheme.backgroundColor,
      // create an event of type CounterIncrementPressedEvent to update the state
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }
}
