import 'package:core/core.dart';
import 'package:data/entity/cart_item_entity/cart_item_entity.dart';
import 'local_provider.dart';

class HiveProvider implements LocalProvider {
  final Box<CartItemEntity> hiveBox;

  HiveProvider({
    required this.hiveBox,
  });

  @override
  List<CartItemEntity> getAllCartItems() {
    return hiveBox.values.toList();
  }

  @override
  void removeCartItem(int id) {
    hiveBox.delete(id);
  }

  @override
  Future<void> saveCartItem(CartItemEntity input) async {
    final CartItemEntity? dishEntity = hiveBox.get(input.dishEntity.id);
    if (dishEntity != null) {
      return await hiveBox.put(
        input.dishEntity.id,
        dishEntity.copyWith(quantity: dishEntity.quantity + 1),
      );
    }
    return await hiveBox.put(input.dishEntity.id, input);
  }

  @override
  Future<void> updateCartItem(CartItemEntity input) async {
    return await hiveBox.put(input.dishEntity.id, input);
  }
}
