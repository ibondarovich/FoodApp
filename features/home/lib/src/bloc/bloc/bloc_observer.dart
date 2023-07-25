import 'package:core/core.dart';
import 'package:detailed_dish_view/detailed_dish_view.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/bloc/bloc.dart';
import 'package:menu_view/menu_view.dart';
import 'package:shopping_cart_view/shopping_cart_view.dart';

class HomeBlocObserver extends BlocObserver {
  BuildContext context;

  HomeBlocObserver({
    required this.context,
  });

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (bloc is MenuViewBloc ||
        bloc is ShoppingCartViewBloc ||
        bloc is DetailedDishViewBloc) {
      BlocProvider.of<HomeViewBloc>(context).add(OnChangeCartQuntityEvent());
    }
  }
}
