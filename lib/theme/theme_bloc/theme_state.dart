part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {
  const ThemeState(this.themeMode);
  final  ThemeMode themeMode;

}

final class ThemeInitialState extends ThemeState {
  const ThemeInitialState(super.themeMode);
}
final class ThemeChangedState extends ThemeState {
  const ThemeChangedState(super.themeMode);
}
