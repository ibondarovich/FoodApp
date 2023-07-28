import 'package:data/entity/dish_entity/dish_entity.dart';
import 'package:domain/domain.dart';

abstract class DishMapper{
  static DishModel toModel(DishEntity entity){
    return DishModel(
      id: entity.id,
      name: entity.name, 
      url: entity.url, 
      price: entity.price, 
      description: entity.description, 
      ingredients: entity.ingredients,
    );
  }

  static DishEntity toEntity(DishModel model){
    return DishEntity(
      id: model.id,
      name: model.name, 
      url: model.url, 
      price: model.price, 
      description: model.description, 
      ingredients: model.ingredients,
    );
  }
}