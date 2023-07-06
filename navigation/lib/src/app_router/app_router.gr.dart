// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HomeScreen(),
      );
    },
    DetailedDishRoute.name: (routeData) {
      final args = routeData.argsAs<DetailedDishRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DetailedDishScreen(
          key: args.key,
          dishModel: args.dishModel,
        ),
      );
    },
    MenuViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MenuViewScreen(),
      );
    },
    SettingsViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsViewScreen(),
      );
    },
    ShoppingCartRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ShoppingCartScreen(),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: OrderHistoryScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            RouteConfig(
              MenuViewRoute.name,
              path: 'menu',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              SettingsViewRoute.name,
              path: 'settings',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              ShoppingCartRoute.name,
              path: 'cart',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              OrderHistoryRoute.name,
              path: 'history',
              parent: HomeRoute.name,
            ),
          ],
        ),
        RouteConfig(
          DetailedDishRoute.name,
          path: '/detailed-dish-screen',
        ),
      ];
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [DetailedDishScreen]
class DetailedDishRoute extends PageRouteInfo<DetailedDishRouteArgs> {
  DetailedDishRoute({
    Key? key,
    required DishModel dishModel,
  }) : super(
          DetailedDishRoute.name,
          path: '/detailed-dish-screen',
          args: DetailedDishRouteArgs(
            key: key,
            dishModel: dishModel,
          ),
        );

  static const String name = 'DetailedDishRoute';
}

class DetailedDishRouteArgs {
  const DetailedDishRouteArgs({
    this.key,
    required this.dishModel,
  });

  final Key? key;

  final DishModel dishModel;

  @override
  String toString() {
    return 'DetailedDishRouteArgs{key: $key, dishModel: $dishModel}';
  }
}

/// generated route for
/// [MenuViewScreen]
class MenuViewRoute extends PageRouteInfo<void> {
  const MenuViewRoute()
      : super(
          MenuViewRoute.name,
          path: 'menu',
        );

  static const String name = 'MenuViewRoute';
}

/// generated route for
/// [SettingsViewScreen]
class SettingsViewRoute extends PageRouteInfo<void> {
  const SettingsViewRoute()
      : super(
          SettingsViewRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsViewRoute';
}

/// generated route for
/// [ShoppingCartScreen]
class ShoppingCartRoute extends PageRouteInfo<void> {
  const ShoppingCartRoute()
      : super(
          ShoppingCartRoute.name,
          path: 'cart',
        );

  static const String name = 'ShoppingCartRoute';
}

/// generated route for
/// [OrderHistoryScreen]
class OrderHistoryRoute extends PageRouteInfo<void> {
  const OrderHistoryRoute()
      : super(
          OrderHistoryRoute.name,
          path: 'history',
        );

  static const String name = 'OrderHistoryRoute';
}
