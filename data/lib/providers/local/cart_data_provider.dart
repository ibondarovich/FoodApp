import '../../entity/cart_item_entity/cart_item_entity.dart';

abstract class CartDataProvider{
  Future<void> saveCartItem(CartItemEntity input);
  Future<void> updateCartItem(CartItemEntity input);
  void removeCartItem(int id);
  List<CartItemEntity> fetchAllCartItems();
}