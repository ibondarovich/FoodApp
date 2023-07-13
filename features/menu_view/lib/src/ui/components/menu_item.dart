import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';


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
        left: AppDimens.containerMargin10, 
        right: AppDimens.containerMargin10, 
        bottom: AppDimens.containerMargin10),
      padding: const EdgeInsets.only(
        right: AppDimens.containerPadding5, 
        left: AppDimens.containerPadding5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).cardColor,
          width: AppDimens.borderWidth,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius15),
        color: Theme.of(context).cardColor,
        boxShadow: <BoxShadow>[
        BoxShadow(
          color: Theme.of(context).shadowColor,
          spreadRadius: AppDimens.spreadRadiusShadow,
          blurRadius: AppDimens.blurRadiusShadow20,
          ),
        ]
      ),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () => context.pushRoute(
              DetailedDishRoute(
                dishModel: widget.dishModel, 
              )
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: AppDimens.containerHeight120,
              child: AppImage(
                imageURL: widget.dishModel.url,
              ),
            ), 
          ),
          const SizedBox(height: AppDimens.verticalSpacing5),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.dishModel.name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(
            height: AppDimens.verticalSpacing5
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
                AppButton(
                  title: StringConstants.addToCartString,
                  onTap: (){ },
                  boxDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppDimens.padding35),
                    ),
                    gradient: AppColors.primaryGradient,
                  ),
                  textStyle: AppFonts.white_bold_14,
                )
              ]
            )
          )
        ],
      ),
    );
  }
}