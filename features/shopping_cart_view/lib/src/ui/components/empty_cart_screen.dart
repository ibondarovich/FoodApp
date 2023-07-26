import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_view/shopping_cart_view.dart';

class EmptyCartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            StringConstants.emptyCartTitle,
            style: AppFonts.bold_14,
          ),
          const SizedBox(
            height: AppDimens.verticalSpacing20,
          ),
          AppButton(
            title: StringConstants.goToMenuTitle,
            onTap: () => BlocProvider.of<ShoppingCartViewBloc>(context).add(
              OnNavigateToMenuPageEvent(context: context),
            ),
            margin: const EdgeInsets.only(
              right: AppDimens.padding15,
              left: AppDimens.padding15,
            ),
            textStyle: AppFonts.bold_14.copyWith(
              color: AppColors.white,
            ),
            padding: const EdgeInsets.all(AppDimens.padding20),
          ),
        ],
      )
    );
  }
}