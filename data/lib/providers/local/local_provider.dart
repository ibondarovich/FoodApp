import 'package:data/entity/cart_item_entity/cart_item_entity.dart';

abstract class LocalProvider{
  List<CartItemEntity> getAllCartItems();
  Future<void> saveCartItem(CartItemEntity input);
  void removeCartItem(int id);
  Future<void> updateCartItem(CartItemEntity input);
}