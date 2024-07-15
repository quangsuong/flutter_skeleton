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
    on<GetLocalItemsEvent>(_getLocalItems);
    on<RemoveLocalItemEvent>(_removeLocalItem);
    on<SaveLocalItemEvent>(_saveLocalItem);
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

  void _getLocalItems(GetLocalItemsEvent event, Emitter<ItemState> emit) async {
    emitSafely(ItemLoading());
    try {
      final items = await itemRepository.getLocalSavedItems();
      emitSafely(ItemLocalLoaded(items: items));
    } catch (e) {
      emitSafely(ItemError(error: e.toString()));
    }
  }

  void _removeLocalItem(
      RemoveLocalItemEvent event, Emitter<ItemState> emit) async {
    emitSafely(ItemLoading());
    try {
      await itemRepository.removeLocalItem(event.item);
      final items = await itemRepository.getLocalSavedItems();
      emitSafely(ItemLocalLoaded(items: items));
    } catch (e) {
      emitSafely(ItemError(error: e.toString()));
    }
  }

  void _saveLocalItem(
      SaveLocalItemEvent event, Emitter<ItemState> emit) async {
    try {
      await itemRepository.saveLocalItem(event.item);
    } catch (e) {
      emitSafely(ItemError(error: e.toString()));
    }
  }
}
