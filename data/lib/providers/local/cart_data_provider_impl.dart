import 'package:data/entity/cart_item_entity/cart_item_entity.dart';
import 'package:data/providers/local/cart_data_provider.dart';
import 'package:hive/hive.dart';

class CartDataProviderImpl implements CartDataProvider{
  final Box<CartItemEntity> cartHiveBox;

  CartDataProviderImpl({
    required this.cartHiveBox,
  });
  
  @override
  List<CartItemEntity> fetchAllCartItems() {
    return cartHiveBox.values.toList();
  }

  @override
  void removeCartItem(int id) {
    cartHiveBox.delete(id);
  }

  @override
  Future<void> saveCartItem(CartItemEntity input) async {
    final CartItemEntity? dishEntity = cartHiveBox.get(input.dishEntity.id);
    if (dishEntity != null) {
      return await cartHiveBox.put(
        input.dishEntity.id,
        dishEntity.copyWith(quantity: dishEntity.quantity + 1),
      );
    }
    return await cartHiveBox.put(input.dishEntity.id, input);
  }

  @override
  Future<void> updateCartItem(CartItemEntity input) async {
    return await cartHiveBox.put(input.dishEntity.id, input);
  }
}