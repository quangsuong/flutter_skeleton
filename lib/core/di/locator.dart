import 'package:get_it/get_it.dart';

import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/item_repository.dart';
import '../../logic/blocs/item_bloc.dart';
import '../../logic/blocs/login/login_bloc.dart';
import '../../ui/views/home/home_view_model.dart';
import '../../ui/views/login/login_view_model.dart';
import '../services/item_service.dart';

class ServiceLocator {
  static ServiceLocator instance = ServiceLocator._();

  final GetIt _getIt = GetIt.asNewInstance();

  ServiceLocator._();

  void initialise() {
    registerSingletonIfNeeded(ItemService());
    registerSingletonIfNeeded(ItemRepository());
    registerSingletonIfNeeded(ItemBloc());
    registerSingletonIfNeeded(HomeViewModel());
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
