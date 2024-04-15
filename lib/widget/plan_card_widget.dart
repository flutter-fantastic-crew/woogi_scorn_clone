import 'package:flutter/material.dart';
import 'package:scorn_clone/widget/pie_chart.dart';

import '../entity/plan_data_entity.dart';

class PlanCardWidget extends StatelessWidget {
  const PlanCardWidget({
    Key? key,
    required this.plan,
  }) : super(key: key);
  final PlanDataEntity plan;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.white),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(plan.planIcon + plan.planName,
                      style: TextStyle(
                          fontSize: 18, fontFamily: 'PretendardBold')),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: CustomPaint(
                        size: Size(300, 300),
                        painter: PieChart(
                          percentage:
                              plan.totalExpenses ~/ (plan.budget ?? 1) * 100,
                          budget: plan.budget ?? 0,
                          totalExpenses: plan.totalExpenses,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("내역 추가",
                        style: TextStyle(
                            fontSize: 18, fontFamily: 'PretendardBold')),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      minimumSize: Size(700, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
