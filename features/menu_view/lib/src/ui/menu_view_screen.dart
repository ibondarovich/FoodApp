import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MenuViewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfffafafa),
      height: MediaQuery.sizeOf(context).height,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          children: List.generate(
            17,
            (index) => SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: MenuItem(key: ValueKey(index)), 
            ),
          ),
        ),
      )
    );
  }
}