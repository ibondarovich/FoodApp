import 'package:authentication/authentication.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:detailed_dish/detailed_dish.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:main/main.dart';
import 'package:menu/menu.dart';
import 'package:navigation/src/app_router/auth_guard.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: MainScreen,
      initial: true,
      children: <AutoRoute>[
        AutoRoute(
          page: AuthScreen,
          name: 'AuthRoute',
          path: 'auth_route',
        ),
        AutoRoute(
          path: 'home',
          guards: [AuthGuard],
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
              page: SettingsScreen,
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
    ),
  ],
)

class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}