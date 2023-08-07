import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/entity/cart_item_entity/cart_item_entity.dart';
import 'package:data/entity/dish_entity/dish_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'local_provider.dart';

class HiveProvider implements LocalProvider {
  final Box<CartItemEntity> cartHiveBox;
  final Box<DishEntity> menuHiveBox;
  final Box<bool> settingsHiveBox;
  final Box<double> scaleFactorHiveBox;
  final Box<String> userHiveBox;

  HiveProvider({
    required this.menuHiveBox,
    required this.cartHiveBox,
    required this.settingsHiveBox,
    required this.scaleFactorHiveBox,
    required this.userHiveBox,
  });

  @override
  List<CartItemEntity> getAllCartItems() {
    return cartHiveBox.values.toList();
  }

  @override
  void removeCartItem(int id) {
    cartHiveBox.delete(id);
  }

  @override
  Future<void> saveCartItem(CartItemEntity input) async {
    final CartItemEntity? dishEntity = cartHiveBox.get(input.dishEntity.id);
    if (dishEntity != null) {
      return await cartHiveBox.put(
        input.dishEntity.id,
        dishEntity.copyWith(quantity: dishEntity.quantity + 1),
      );
    }
    return await cartHiveBox.put(input.dishEntity.id, input);
  }

  @override
  Future<void> updateCartItem(CartItemEntity input) async {
    return await cartHiveBox.put(input.dishEntity.id, input);
  }

  @override
  Future<void> saveAllDishes(List<DishEntity> input) async {
    await Future.wait(
        input.map((item) async => await menuHiveBox.put(item.id, item)));
  }
  
  @override
  List<DishEntity> getAllDishes() {
    return menuHiveBox.values.toList();
  }
  
  @override
  Future<void> saveTheme(bool input) async {
    await settingsHiveBox.put(StringConstants.hiveBoxThemeName, input);
  }

  @override
  bool getTheme() {
    return settingsHiveBox.get(StringConstants.hiveBoxThemeName) ?? false;
  }
  
  @override
  double getScaleFactor() {
    return scaleFactorHiveBox.get(StringConstants.hiveBoxScaleFactorName) ??
        AppDimens.textScales.first;
  }
  
  @override
  Future<void> saveScaleFactor(double input) async {
    await scaleFactorHiveBox.put(StringConstants.hiveBoxScaleFactorName, input);
  }
  
  @override
  bool checkUser() {
    return userHiveBox.isNotEmpty;
  }
  
  @override
  Future<void> saveUser(String input) async {
    await userHiveBox.put('uid', input);
  }
  
  @override
  Future<void> removeUser() async {
    await userHiveBox.clear();
  }
}
