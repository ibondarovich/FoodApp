import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:menu_view/src/bloc/menu_view/bloc.dart';
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
      body: BlocProvider<MenuViewBloc>(
        create: (BuildContext context) => MenuViewBloc(
          fetchAllDishesUseCase: appLocator.get<FetchAllDishesUseCase>(),
          saveCartItemUseCase: appLocator.get<SaveCartItemUseCase>(),
          networkInfo: appLocator.get<NetworkInfo>(),
        ),
        child: BlocConsumer<MenuViewBloc, MenuState>(
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
                    BlocProvider.of<MenuViewBloc>(context).add(InitEvent());
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: AppDimens.padding15),
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                        children: List.generate(
                          state.dishes.length,
                          (index) => SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: MenuItem(
                              dishModel: state.dishes[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
