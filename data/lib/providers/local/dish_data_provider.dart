import '../../entity/dish_entity/dish_entity.dart';

abstract class DishDataProvider {
  Future<void> saveAllDishes(List<DishEntity> input);
  List<DishEntity> fetchAllDishes();
}