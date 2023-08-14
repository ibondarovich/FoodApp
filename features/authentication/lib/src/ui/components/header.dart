import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String _mainTitle;
  final String _secondaryTitle;

  const AuthHeader({
    super.key,
    required String mainTitle,
    required String secondaryTitle,
  })  : _mainTitle = mainTitle,
        _secondaryTitle = secondaryTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: AppDimens.padding12,
        bottom: AppDimens.padding20,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppDimens.padding20,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _mainTitle,
                textAlign: TextAlign.left,
                style: AppFonts.bold_25,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _secondaryTitle,
            ),
          ),
        ],
      ),
    );
  }
}
