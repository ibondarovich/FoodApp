import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget{
  final DishModel dishModel;
  const MenuItem({
    super.key,
    required this.dishModel
  });
  @override
  State<StatefulWidget> createState() => MenuItemState();
}

class MenuItemState extends State<MenuItem>{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        left: AppDimens.containerMargin, 
        right: AppDimens.containerMargin, 
        bottom: AppDimens.containerMargin),
      padding: const EdgeInsets.only(
        right: AppDimens.containerPadding, 
        left: AppDimens.containerPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.white,
          width: AppDimens.borderWidth,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowWhite,
            spreadRadius: AppDimens.spreadRadiusShadow,
            blurRadius: AppDimens.blurRadiusShadow,
          ),
        ]
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: AppDimens.imageContainerHeight,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.network(widget.dishModel.url)
            ),
          ),   
          const SizedBox(height: AppDimens.verticalSpacing),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.dishModel.name,
              style: AppFonts.bold_14
            ),
          ),
          const SizedBox(
            height: AppDimens.verticalSpacing
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Row(
              children: <Widget>[
                Text(
                  '${widget.dishModel.price}\$',
                  style: AppFonts.bold_20
                ),
                const SizedBox(
                  width: AppDimens.horizontalSpacing, 
                ),
                const AddToCartButtonWidget()
              ]
            )
          )
        ],
      ),
    );
  }
}