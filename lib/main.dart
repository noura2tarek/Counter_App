import 'package:counter_app/counter/view/counter_screen.dart';
import 'package:counter_app/observers/my_bloc_observer.dart';
import 'package:counter_app/theme/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // Bloc observer instance
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Counter App',
            themeMode: state.themeMode,
            theme: state.themeMode == ThemeMode.light
                ? ThemeData.light().copyWith(
                    primaryColor: Colors.purple.shade200,
                    colorScheme: const ColorScheme.light().copyWith(
                      primary: Colors.purple.shade200,
                    ),
                    scaffoldBackgroundColor:
                        Colors.white.withValues(alpha: 0.9),
                    appBarTheme: const AppBarTheme().copyWith(
                      backgroundColor: Colors.white,
                      elevation: 1.0,
                      foregroundColor: Colors.purple.shade200,
                      systemOverlayStyle: SystemUiOverlayStyle.dark,
                    ),
                    floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.purple.shade200,
                      foregroundColor: Colors.white,
                      elevation: 2.0,
                    ),
                  )
                : ThemeData.dark().copyWith(
                    primaryColor: Colors.purple.shade400,
                    colorScheme: const ColorScheme.dark().copyWith(
                      primary: Colors.purple.shade400,
                    ),
                    scaffoldBackgroundColor: Color(0xff121212),
                    appBarTheme: const AppBarTheme().copyWith(
                      backgroundColor: Colors.purple.shade400,
                      foregroundColor: Colors.white,
                      elevation: 1.0,
                      systemOverlayStyle: SystemUiOverlayStyle.light,
                    ),
                    floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.purple.shade400,
                      foregroundColor: Colors.white,
                      elevation: 2.0,
                    ),
                  ),
            home: const CounterScreen(),
          );
        },
      ),
    );
  }
}
