import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_skeleton/core/constants/language.dart';
import 'package:flutter_skeleton/core/constants/shared_pref_key.dart';
import 'package:flutter_skeleton/core/di/locator.dart';
import 'package:flutter_skeleton/core/utils/bloc_extensions.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final SharedPreferences sharedPreferences =
      ServiceLocator.instance.get<SharedPreferences>();

  LanguageBloc() : super(const LanguageState('en')) {
    on<ChangeLanguage>(_onChangeLanguage);
    on<LoadLanguage>(_onLoadLanguage);
  }

  void _onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) {
    emitSafely(LanguageState(event.locale));
    _saveLanguage(event.locale);
  }

  void _onLoadLanguage(LoadLanguage event, Emitter<LanguageState> emit) {
    emitSafely(LanguageState(_getLanguage()));
  }

  void _saveLanguage(String locale) async {
    sharedPreferences.setString(SharedPreferenceKey.langCode, locale);
  }

  String _getLanguage() {
    return sharedPreferences.getString(SharedPreferenceKey.langCode) ??
        MyLanguages.en;
  }
}
