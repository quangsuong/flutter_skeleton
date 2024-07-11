import '../../../blocs/item_bloc.dart';
import '../../../repositories/item_repository.dart';

class HomeViewModel {
  final ItemBloc itemBloc = ItemBloc(itemRepository: ItemRepository());
  HomeViewModel() {
    fetchItems();
  }

  void fetchItems() {
    itemBloc.add(FetchItemsEvent());
  }
}
