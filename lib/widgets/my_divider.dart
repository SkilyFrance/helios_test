import 'package:flutter/material.dart';

Column myDivider({required Widget child}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      const SizedBox(height: 5.0),
      child,
      const SizedBox(height: 5.0),
      Divider(
        height: 0,
        indent: 70,
        color: Colors.grey.shade900,
      )
    ],
  );
}
