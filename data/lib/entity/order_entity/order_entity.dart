import 'package:data/entity/cart_item_entity/cart_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';
part 'order_entity.g.dart';

@freezed
class OrderEntity with _$OrderEntity {
  @JsonSerializable(explicitToJson: true)
  factory OrderEntity({
    required int id,
    required DateTime dateTimeOfIssuance,
    required double price,
    required List<CartItemEntity> orderedItems,
  }) = _OrderEntity;

  factory OrderEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderEntityFromJson(json);
}
