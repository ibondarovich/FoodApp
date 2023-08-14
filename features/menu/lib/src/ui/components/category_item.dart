import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Color? color;
  final Color? selectedColor;
  final bool isSelected;
  final EdgeInsets? padding;
  final Function()? onTap;
  final String title;

  const CategoryItem({
    required this.isSelected, 
    required this.title,
    super.key,
    this.color,
    this.padding, 
    this.selectedColor, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: isSelected? selectedColor : color,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimens.borderRadius20,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
