import 'package:counter_app/counter/counter_bloc/counter_bloc.dart';
import 'package:counter_app/counter/view/widgets/my_floating_action.dart';
import 'package:counter_app/theme/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    var counterBloc = context.read<CounterBloc>();
    var themeBloc = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              themeBloc.add(ThemeChangedEvent());
            },
            icon: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Icon(state.themeMode == ThemeMode.light
                    ? Icons.brightness_4_rounded
                    : Icons.brightness_5_rounded);
              },
            ),
          ),
        ],
      ),
      /*-------- The body using bloc listener and bloc builder ---------*/
      // body: BlocListener<CounterBloc, int>(
      //   listener: (context, state) {
      //     // Show a snack bar when the counter reaches a negative value for example:
      //     if (state == -1) {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //           mySnackBar(message: 'Counter reaches a negative value.'));
      //     }
      //   },
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         const Text(
      //           'You have pushed the button this many times:',
      //         ),
      //         BlocBuilder<CounterBloc, int>(
      //           builder: (context, state) {
      //             return Text(
      //               '$state',
      //               style: Theme.of(context).textTheme.headlineMedium,
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      /*-------- The body using bloc consumer only ---------*/
      body: BlocConsumer<CounterBloc, int>(
        //-- listener of the bloc consumer --//
        listener: (context, state) {
          // show a message whenever the counter reaches 5 or -5 for example.
          if (state == -5 || state == 5) {
            if (state == 5) {
              ScaffoldMessenger.of(context).showSnackBar(
                mySnackBar(
                  message: 'The counter reaches 5.',
                ),
              );
            }
            if (state == -5) {
              ScaffoldMessenger.of(context).showSnackBar(
                mySnackBar(
                  message: 'The counter reaches -5.',
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
      floatingActionButton: MyFloatingActionButton(counterBloc: counterBloc),
    );
  }
}

/////////////////////////////////////////////
//-- Snack bar --//
SnackBar mySnackBar({required String message}) {
  return SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevation: 1.0,
    duration: Duration(milliseconds: 1500),
    backgroundColor: Colors.teal.shade300,
  );
}
