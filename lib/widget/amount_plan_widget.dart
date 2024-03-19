import 'package:flutter/material.dart';

import '../util/number_util.dart';

class AmountPlanWidget extends StatelessWidget {
  AmountPlanWidget({
    super.key,
    required this.emoji,
    required this.planName,
    required this.amount,
    required this.totalAmount,
    required this.isIncome,
  });

  String emoji = "\u{1f60e}";
  String planName;
  int amount;
  int totalAmount;
  bool isIncome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE), shape: BoxShape.circle),
                  child: Text(emoji, style: TextStyle(fontSize: 15)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(planName,
                      style: const TextStyle(
                        color: Color(0xFF757575),
                        fontFamily: 'PretendardRegular',
                      )),
                  Text("${thousandWon(amount)}원",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'PretendardRegular',
                      ))
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text("${thousandWon(amount)}원",
                  style: TextStyle(
                    color: isIncome ? Colors.green : Colors.black,
                    fontFamily: 'PretendardRegular',
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(isIncome ? "수입" : "남음",
                    style: const TextStyle(
                      color: Color(0xFF757575),
                      fontFamily: 'PretendardRegular',
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
