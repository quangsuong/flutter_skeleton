import '../../data/models/api_response.dart';
import '../../data/models/item_model.dart';
import 'network/base_service.dart';

class ItemService extends BaseService {
  Future<ApiResponse<Item>> fetchItems() async {
    try {
      return await get('/users', (json) => Item.fromJson(json));
    } catch (e) {
      throw Exception('Failed to load items: $e');
    }
  }
}
