import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/di/app_di.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:data/repositories/dish_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/fetch_all_dishes.dart';

final DataDI dataDI= DataDI();

class DataDI{
  Future<void> initDependencies() async{
    _initRemoteDataService();
    _initDishes();
  }

  void _initRemoteDataService(){
    appLocator.registerLazySingleton<FirebaseProvider>(
      () => FirebaseProvider(dishes: FirebaseFirestore.instance.collection('Menu'))
    );
  }
  void _initDishes(){
    appLocator.registerLazySingleton<DishRepository>(
      () => DishRepositoryImpl(
        provider: appLocator.get<FirebaseProvider>()
      )
    );

    appLocator.registerLazySingleton<FetchAllDishesUseCase>(
      () => FetchAllDishesUseCase(
        dishRepository: appLocator.get<DishRepository>()
      )
    );
  }
}