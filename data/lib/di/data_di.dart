import 'package:core/core.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:data/providers/local/local_provider.dart';
import 'package:data/providers/remote/firebase_provider.dart';
import 'package:data/providers/remote/remote_provider.dart';
import 'package:data/repositories/cart_repository_impl.dart';
import 'package:data/repositories/dish_repository_impl.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initRemoteDataService();
    _initDishes();
  }

  void _initRemoteDataService() {
    appLocator.registerLazySingleton<RemoteProvider>(
      () => FirebaseProvider(
        firebaseInstance: FirebaseFirestore.instance,
      ),
    );

    appLocator.registerLazySingleton<LocalProvider>(
      () => HiveProvider(
        hiveBox: Hive.box(StringConstants.hiveBoxCartName),
      ),
    );
  }

  void _initDishes() {
    appLocator.registerLazySingleton<DishRepository>(
      () => DishRepositoryImpl(
        provider: appLocator.get<RemoteProvider>(),
      ),
    );

    appLocator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(
        provider: appLocator.get<LocalProvider>(),
      ),
    );

    appLocator.registerLazySingleton<FetchAllDishesUseCase>(
      () => FetchAllDishesUseCase(
        dishRepository: appLocator.get<DishRepository>(),
      ),
    );

    appLocator.registerLazySingleton<FetchAllCartItemsUseCase>(
      () => FetchAllCartItemsUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<SaveCartItemUseCase>(
      () => SaveCartItemUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<RemoveCartItemUseCase>(
      () => RemoveCartItemUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<UpdateCartItemQuantity>(
      () => UpdateCartItemQuantity(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );
  }
}
