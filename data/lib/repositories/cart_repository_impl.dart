import 'package:data/entity/cart_item_entity/cart_item_entity.dart';
import 'package:data/mappers/cart_item_mapper.dart';
import 'package:data/providers/local/cart_data_provider.dart';
import 'package:domain/domain.dart';

class CartRepositoryImpl implements CartRepository {
  final CartDataProvider _provider;

  CartRepositoryImpl({required CartDataProvider provider})
      : _provider = provider;

  @override
  List<CartItemModel> fetchAllCartItems() {
    final List<CartItemEntity> response = _provider.fetchAllCartItems();
    return response
        .map((CartItemEntity entity) => CartItemMapper.toModel(entity))
        .toList();
  }

  @override
  Future<void> saveCartItem(CartItemModel model) async {
    final CartItemEntity entity = CartItemMapper.toEntity(model);
    return await _provider.saveCartItem(entity);
  }

  @override
  void removeCartItem(int id) {
    return _provider.removeCartItem(id);
  }

  @override
  Future<void> updateCartItem(CartItemModel model) async {
    final CartItemEntity entity = CartItemMapper.toEntity(model);
    return await _provider.updateCartItem(entity);
  }
}
