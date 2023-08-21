import 'package:domain/domain.dart';
import 'package:domain/models/cart_item_model.dart';

abstract class CartRepository {
  List<CartItemModel> fetchAllCartItems();
  Future<void> saveCartItem(CartItemModel model);
  void removeCartItem(int id);
  Future<void> updateCartItem(CartItemModel model);
  Future<void> clearCart();
}
