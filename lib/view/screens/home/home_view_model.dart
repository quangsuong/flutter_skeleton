import '../../../blocs/item_bloc.dart';
import '../../../di/locator.dart';

class HomeViewModel {
  final ItemBloc itemBloc = ServiceLocator.instance.get<ItemBloc>();

  void fetchItems() {
    itemBloc.add(FetchItemsEvent());
  }
}
