import 'package:domain/models/dish_model.dart';

abstract class DishRepository{
  Future<List<DishModel>> fetchAllDishes();
}