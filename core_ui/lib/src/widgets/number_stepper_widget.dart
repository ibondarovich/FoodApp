import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class NumberStepperWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NumberStepperState();
}

class NumberStepperState extends State<NumberStepperWidget> {
  @override
  Widget build(BuildContext context) { // TODO add increment and decrement logic
    return Container(
      width: MediaQuery.sizeOf(context).width / 3,
      padding: const EdgeInsets.symmetric(
          vertical: AppDimens.padding8, horizontal: AppDimens.padding3),
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.all(Radius.circular(
          AppDimens.borderRadius30,
        )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.remove,
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            width: AppDimens.horizontalSpacing10,
          ),
          const Text(
            '1', //TODO remove hardcode
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            width: AppDimens.horizontalSpacing10,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
