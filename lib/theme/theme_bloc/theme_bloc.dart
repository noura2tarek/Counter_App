import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool isDarkMode = false;

  // Create one instance of the bloc
  static ThemeBloc get(context) => ThemeBloc();

  ThemeBloc() : super(ThemeInitialState(ThemeMode.light)) {
    on<ThemeChangedEvent>(_changeTheme);
  }

  // Handle change theme event to toggle theme between light and dark
  Future<void> _changeTheme(ThemeChangedEvent event, emit) async {
    isDarkMode = !isDarkMode;
    ThemeMode themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    emit(ThemeChangedState(themeMode));
  }
}
