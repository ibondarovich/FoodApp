import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecases/fetch_all_dishes.dart';
import 'package:flutter/material.dart';
import 'package:menu_view/src/bloc/menu_view/bloc.dart';

class MenuViewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text(
          'Food app',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocProvider<MenuViewBloc>(
        create: (BuildContext context) => MenuViewBloc(
          getAllDishesUseCase: appLocator.get<FetchAllDishesUseCase>()
        )
        ..add(InitEvent()),
        child: BlocBuilder<MenuViewBloc, MenuViewState>(
          builder: (BuildContext context, MenuViewState state) {
            if(state is ErrorState){
              return Center(
                child: Text(state.errorMessage),
              );
            }
            if(state is LoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is LoadedState){
              return  Container(
                color: const Color(0xfffafafa),
                height: MediaQuery.sizeOf(context).height,
                child: SingleChildScrollView(
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