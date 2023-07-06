import 'package:flutter/material.dart';

class AppButton extends StatelessWidget{
  final Function()? onTap;
  final String title;
  final TextStyle? textStyle;
  final double padding;
  final EdgeInsets? margin;
  final BoxDecoration? boxDecoration;
  final double? width;
  final double? height;
  final Alignment alignment;

  const AppButton({
    super.key,
    this.onTap,
    required this.title,
    this.padding = 10,
    this.margin,
    this.boxDecoration,
    this.height,
    this.width,
    this.textStyle,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      child: Container(
        alignment: alignment,
        width: height,
        height: width,
        padding: EdgeInsets.all(padding),
        margin: margin,
        decoration: boxDecoration,
        child: Text(
          title,
          style: textStyle,
        ),
      )
    );
  }
}