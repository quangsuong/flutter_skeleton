import '../../../core/di/locator.dart';
import '../../../logic/blocs/item_bloc.dart';

class HomeViewModel {
  final ItemBloc itemBloc = ServiceLocator.instance.get<ItemBloc>();

  void fetchItems() {
    itemBloc.add(FetchItemsEvent());
  }

  void saveLocalItem(dynamic item) {
    itemBloc.add(SaveLocalItemEvent(item));
  }
}
