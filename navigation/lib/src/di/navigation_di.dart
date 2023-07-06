import 'package:core/core.dart';
import 'package:navigation/src/app_router/app_router.dart';

final NavigationDI navigationDI = NavigationDI();

class NavigationDI{
  Future<void> setupNavigationDependencies() async {
    appLocator.registerSingleton<AppRouter>(AppRouter());
  }
}