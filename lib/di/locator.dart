import 'package:get_it/get_it.dart';

import '../repositories/item_repository.dart';
import '../services/item_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ItemService>(() => ItemService());
  locator.registerLazySingleton<ItemRepository>(() => ItemRepository());
}
