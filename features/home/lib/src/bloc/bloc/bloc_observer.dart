import 'package:core/core.dart';
import 'package:detailed_dish/detailed_dish.dart';
import 'package:flutter/material.dart';
import 'package:home/src/bloc/bloc/bloc.dart';
import 'package:menu/menu.dart';
import 'package:shopping_cart/shopping_cart.dart';

class HomeBlocObserver extends BlocObserver {
  BuildContext context;

  HomeBlocObserver({
    required this.context,
  });

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (bloc is MenuBloc ||
        bloc is ShoppingCartBloc ||
        bloc is DetailedDishBloc) {
      BlocProvider.of<HomeBloc>(context).add(OnChangeCartQuntityEvent());
    }
  }
}
