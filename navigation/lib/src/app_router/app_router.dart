import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:detailed_dish_view/detailed_dish_view.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:menu_view/menu_view.dart';
import 'package:order_history_view/order_history_view.dart';
import 'package:settings_view/settings_view.dart';
import 'package:shopping_cart_view/shopping_cart_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomeScreen,
      children: <AutoRoute>[
        AutoRoute(
          name: 'EmptyRoute',
          path: 'empty_route',
          page: EmptyRouterPage,
          children: <AutoRoute>[
            AutoRoute(
              initial: true,
              path: 'menu',
              page: MenuViewScreen,
            ),
            AutoRoute(
              page: DetailedDishScreen,
              path: 'detailed_dish'
            ),
            RedirectRoute(
              path: 'detailed_dish', 
              redirectTo: 'menu'
            ),
          ]
        ),
        AutoRoute(
          path: 'settings',
          page: SettingsViewScreen,
        ),
        AutoRoute(
          path: 'cart',
          page: ShoppingCartScreen,
          maintainState: false,
        ),
        AutoRoute(
          path: 'history',
          page: OrderHistoryScreen,
        ),
      ]
    ),
  ],
)

class AppRouter extends _$AppRouter {}