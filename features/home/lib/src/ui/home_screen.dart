import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/bloc/bloc.dart';
import '../bloc/bloc/bloc_observer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const <PageRouteInfo>[
        EmptyRoute(),
        ShoppingCartRoute(),
        OrderHistoryRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (
        BuildContext context,
        TabsRouter tabsRouter,
      ) {
        return BlocProvider(
          create: (context) => HomeBloc(
            fetchAllCartItemsUseCase:
                appLocator.get<FetchAllCartItemsUseCase>(),
          ),
          child: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Theme.of(context).iconTheme.color,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: AppIcons.restaurantMenu,
                label: StringConstants.navigationBarMenu,
              ),
              BottomNavigationBarItem(
                icon: BlocBuilder<HomeBloc, OnChangeCartQuntityState>(
                  builder: (context, state) {
                  Bloc.observer = HomeBlocObserver(context: context);
                    return
                      Badge(
                        label: Text('${state.quantity}'),
                        child: AppIcons.shoppingBasket,
                      );
                  }), 
                label: StringConstants.navigationBarCart,
              ),
              const BottomNavigationBarItem(
                icon: AppIcons.orderHistory,
                label: StringConstants.navigationBarOrderHistory,
              ),
              const BottomNavigationBarItem(
                icon: AppIcons.settings,
                label: StringConstants.navigationBarSettings,
              ),
            ],
          ),
        );
      },
    );
  }
}
