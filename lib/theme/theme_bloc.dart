import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  bool isDarkMode = false;
  String theme = 'light';

  ThemeBloc() : super(const ThemeInitial(ThemeMode.light)) {
    on<InitEvent>(_init);
    // when app starts get theme_bloc from shared prefs
    on<ToggleThemeEvent>(_toggleTheme);
  }

  // Static method to return theme bloc object (to apply singleton pattern)
  static ThemeBloc get(context) => BlocProvider.of(context);


  void _init(InitEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeInitial(isDarkMode ? ThemeMode.dark : ThemeMode.light));
  }

  void _toggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit) async {
    isDarkMode = !isDarkMode;
    ThemeMode themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    emit(ThemeChanged(themeMode));
  }
}
