import 'package:data/entity/category_entity/category_entity.dart';
import 'package:domain/models/category_model.dart';

abstract class CategoryMapper {
  static CategoryModel toModel(CategoryEntity entity) {
    return CategoryModel(id: entity.id, name: entity.name);
  }

  static CategoryEntity toEntity(CategoryModel model) {
    return CategoryEntity(id: model.id, name: model.name);
  }
}
