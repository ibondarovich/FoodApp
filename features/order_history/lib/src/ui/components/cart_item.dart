import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItem({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
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
