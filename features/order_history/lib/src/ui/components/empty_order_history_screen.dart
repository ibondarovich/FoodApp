import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class EmptyOrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            StringConstants.emptyOrderHistoryTitle,
            style: AppFonts.bold_14,
          ),
          const SizedBox(
            height: AppDimens.verticalSpacing20,
          ),
          AppButton(
            title: StringConstants.goToMenuTitle,
            onTap: () => context.navigateTo(const EmptyRoute()),
            margin: const EdgeInsets.only(
              right: AppDimens.padding15,
              left: AppDimens.padding15,
            ),
            textStyle: AppFonts.bold_14.copyWith(
              color: AppColors.white,
            ),
            padding: const EdgeInsets.all(AppDimens.padding20),
          ),
        ],
      ),
    );
  }
}
