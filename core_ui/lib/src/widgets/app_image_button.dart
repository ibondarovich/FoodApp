import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppImageButton extends StatelessWidget {
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
  final Color? color;
  final Image image;

  const AppImageButton({
    super.key,
    this.onTap,
    required this.title,
    required this.image,
    this.padding = const EdgeInsets.all(10),
    this.margin,
    this.boxDecoration,
    this.height,
    this.width,
    this.textStyle,
    this.alignment = Alignment.center,
    this.borderRadius = 20,
    this.color,
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
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadius,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            image,
            Text(
              title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
