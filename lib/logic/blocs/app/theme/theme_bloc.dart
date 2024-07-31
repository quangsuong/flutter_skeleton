import 'package:bloc/bloc.dart';
import 'package:flutter_skeleton/core/utils/bloc_extensions.dart';
import 'package:flutter_skeleton/logic/blocs/app/theme/theme_event.dart';
import 'package:flutter_skeleton/logic/blocs/app/theme/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/shared_pref_key.dart';
import '../../../../core/di/locator.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences sharedPreferences =
      ServiceLocator.instance.get<SharedPreferences>();

  ThemeBloc() : super(LightThemeState()) {
    on<LoadTheme>(_loadTheme);
    on<EnableDarkMode>(_onEnableDarkMode);
    on<DisableDarkMode>(_onDisableDarkMode);
  }

  void _onEnableDarkMode(ThemeEvent event, Emitter<ThemeState> emit) {
    emitSafely(DarkThemeState());
    _saveTheme(true);
  }

  void _onDisableDarkMode(ThemeEvent event, Emitter<ThemeState> emit) {
    emitSafely(LightThemeState());
    _saveTheme(false);
  }

  void _loadTheme(ThemeEvent event, Emitter<ThemeState> emit) {
    final isDarkMode =
        sharedPreferences.getBool(SharedPreferenceKey.isDarkModeKey) ?? false;
    emitSafely(isDarkMode ? DarkThemeState() : LightThemeState());
  }

  void _saveTheme(bool isDarkMode) async {
    await sharedPreferences.setBool(
        SharedPreferenceKey.isDarkModeKey, isDarkMode);
  }
}
