import 'package:counter_app/counter/counter_bloc/counter_bloc.dart';
import 'package:counter_app/counter/view/widgets/my_floating_action.dart';
import 'package:counter_app/counter/view/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/theme_bloc.dart';

//------------ The same Counter view but using bloc builder and listener -------------//
class CounterView2 extends StatelessWidget {
  const CounterView2({super.key});

  @override
  Widget build(BuildContext context) {
    var counterBloc = CounterBloc.get(context);
    var themeBloc = ThemeBloc.get(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
        title: Text(
          'Counter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          //-- Change theme icon button --//
          IconButton(
            onPressed: () {
              //-- call change theme event //
              themeBloc.add(ToggleThemeEvent());
            },
            icon: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Icon(state.themeMode == ThemeMode.light
                    ? Icons.brightness_2_outlined
                    : Icons.brightness_5_rounded);
              },
            ),
          ),
        ],
      ),
      /*-------- The body using bloc listener and bloc builder ---------*/
      body: BlocListener<CounterBloc, int>(
        listener: (context, state) {
          // Show a snack bar when the counter reaches a negative value for example:
          if (state == -1) {
            ScaffoldMessenger.of(context).showSnackBar(
                mySnackBar(message: 'Counter reaches a negative value.'));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterBloc, int>(
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(
        counterBloc: counterBloc,
      ),
    );
  }
}

/////////////////////////////////////////////
