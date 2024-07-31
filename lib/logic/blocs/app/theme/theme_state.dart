import 'package:equatable/equatable.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class LightThemeState extends ThemeState {
  @override
  List<Object> get props => [];
}

class DarkThemeState extends ThemeState {
  @override
  List<Object> get props => [];
}
