import 'package:core/core.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:data/providers/provider.dart';
import 'package:data/repositories/dish_repository_impl.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initRemoteDataService();
    _initDishes();
  }

  void _initRemoteDataService() {
    appLocator.registerLazySingleton<Provider>(
      () => FirebaseProvider(
        dishes: FirebaseFirestore.instance.collection(
          StringConstants.firebaseTableName,
        ),
      ),
    );
  }

  void _initDishes() {
    appLocator.registerLazySingleton<DishRepository>(
      () => DishRepositoryImpl(
        provider: appLocator.get<Provider>(),
      ),
    );

    appLocator.registerLazySingleton<FetchAllDishesUseCase>(
      () => FetchAllDishesUseCase(
        dishRepository: appLocator.get<DishRepository>(),
      ),
    );
  }
}
