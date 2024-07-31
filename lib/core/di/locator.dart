import 'package:flutter_skeleton/logic/blocs/app/theme/theme_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/item_repository.dart';
import '../../logic/blocs/app/lang/language_bloc.dart';
import '../../logic/blocs/dialog/dialog_bloc.dart';
import '../../logic/blocs/item_bloc.dart';
import '../../logic/blocs/login/login_bloc.dart';
import '../../ui/views/home/home_view_model.dart';
import '../../ui/views/login/login_view_model.dart';
import '../../ui/views/saved_item/saved_item_view_model.dart';
import '../../ui/views/settings/settings_view_model.dart';
import '../services/item_service.dart';
import '../services/local/app_database.dart';

class ServiceLocator {
  static ServiceLocator instance = ServiceLocator._();

  final GetIt _getIt = GetIt.asNewInstance();

  ServiceLocator._();

  Future<void> initialize() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    final sharedPreferences = await SharedPreferences.getInstance();

    registerSingletonIfNeeded<AppDatabase>(database);
    registerSingletonIfNeeded<SharedPreferences>(sharedPreferences);

    registerSingletonIfNeeded(DialogBloc());
    registerSingletonIfNeeded(LanguageBloc());
    registerSingletonIfNeeded(ThemeBloc());
    registerSingletonIfNeeded(ItemService());
    registerSingletonIfNeeded(ItemRepository());
    registerSingletonIfNeeded(ItemBloc());
    registerSingletonIfNeeded(HomeViewModel());
    registerSingletonIfNeeded(SettingViewModel());
    registerSingletonIfNeeded(SavedItemViewModel());
    registerSingletonIfNeeded(AuthRepository());
    registerSingletonIfNeeded(LoginBloc());
    registerSingletonIfNeeded(LoginViewModel());
  }

  void registerSingletonIfNeeded<T extends Object>(T instance) {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerSingleton<T>(instance);
    }
  }

  void reset() => _getIt.reset();

  T get<T extends Object>() {
    return _getIt.get<T>();
  }
}
