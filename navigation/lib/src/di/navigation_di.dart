import 'package:core/core.dart';
import 'package:navigation/src/app_router/auth_guard.dart';

final NavigationDI navigationDI = NavigationDI();

class NavigationDI {
  Future<void> setupNavigationDependencies() async {
    appLocator.registerLazySingleton<AuthGuard>(
      () => AuthGuard(
        authService: appLocator.get<AuthService>(),
      ),
    );
    appLocator.registerSingleton<AppRouter>(
      AppRouter(
        authGuard: appLocator.get<AuthGuard>(),
      ),
    );
  }
}
