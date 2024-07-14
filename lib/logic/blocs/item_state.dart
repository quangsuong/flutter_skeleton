part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final ApiResponse<Item> items;

  const ItemLoaded({required this.items});

  @override
  List<Object> get props => [items];
}

class ItemError extends ItemState {
  final String error;

  const ItemError({required this.error});

  @override
  List<Object> get props => [error];
}
