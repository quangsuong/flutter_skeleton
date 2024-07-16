import 'package:flutter_skeleton/logic/blocs/app/app_bloc.dart';

import '../../../core/di/locator.dart';

class SettingViewModel {
  final AppBloc appBloc = ServiceLocator.instance.get<AppBloc>();

  void changeLanguage(LanguageType language) {
    appBloc.add(ChangeLanguageEvent(language));
  }
}
