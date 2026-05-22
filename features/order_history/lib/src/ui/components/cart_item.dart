import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItem({
    required this.cartItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimens.padding30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            '\$${cartItem.dishModel.price}',
          ),
          Expanded(
            child: Text(
              'x${cartItem.quantity}',
            ),
          ),
          Expanded(
            child: Text(
              cartItem.dishModel.name,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
