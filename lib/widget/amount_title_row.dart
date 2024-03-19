import 'package:flutter/material.dart';

import '../util/number_util.dart';

class AmountTitleRow extends StatelessWidget {
  AmountTitleRow({
    super.key,
    required this.title,
    required this.amount,
    this.totalAmount,
    this.amountColor = const Color(0xFF000000),
    this.boxColor = const Color(0xFFEEEEEE),
    this.padding = EdgeInsets.zero,
    this.titleColor = const Color(0xFF757575),
    this.totalAmountColor = const Color(0xFF757575),
  });

  EdgeInsets padding;
  Color boxColor;
  Color titleColor;
  Color totalAmountColor;
  Color amountColor;
  String title;
  int amount;
  int? totalAmount;

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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Row(
              children: [
                Text(title,
                    style: TextStyle(
                      color: titleColor,
                      fontFamily: 'PretendardMedium',
                    )),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(" ${thousandWon(amount)}원 ",
                          style: TextStyle(
                            color: amountColor,
                            fontFamily: 'PretendardBold',
                          )),
                      Visibility(
                        visible: totalAmount != null,
                        child: Text("/ ${thousandWon(totalAmount!)}원",
                            style: TextStyle(
                              color: totalAmountColor,
                              fontFamily: 'PretendardBold',
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
