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
    MenuViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MenuViewScreen(),
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
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MenuViewRoute.name,
          path: '/',
        ),
        RouteConfig(
          DetailedDishRoute.name,
          path: '/detailed-dish-screen',
        ),
      ];
}

/// generated route for
/// [MenuViewScreen]
class MenuViewRoute extends PageRouteInfo<void> {
  const MenuViewRoute()
      : super(
          MenuViewRoute.name,
          path: '/',
        );

  static const String name = 'MenuViewRoute';
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
