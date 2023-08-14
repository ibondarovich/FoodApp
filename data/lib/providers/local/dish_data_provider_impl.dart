import 'package:data/entity/dish_entity/dish_entity.dart';
import 'package:data/providers/local/dish_data_provider.dart';
import 'package:hive/hive.dart';

class DishDataProviderImpl implements DishDataProvider {
  final Box<DishEntity> menuHiveBox;

  DishDataProviderImpl({
    required this.menuHiveBox,
  });

  @override
  Future<void> saveAllDishes(List<DishEntity> input) async {
    input.map(
      (DishEntity item) async => await menuHiveBox.put(item.id, item),
    );
  }

  @override
  List<DishEntity> fetchAllDishes() {
    return menuHiveBox.values.toList();
  }
}
