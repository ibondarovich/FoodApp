import 'package:data/entity/cart_item_entity/cart_item_entity.dart';
import 'package:data/mappers/dish_mapper.dart';
import 'package:domain/domain.dart';

abstract class CartItemMapper {
  static CartItemEntity toEntity(CartItemModel model) {
    return CartItemEntity(
      dishEntity: DishMapper.toEntity(model.dishModel),
      quantity: model.quantity,
    );
  }

  static CartItemModel toModel(CartItemEntity entity) {
    return CartItemModel(
      dishModel: DishMapper.toModel(entity.dishEntity),
      quantity: entity.quantity,
    );
  }
}
