import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/models/order_model.dart';
import 'package:flutter/material.dart';

import 'cart_item.dart';

class OrderItem extends StatelessWidget {
  final OrderModel orderModel;

  const OrderItem({
    required this.orderModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
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
      child: ClipRect(
        child: Banner(
          message: StringConstants.completeBannerTitle,
          location: BannerLocation.topEnd,
          color: AppColors.green,
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppDimens.padding20,
              top: AppDimens.padding10,
              bottom: AppDimens.padding10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${StringConstants.orderTitle} #${orderModel.id}',
                  ),
                ),
                const Divider(
                  indent: AppDimens.indent50,
                  endIndent: AppDimens.indent50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppDimens.padding10,
                    bottom: AppDimens.padding10,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: orderModel.orderedItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartItem(
                        cartItem: orderModel.orderedItems[index],
                      );
                    },
                  ),
                ),
                const Divider(
                  indent: AppDimens.indent50,
                  endIndent: AppDimens.indent50,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${StringConstants.totalPriceTitle}: \$${orderModel.price}',
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${StringConstants.timeTitle}: ${DateFormat('dd-MM-yyyy HH:mm').format(orderModel.dateTimeOfIssuance)}',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
