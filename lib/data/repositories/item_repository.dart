import '../../core/services/item_service.dart';
import '../models/api_response.dart';
import '../models/item_model.dart';

class ItemRepository {
  final ItemService itemService = ItemService();

  Future<ApiResponse<Item>> fetchItems() {
    return itemService.fetchItems();
  }
}
