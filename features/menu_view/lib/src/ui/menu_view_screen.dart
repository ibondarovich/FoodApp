import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:menu_view/src/bloc/menu_view/bloc.dart';
import 'components/menu_item.dart';

class MenuViewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar (
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
          getAllDishesUseCase: appLocator.get<FetchAllDishesUseCase>()
        ),
        child: BlocBuilder<MenuViewBloc, MenuViewState>(
          builder: (BuildContext context, MenuViewState state) {
            if(state is ErrorState){
              return Center(
                child: Text(state.errorMessage),
              );
            }
            if(state is LoadingState){
              return const AppLoaderWidget();
            }
            if(state is LoadedState){
              return  Container(
                height: MediaQuery.sizeOf(context).height,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: AppDimens.padding15),
                  scrollDirection: Axis.vertical,
                  child: Wrap(
                    children: List.generate(
                      state.dishes.length,
                      (index) => SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: MenuItem(dishModel: state.dishes[index]), 
                      ),
                    ),
                  ),
                )
              );
            }
            return Container();
          },
        )
      )
    );
  }
}