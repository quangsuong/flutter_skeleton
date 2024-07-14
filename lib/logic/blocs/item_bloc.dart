import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/core/utils/bloc_extensions.dart';

import '../../core/di/locator.dart';
import '../../data/models/api_response.dart';
import '../../data/models/item_model.dart';
import '../../data/repositories/item_repository.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemRepository =
      ServiceLocator.instance.get<ItemRepository>();

  ItemBloc() : super(ItemLoading()) {
    on<FetchItemsEvent>(_fetchItems);
  }

  void _fetchItems(FetchItemsEvent event, Emitter<ItemState> emit) async {
    emitSafely(ItemLoading());
    try {
      final items = await itemRepository.fetchItems();
      emitSafely(ItemLoaded(items: items));
    } catch (e) {
      emitSafely(ItemError(error: e.toString()));
    }
  }
}
