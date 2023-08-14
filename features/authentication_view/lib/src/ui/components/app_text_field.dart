import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final double borderRadius;
  final EdgeInsets? margin;
  final TextEditingController? controller;
  final Widget? icon;
  final String? errorText;
  final Function(String)? onChanged;

  const AppTextField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.borderRadius = AppDimens.borderRadius15,
    this.controller,
    this.icon,
    this.margin,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          errorText: errorText,
          icon: icon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            borderSide: BorderSide(
              color: Theme.of(context)
                  .inputDecorationTheme
                  .focusedBorder!
                  .borderSide
                  .color,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            borderSide: BorderSide(
              color: Theme.of(context)
                  .inputDecorationTheme
                  .focusedBorder!
                  .borderSide
                  .color,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            borderSide: const BorderSide(
              color: AppColors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            borderSide: const BorderSide(
              color: AppColors.red,
            ),
          ),
          hintText: hintText,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
