import 'package:core/core.dart';
import 'package:data/entity/cart_item_entity/cart_item_entity.dart';
import 'package:data/entity/dish_entity/dish_entity.dart';
import 'package:data/providers/local/cart_data_provider.dart';
import 'package:data/providers/local/cart_data_provider_impl.dart';
import 'package:data/providers/local/dish_data_provider.dart';
import 'package:data/providers/local/dish_data_provider_impl.dart';
import 'package:data/providers/local/theme_data_provider.dart';
import 'package:data/providers/local/theme_data_provider_impl.dart';
import 'package:data/providers/local/user_data_provider.dart';
import 'package:data/providers/local/user_data_provider_impl.dart';
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
    _initDataProviders();
    _initNetworking();
    _initRepositories();
    _initData();
  }

  void _initServices() {
    appLocator.registerLazySingleton<AuthService>(
      () => AuthService(),
    );
  }

  void _initDataProviders() {
    appLocator.registerLazySingleton<RemoteProvider>(
      () => FirebaseProvider(
        firebaseInstance: FirebaseFirestore.instance,
        firebaseAuthInstance: FirebaseAuth.instance,
        googleSignIn: GoogleSignIn(),
      ),
    );

    appLocator.registerLazySingleton<DishDataProvider>(
      () => DishDataProviderImpl(
        menuHiveBox: Hive.box<DishEntity>(StringConstants.hiveBoxMenuName),
      ),
    );

    appLocator.registerLazySingleton<CartDataProvider>(
      () => CartDataProviderImpl(
        cartHiveBox: Hive.box<CartItemEntity>(StringConstants.hiveBoxCartName),
      ),
    );

    appLocator.registerLazySingleton<UserDataProvider>(
      () => UserDataProviderImpl(
        userHiveBox: Hive.box<String>(StringConstants.hiveBoxUserName),
      ),
    );

    appLocator.registerLazySingleton<ThemeDataProvider>(
      () => ThemeDataProviderImpl(
        settingsHiveBox: Hive.box<bool>(StringConstants.hiveBoxSettingsName),
        scaleFactorHiveBox:
            Hive.box<double>(StringConstants.hiveBoxScaleFactorName),
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

  void _initRepositories() {
    appLocator.registerLazySingleton<DishRepository>(
      () => DishRepositoryImpl(
        remoteProvider: appLocator.get<RemoteProvider>(),
        localProvier: appLocator.get<DishDataProvider>(),
        networkInfo: NetworkInfo(
          connectivity: appLocator.get<Connectivity>(),
        ),
      ),
    );

    appLocator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(
        provider: appLocator.get<CartDataProvider>(),
      ),
    );

    appLocator.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        localProvider: appLocator.get<ThemeDataProvider>(),
      ),
    );

    appLocator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        remoteProvider: appLocator.get<RemoteProvider>(),
        localProvider: appLocator.get<UserDataProvider>(),
      ),
    );

  }

  void _initData() {
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
