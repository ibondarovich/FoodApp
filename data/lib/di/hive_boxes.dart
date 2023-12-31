import 'package:core/core.dart';
import 'package:data/entity/cart_item_entity/cart_item_entity.dart';
import 'package:data/entity/dish_entity/dish_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

HiveBoxes hiveBoxes = HiveBoxes();

class HiveBoxes{
  Future<void> openBoxes() async {
    await Hive.openBox<CartItemEntity>(StringConstants.hiveBoxCartName);
    await Hive.openBox<DishEntity>(StringConstants.hiveBoxMenuName);
    await Hive.openBox<bool>(StringConstants.hiveBoxSettingsName);
    await Hive.openBox<double>(StringConstants.hiveBoxScaleFactorName);
    await Hive.openBox<String>(StringConstants.hiveBoxUserName);
  }
}