import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

enum TitleTypeEnum { informational, error }

void showAppSnackBar({
  required BuildContext context,
  required String title,
  TitleTypeEnum titleType = TitleTypeEnum.error,
}) {
  final Color? color;
  if(titleType == TitleTypeEnum.error){
    color = AppColors.red;
  } else {
    color = AppColors.primaryColor;
  }
  
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    backgroundColor: AppColors.transparent,
    elevation: AppDimens.elevetion0,
    content: Container(
      padding: const EdgeInsets.all(AppDimens.padding20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimens.padding20),
        ),
      ),
      child: Text(
        title,
      ),
    ),
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
