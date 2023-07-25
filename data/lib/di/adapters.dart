import 'package:core/core.dart';
import 'package:data/entity/cart_item_entity/cart_item_entity.dart';
import 'package:data/entity/dish_entity/dish_entity.dart';

final Adapters adapters = Adapters();

class Adapters{
  void initAdapters(){
    Hive.registerAdapter<CartItemEntity>(CartItemEntityAdapter());
    Hive.registerAdapter<DishEntity>(DishEntityAdapter());
  }
}