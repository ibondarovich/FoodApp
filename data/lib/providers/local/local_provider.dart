import 'package:data/entity/cart_item_entity/cart_item_entity.dart';
import 'package:data/entity/dish_entity/dish_entity.dart';

abstract class LocalProvider{
  List<CartItemEntity> getAllCartItems();
  Future<void> saveCartItem(CartItemEntity input);
  void removeCartItem(int id);
  Future<void> updateCartItem(CartItemEntity input);
  Future<void> saveAllDishes(List<DishEntity> input);
  List<DishEntity> getAllDishes();
  Future<void> saveTheme(bool input);
  bool getTheme();
}