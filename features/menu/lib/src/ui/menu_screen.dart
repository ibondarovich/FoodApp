import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:menu/menu.dart';
import 'components/category_item.dart';
import 'components/menu_item.dart';

class MenuViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          StringConstants.appBarTitle,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: AppDimens.elevetion0,
        centerTitle: true,
      ),
      body: BlocProvider<MenuBloc>(
        create: (BuildContext context) => MenuBloc(
          fetchAllDishesUseCase: appLocator.get<FetchAllDishesUseCase>(),
          saveCartItemUseCase: appLocator.get<SaveCartItemUseCase>(),
          networkInfo: appLocator.get<NetworkInfo>(),
          fetchCategoriesUseCase: appLocator.get<FetchCategoriesUseCase>(),
        ),
        child: BlocConsumer<MenuBloc, MenuState>(
          listener: (context, state) {
            if (state.isShowSnakbar == true) {
              showAppSnackBar(
                context: context,
                title: StringConstants.internetConnectionError,
              );
            }
          },
          builder: (BuildContext context, MenuState state) {
            if (state.isLoading) {
              return const AppLoaderWidget();
            } else {
              if (state.dishes.isNotEmpty) {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<MenuBloc>(context).add(InitEvent());
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height / 15,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(
                                AppDimens.padding10,
                              ),
                              child: CategoryItem(
                                onTap: () {
                                  BlocProvider.of<MenuBloc>(context).add(
                                    OnSetSelectedCategoryIndex(index: index),
                                  );
                                },
                                isSelected:
                                    state.selectedCategoryIndex == index,
                                color: Theme.of(context).cardColor,
                                selectedColor: AppColors.primaryColor,
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                title: state.categories[index].name,
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding:
                              const EdgeInsets.only(top: AppDimens.padding15),
                          scrollDirection: Axis.vertical,
                          child: Wrap(
                            children: List.generate(
                              state.dishesOfSelectedCategory.isEmpty
                                  ? state.dishes.length
                                  : state.dishesOfSelectedCategory.length,
                              (index) => SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: MenuItem(
                                  dishModel: state
                                          .dishesOfSelectedCategory.isEmpty
                                      ? state.dishes[index]
                                      : state.dishesOfSelectedCategory[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
