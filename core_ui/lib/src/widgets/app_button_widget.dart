import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget{
  final Function()? onTap;
  final String title;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final BoxDecoration? boxDecoration;
  final double? width;
  final double? height;
  final Alignment alignment;
  final double borderRadius;

  const AppButton({
    super.key,
    this.onTap,
    required this.title,
    this.padding = const EdgeInsets.all(10),
    this.margin,
    this.boxDecoration,
    this.height,
    this.width,
    this.textStyle,
    this.alignment = Alignment.center,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      child: Container(
        alignment: alignment,
        width: height,
        height: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          gradient: AppColors.primaryGradient,
        ),
        child: Text(
          title,
          style: textStyle,
        ),
      )
    );
  }
}