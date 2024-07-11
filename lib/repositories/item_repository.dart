import '../models/api_response.dart';
import '../models/item_model.dart';
import '../services/item_service.dart';

class ItemRepository {
  final ItemService itemService = ItemService();

  Future<ApiResponse<Item>> fetchItems() {
    return itemService.fetchItems();
  }
}
