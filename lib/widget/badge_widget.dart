import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  BadgeWidget(
      {Key? key,
      required this.badgeText,
      required this.backgroundColor,
      required this.textColor})
      : super(key: key);
  String badgeText;
  Color backgroundColor;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: backgroundColor),
      width: 28,
      height: 17,
      child: Center(
        child: Text(
          badgeText,
          style: TextStyle(fontSize: 10, color: textColor),
        ),
      ),
    );
  }
}
