import 'package:get_it/get_it.dart';

import '../blocs/item_bloc.dart';
import '../repositories/item_repository.dart';
import '../services/item_service.dart';
import '../view/screens/home/home_view_model.dart';

class ServiceLocator {
  static ServiceLocator instance = ServiceLocator._();

  final GetIt _getIt = GetIt.asNewInstance();

  ServiceLocator._();

  void initialise() {
    registerSingletonIfNeeded(ItemService());
    registerSingletonIfNeeded(ItemRepository());
    registerSingletonIfNeeded(ItemBloc());
    registerSingletonIfNeeded(HomeViewModel());
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
