import 'package:flutter/material.dart';

class ClassicListTile extends StatelessWidget {
  final String title;
  final Color? tileColor;
  final Widget? subTitle;
  final Widget trailing;
  final Widget? leading;
  final VisualDensity? visualDensity;
  final bool isDense;
  final bool isWidgetTitle;
  final Widget? widgetTitle;
  final TextStyle? titleStyle;
  final GestureTapCallback? onTap;
  const ClassicListTile(
      {Key? key,
      required this.title,
      this.subTitle,
      this.trailing = const Icon(
        Icons.arrow_forward_ios_sharp,
        size: 15,
        color: Colors.grey,
      ),
      this.leading,
      this.widgetTitle,
      this.tileColor,
      this.isDense = false,
      this.isWidgetTitle = false,
      this.titleStyle,
      this.visualDensity = VisualDensity.compact,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        tileColor: tileColor,
        dense: isDense,
        visualDensity: visualDensity ?? VisualDensity.compact,
        title: !isWidgetTitle
            ? Text(title,
                style: titleStyle ??
                    const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500))
            : widgetTitle,
        subtitle: subTitle,
        trailing: trailing,
        onTap: onTap,
        leading: leading);
  }
}
