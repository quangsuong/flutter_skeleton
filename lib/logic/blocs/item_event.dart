part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class FetchItemsEvent extends ItemEvent {}

class GetLocalItemsEvent extends ItemEvent {}
class RemoveLocalItemEvent extends ItemEvent {
  final Item item;
  const RemoveLocalItemEvent(this.item);

  @override
  List<Object> get props => [item];

}
class SaveLocalItemEvent extends ItemEvent {
  final Item item;
  const SaveLocalItemEvent(this.item);

  @override
  List<Object> get props => [item];
}
