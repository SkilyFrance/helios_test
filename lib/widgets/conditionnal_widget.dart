import 'package:flutter/material.dart';

class WidgetBuilderConditionnal extends StatelessWidget {
  final Widget child;
  final Widget? replaceBy;
  final bool isDisplay;
  const WidgetBuilderConditionnal(
      {Key? key, required this.child, required this.isDisplay, this.replaceBy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        if (isDisplay == true) {
          return child;
        }
        return replaceBy ??
            const SizedBox(
              height: 0,
              width: 0,
            );
      },
    );
  }
}
