import '../../../core/di/locator.dart';
import '../../../logic/blocs/item_bloc.dart';

class SavedItemViewModel {
  final ItemBloc itemBloc = ServiceLocator.instance.get<ItemBloc>();

  void getLocalItemsEvent() {
    itemBloc.add(GetLocalItemsEvent());
  }

  void removeLocalItemEvent(dynamic item) {
    itemBloc.add(RemoveLocalItemEvent(item));
  }
}
