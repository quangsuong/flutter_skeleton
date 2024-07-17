import 'package:flutter_skeleton/logic/blocs/app/lang/language_bloc.dart';

import '../../../core/di/locator.dart';

class SettingViewModel {
  final LanguageBloc languageBloc = ServiceLocator.instance.get<LanguageBloc>();

  void changeLanguage(String locale) {
    languageBloc.add(ChangeLanguage(locale));
  }
}
