import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const <PageRouteInfo>[
        MenuViewRoute(),
        ShoppingCartRoute(),
        OrderHistoryRoute(),
        SettingsViewRoute(),
      ],
      bottomNavigationBuilder: (
        BuildContext context,
        TabsRouter tabsRouter,
      ) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Theme.of(context).iconTheme.color,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: AppIcons.restaurantMenu,
              label: StringConstants.navigationBarMenu,
            ),
            BottomNavigationBarItem(
              icon: AppIcons.shoppingBasket,
              label: StringConstants.navigationBarCart,
            ),
            BottomNavigationBarItem(
              icon: AppIcons.orderHistory,
              label: StringConstants.navigationBarOrderHistory,
            ),
            BottomNavigationBarItem(
              icon: AppIcons.settings,
              label: StringConstants.navigationBarSettings,
            ),
          ],
        );
      },
    );
  }
}
