import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  IconButtonWidget(
      {Key? key,
      required this.iconSize,
      required this.icon,
      required this.padding})
      : super(key: key);
  double iconSize;
  EdgeInsets padding;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconSize,
      width: iconSize,
      child: IconButton(
        onPressed: () {},
        iconSize: iconSize,
        padding: padding,
        icon: icon,
      ),
    );
  }
}
