import 'package:data/entity/dish_entity/dish_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart_item_entity.freezed.dart';
part 'cart_item_entity.g.dart';

@freezed
class CartItemEntity with _$CartItemEntity {
  @JsonSerializable(explicitToJson: true)
  @HiveType(typeId: 0, adapterName: 'CartItemEntityAdapter')
  factory CartItemEntity({
    @HiveField(0) required DishEntity dishEntity,
    @HiveField(1) required int quantity,
  }) = _CartItemEntity;

  factory CartItemEntity.fromJson(Map<String, dynamic> json) =>
      _$CartItemEntityFromJson(json);
}
