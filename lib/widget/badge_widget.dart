import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  BadgeWidget(
      {Key? key,
      required this.badgeText,
      required this.backgroundColor,
      required this.textColor,
      this.onTap})
      : super(key: key);
  String badgeText;
  Color backgroundColor;
  Color textColor;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: backgroundColor),
        width: 35,
        height: 20,
        child: Center(
          child: Text(
            badgeText,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
              fontFamily: 'PretendardRegular',
            ),
          ),
        ),
      ),
    );
  }
}
