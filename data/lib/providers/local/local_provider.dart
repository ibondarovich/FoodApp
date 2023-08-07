import 'package:data/entity/cart_item_entity/cart_item_entity.dart';
import 'package:data/entity/dish_entity/dish_entity.dart';

abstract class LocalProvider{
  Future<void> saveCartItem(CartItemEntity input);
  Future<void> saveTheme(bool input);
  Future<void> updateCartItem(CartItemEntity input);
  Future<void> saveAllDishes(List<DishEntity> input);
  Future<void> saveScaleFactor(double input);
  List<CartItemEntity> getAllCartItems();
  List<DishEntity> getAllDishes();
  void removeCartItem(int id);
  double getScaleFactor();
  bool getTheme();
}