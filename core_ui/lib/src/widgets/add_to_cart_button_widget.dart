import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final Function()? onTap;
  const AddToCartButtonWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.orange),
        foregroundColor: MaterialStateProperty.all(AppColors.white),
      ),
      child: const Row(
        children: <Widget>[
          Text(StringConstants.addToCartString),
          SizedBox(width: AppDimens.horizontalSpacing),
          AppIcons.shoppingBasket
        ],
      )
    );
  }
}
