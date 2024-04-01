import 'package:flutter/material.dart';
import 'package:scorn_clone/widget/amount_plan_widget.dart';
import 'package:scorn_clone/widget/amount_title_row.dart';

import '../entity/plan_data_entity.dart';
import 'amount_title_column.dart';

class SummaryInfoBottomSheet extends StatelessWidget {
  SummaryInfoBottomSheet({
    super.key,
    required this.totalIncome,
    required this.totalConsumption,
  });

  int totalIncome;
  int totalConsumption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              width: 45,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '요약',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'PretendardBold'),
                ),
                Text(
                  '대한민국 - 원 v',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: AmountTitleColumn(
                title: "총 소비",
                amount: totalConsumption,
                padding: const EdgeInsets.only(right: 8),
              )),
              Expanded(
                  child: AmountTitleColumn(
                title: "총 수입",
                amount: totalIncome,
                amountColor: const Color(0xFF00B75F),
                padding: const EdgeInsets.only(left: 8),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 25),
            child: AmountTitleRow(
              title: "남은 총 예산",
              amount: 80,
              totalAmount: 100,
            ),
          ),
          const Text("플랜별 소비",
              style: TextStyle(
                color: Color(0xFF757575),
                fontFamily: 'PretendardRegular',
              )),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      AmountPlanWidget(
                          emoji: "\u{2708}",
                          planName: "당근",
                          amount: 1000,
                          totalAmount: 15000,
                          isIncome: true),
                      AmountPlanWidget(
                          emoji: "\u{1f64f}",
                          planName: "저녁",
                          amount: 30000,
                          totalAmount: 450000,
                          isIncome: false),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
