import 'package:core/core.dart';
import 'package:data/entity/cart_item_entity/cart_item_entity.dart';
import 'package:data/entity/dish_entity/dish_entity.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:data/providers/local/local_provider.dart';
import 'package:data/providers/remote/firebase_provider.dart';
import 'package:data/providers/remote/remote_provider.dart';
import 'package:data/repositories/cart_repository_impl.dart';
import 'package:data/repositories/dish_repository_impl.dart';
import 'package:data/repositories/settings_repository_impl.dart';
import 'package:data/repositories/user_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:hive_flutter/adapters.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initServices();
    _initRemoteDataProvider();
    _initNetworking();
    _initData();
  }

  void _initServices() {
    appLocator.registerLazySingleton<AuthService>(
      () => AuthService(),
    );
  }

  void _initRemoteDataProvider() {
    appLocator.registerLazySingleton<RemoteProvider>(
      () => FirebaseProvider(
        firebaseInstance: FirebaseFirestore.instance,
        firebaseAuthInstance: FirebaseAuth.instance,
        googleSignIn: GoogleSignIn(),
      ),
    );

    appLocator.registerLazySingleton<LocalProvider>(
      () => HiveProvider(
        cartHiveBox: Hive.box<CartItemEntity>(StringConstants.hiveBoxCartName),
        menuHiveBox: Hive.box<DishEntity>(StringConstants.hiveBoxMenuName),
        settingsHiveBox: Hive.box<bool>(StringConstants.hiveBoxSettingsName),
        scaleFactorHiveBox:
            Hive.box<double>(StringConstants.hiveBoxScaleFactorName),
        userHiveBox: Hive.box<String>(StringConstants.hiveBoxUser),
      ),
    );
  }

  void _initNetworking() {
    appLocator.registerLazySingleton<Connectivity>(
      () => Connectivity(),
    );

    appLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfo(
        connectivity: appLocator.get<Connectivity>(),
      ),
    );
  }

  void _initData() {
    appLocator.registerLazySingleton<DishRepository>(
      () => DishRepositoryImpl(
        remoteProvider: appLocator.get<RemoteProvider>(),
        localProvier: appLocator.get<LocalProvider>(),
        networkInfo: NetworkInfo(
          connectivity: appLocator.get<Connectivity>(),
        ),
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

    appLocator.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        localProvider: appLocator.get<LocalProvider>(),
      ),
    );

    appLocator.registerLazySingleton<FetchThemeUseCase>(
      () => FetchThemeUseCase(
        settingsRepository: appLocator.get<SettingsRepository>(),
      ),
    );

    appLocator.registerLazySingleton(
      () => SaveThemeUseCase(
        settingsRepository: appLocator.get<SettingsRepository>(),
      ),
    );

    appLocator.registerLazySingleton(
      () => SaveScaleFactorUseCase(
        settingsRepository: appLocator.get<SettingsRepository>(),
      ),
    );

    appLocator.registerLazySingleton(
      () => FetchScaleFactorUseCase(
        settingsRepository: appLocator.get<SettingsRepository>(),
      ),
    );

    appLocator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        remoteProvider: appLocator.get<RemoteProvider>(),
        localProvider: appLocator.get<LocalProvider>(),
      ),
    );

    appLocator.registerLazySingleton(
      () => CreateUserUseCase(
        userRepository: appLocator.get<UserRepository>(),
      ),
    );

    appLocator.registerLazySingleton(
      () => SignInWithGooleUseCase(
        userRepository: appLocator.get<UserRepository>(),
      ),
    );

    appLocator.registerLazySingleton(
      () => SignOutUseCase(
        userRepository: appLocator.get<UserRepository>(),
      ),
    );

    appLocator.registerLazySingleton(
      () => SignInUseCase(
        userRepository: appLocator.get<UserRepository>(),
      ),
    );

    appLocator.registerLazySingleton(
      () => CheckUserExistenceUseCase(
        userRepository: appLocator.get<UserRepository>(),
      ),
    );

    appLocator.registerLazySingleton(
      () => SaveUserUseCase(
        userRepository: appLocator.get<UserRepository>(),
      ),
    );
  }
}
