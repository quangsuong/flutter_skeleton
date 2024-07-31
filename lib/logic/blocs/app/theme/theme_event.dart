import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
  @override
  List<Object> get props => [];
}

class LoadTheme extends ThemeEvent {}

class EnableDarkMode extends ThemeEvent {}

class DisableDarkMode extends ThemeEvent {}
