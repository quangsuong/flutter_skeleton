// ignore_for_file: depend_on_referenced_packages

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import 'package:flutter_skeleton/core/services/local/DAO/item_dao.dart';
import 'package:flutter_skeleton/data/models/item_model.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Item])
abstract class AppDatabase extends FloorDatabase {
  ItemDao get itemDao;
}
