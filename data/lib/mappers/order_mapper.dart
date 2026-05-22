import 'package:domain/domain.dart';
import 'package:domain/models/order_model.dart';

import '../entity/cart_item_entity/cart_item_entity.dart';
import '../entity/order_entity/order_entity.dart';
import 'cart_item_mapper.dart';

abstract class OrderMapper {
  static OrderModel toModel(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      dateTimeOfIssuance: entity.dateTimeOfIssuance,
      price: entity.price,
      orderedItems: entity.orderedItems
          .map(
            (CartItemEntity e) => CartItemMapper.toModel(e),
          )
          .toList(),
    );
  }

  static OrderEntity toEntity(OrderModel model) {
    return OrderEntity(
      id: model.id,
      dateTimeOfIssuance: model.dateTimeOfIssuance,
      price: model.price,
      orderedItems: model.orderedItems
          .map(
            (CartItemModel e) => CartItemMapper.toEntity(e),
          )
          .toList(),
    );
  }
}
