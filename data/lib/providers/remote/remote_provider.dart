import 'package:data/entity/dish_entity/dish_entity.dart';

abstract class RemoteProvider{
  Future<List<DishEntity>> getAllDishes();
}