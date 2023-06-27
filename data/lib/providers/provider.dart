import 'package:data/entity/dish_entity.dart';

abstract class Provider{
  Future<List<DishEntity>> getAllDishes();
}