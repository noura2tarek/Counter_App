import 'package:counter_app/counter/view/counter_screen.dart';
import 'package:counter_app/observers/counter_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // bloc observer instance
  Bloc.observer = CounterObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.purple.shade200,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: const CounterScreen(),
    );
  }
}
