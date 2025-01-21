import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool isDarkMode = false;

  ThemeBloc() : super(ThemeInitialState(ThemeMode.light)) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeChangedEvent) {
        isDarkMode = !isDarkMode;
        ThemeMode themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
        emit(ThemeChangedState(themeMode));
      }
    });
  }
}
