import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final Alignment alignment;

  const AppTextButton({
    super.key,
    this.onTap,
    required this.title,
    this.textStyle,
    this.height,
    this.width,
    this.alignment = Alignment.center,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        height: height,
        width: width,
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
