import 'package:data/entity/order_entity/order_entity.dart';
import 'package:data/mappers/cart_item_mapper.dart';
import 'package:domain/models/order_model.dart';

abstract class OrderMapper {
  static OrderModel toModel(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      dateTimeOfIssuance: entity.dateTimeOfIssuance,
      price: entity.price,
      orderedItems: entity.orderedItems
          .map(
            (e) => CartItemMapper.toModel(e),
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
            (e) => CartItemMapper.toEntity(e),
          )
          .toList(),
    );
  }
}
