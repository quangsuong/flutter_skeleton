import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/api_response.dart';
import '../models/item_model.dart';
import '../repositories/item_repository.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemRepository;

  ItemBloc({required this.itemRepository}) : super(ItemLoading()) {
    on<FetchItemsEvent>((event, emit) async {
      emit(ItemLoading());
      try {
        final items = await itemRepository.fetchItems();
        emit(ItemLoaded(items: items));
      } catch (e) {
        emit(ItemError(error: e.toString()));
      }
    });
  }
}
