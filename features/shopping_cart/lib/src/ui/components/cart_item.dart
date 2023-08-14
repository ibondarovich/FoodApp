import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/shopping_cart.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItem;
  const CartItem({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        BlocProvider.of<ShoppingCartBloc>(context).add(
          OnDeleteItemEvent(
            id: cartItem.dishModel.id,
          ),
        );
      },
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        color: AppColors.red,
        child: const Padding(
        padding: EdgeInsets.only(right: AppDimens.padding10,),
          child: Icon(
            AppIcons.delete,
            color: AppColors.white,
          ),
        ),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height / 8,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimens.borderRadius30),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: AppDimens.blurRadiusShadow20,
            ),
          ],
        ),
        margin: const EdgeInsets.all(AppDimens.containerMargin10),
        child: Container(
          margin: const EdgeInsets.all(AppDimens.containerMargin10),
          child: Row(
            children: <Widget>[
              AppImage(
                filePath: cartItem.dishModel.url,
                alignment: Alignment.centerLeft,
                width: AppDimens.imageSize100,
              ),
              const SizedBox(
                width: AppDimens.horizontalSpacing30,
              ),
              Container(
                width: AppDimens.container80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(cartItem.dishModel.name,),
                    Text('\$${cartItem.dishModel.price}'),
                  ],
                ),
              ),
              const SizedBox(
                width: AppDimens.horizontalSpacing50,
              ),
              UnconstrainedBox(
                child: AppCircleIconButton(
                  icon: AppIcons.remove,
                  onTap: () => {
                    BlocProvider.of<ShoppingCartBloc>(context).add(
                      OnReduceQuantityEvent(cartItemModel: cartItem),
                    ),
                  },
                ),
              ),
              const SizedBox(
                width: AppDimens.horizontalSpacing10,
              ),
              UnconstrainedBox(
                child: Text(cartItem.quantity.toString()),
              ),
              const SizedBox(
                width: AppDimens.horizontalSpacing10,
              ),
              UnconstrainedBox(
                child: AppCircleIconButton(
                  icon: AppIcons.add,
                  onTap: ()=> {
                    BlocProvider.of<ShoppingCartBloc>(context).add(
                      OnIncreaseQuantityEvent(cartItemModel: cartItem),
                    ),
                  }
                ),
              ),
            ]
          ),
        ),
      ),
    );   
  }
}
