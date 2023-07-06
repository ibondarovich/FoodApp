import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppLoaderWidget extends StatelessWidget {
  final Color backgroundColor;

  const AppLoaderWidget({
    Key? key,
    this.backgroundColor = AppColors.primaryColor
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor,
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
