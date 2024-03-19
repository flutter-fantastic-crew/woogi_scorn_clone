import 'package:flutter/material.dart';

import '../util/number_util.dart';

class AmountTitleColumn extends StatelessWidget {
  AmountTitleColumn({
    super.key,
    required this.title,
    required this.amount,
    this.amountColor = const Color(0xFF000000),
    this.boxColor = const Color(0xFFEEEEEE),
    this.padding = EdgeInsets.zero,
    this.titleColor = const Color(0xFF757575),
  });

  EdgeInsets padding;
  Color boxColor;
  Color titleColor;
  Color amountColor;
  String title;
  int amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      color: titleColor,
                      fontFamily: 'PretendardMedium',
                    )),
                Text("${thousandWon(amount)}원",
                    style: TextStyle(
                      color: amountColor,
                      fontFamily: 'PretendardBold',
                    )),
              ],
            ),
          )),
    );
  }
}
