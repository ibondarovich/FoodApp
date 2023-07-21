import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppCircleIconButton extends StatelessWidget{
  final Function()? onTap;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final BoxDecoration? boxDecoration;
  final double? width;
  final double? height;
  final Alignment alignment;
  final double borderRadius;

  const AppCircleIconButton({
    super.key,
    this.onTap,
    required this.icon,
    this.iconSize = 16,
    this.iconColor = AppColors.white,
    this.padding = const EdgeInsets.all(2),
    this.margin,
    this.boxDecoration,
    this.height = 24,
    this.width = 24,
    this.alignment = Alignment.center,
    this.borderRadius = 20,
  });
  @override
  Widget build(BuildContext context) {
     return GestureDetector(
      onTap: onTap, 
      child: Container(
        alignment: alignment,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: AppColors.primaryGradient,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}