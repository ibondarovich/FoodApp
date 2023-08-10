import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget{
  final String title;

  const IngredientItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(AppDimens.padding15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(AppDimens.padding40),
      ),
      child: Text(
        title,
        style: AppFonts.bold_14,
      ),
    );
  }
}