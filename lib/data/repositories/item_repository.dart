import '../../core/di/locator.dart';
import '../../core/services/item_service.dart';
import '../../core/services/local/app_database.dart';
import '../models/api_response.dart';
import '../models/item_model.dart';

class ItemRepository {
  final ItemService itemService = ItemService();
  final AppDatabase _appDatabase = ServiceLocator.instance.get<AppDatabase>();

  Future<ApiResponse<Item>> fetchItems() {
    return itemService.fetchItems();
  }

  Future<List<Item>> getLocalSavedItems() async {
    return _appDatabase.itemDao.getItems();
  }

  Future<void> removeLocalItem(Item item) {
    return _appDatabase.itemDao.deleteItem(item);
  }

  Future<void> saveLocalItem(Item item) {
    return _appDatabase.itemDao.insertItem(item);
  }
}
