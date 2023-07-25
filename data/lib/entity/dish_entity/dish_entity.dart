import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_entity.freezed.dart';
part 'dish_entity.g.dart';

@freezed
class DishEntity with _$DishEntity{
  @HiveType(typeId: 1, adapterName: 'DishEntityAdapter')
  factory DishEntity({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String url,
    @HiveField(3) required num price,
    @HiveField(4) required String description,
    @HiveField(5) required List<String> ingredients,
  }) = _DishEntity;

  factory DishEntity.fromJson(Map<String, dynamic> json) =>
      _$DishEntityFromJson(json);
}