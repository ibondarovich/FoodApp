import 'package:auto_route/auto_route.dart';
import 'package:detailed_dish_view/detailed_dish_view.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:menu_view/menu_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: MenuViewScreen,
      initial: true
    ),
    AutoRoute(
      page: DetailedDishScreen,
    )
  ],
)

class AppRouter extends _$AppRouter {}