import 'package:data/entity/dish_entity.dart';
import 'package:domain/domain.dart';

abstract class DishMapper{
  static DishModel toModel(DishEntity entity){
    return DishModel(
      name: entity.name, 
      url: entity.url, 
      price: entity.price, 
      description: entity.description, 
      ingredients: entity.ingredients
    );
  }
}