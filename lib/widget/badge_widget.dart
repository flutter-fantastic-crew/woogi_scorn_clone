import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  BadgeWidget(
      {Key? key, required this.badgeText, this.backgroundColor, this.textColor})
      : super(key: key);
  String badgeText;
  Color? backgroundColor = Colors.grey;
  Color? textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: backgroundColor),
        height: 66,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
          child: Text(
            badgeText,
            style: TextStyle(fontSize: 40, color: textColor),
          ),
        ),
      ),
    );
  }
}
