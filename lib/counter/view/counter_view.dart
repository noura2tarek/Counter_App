import 'package:counter_app/counter/counter_cubit/counter_cubit.dart';
import 'package:counter_app/counter/view/widgets/my_floating_action.dart';
import 'package:counter_app/counter/view/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    var counterCubit = CounterCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple.shade200,
      ),
      /*-------- The body using bloc consumer ---------*/
      body: BlocConsumer<CounterCubit, int>(
        //-- listener of the bloc consumer --//
        listener: (context, state) {
          // show a message whenever the counter reaches 10 or -10.
          if (state == -10 || state == 10) {
            if (state == 10) {
              ScaffoldMessenger.of(context).showSnackBar(
                mySnackBar(
                  message: 'The counter reaches 10.',
                ),
              );
            }
            if (state == -10) {
              ScaffoldMessenger.of(context).showSnackBar(
                mySnackBar(
                  message: 'The counter reaches -10.',
                ),
              );
            }
          }
        },
        //-- builder of the bloc consumer --//
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this times:',
              ),
              Text(
                '$state',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(
        counterCubit: counterCubit,
      ),
    );
  }
}

/////////////////////////////////////////////
