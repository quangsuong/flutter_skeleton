import 'package:floor/floor.dart';

import 'package:flutter_skeleton/data/models/item_model.dart';

@dao
abstract class ItemDao {
  
  @Insert()
  Future<void> insertItem(Item item);
  
  @delete
  Future<void> deleteItem(Item item);
  
  @Query('SELECT * FROM item')
  Future<List<Item>> getItems();
}