import 'package:counter_app/counter/counter_cubit/counter_cubit.dart';
import 'package:counter_app/counter/view/widgets/my_floating_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    var counterCubit = context.read<CounterCubit>();
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
      /*-------- The body using bloc listener and bloc builder ---------*/
      // body: BlocListener<CounterCubit, int>(
      //   listener: (context, state) {
      //     // Show a dialog when the counter reaches a negative value
      //     if (state == -1) {
      //       showDialog(
      //         context: context,
      //         builder: (context) {
      //           return myAlertDialog(context);
      //         },
      //       );
      //     }
      //   },
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         const Text(
      //           'You have pushed the button this many times:',
      //         ),
      //         BlocBuilder<CounterCubit, int>(
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
      floatingActionButton: MyFloatingActionButton(counterCubit: counterCubit),
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

//-- Alert Dialog --//
AlertDialog myAlertDialog(BuildContext context) {
  return AlertDialog(
    title: Text("Alert!"),
    content: Text("Counter reaches a negative value."),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text('Ok'),
      ),
    ],
  );
}
