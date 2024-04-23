import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scorn_clone/widget/plan_circular_indicator.dart';

import '../entity/plan_data_entity.dart';
import 'free_circular_indicator.dart';

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
        Container(
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
                    style:
                        TextStyle(fontSize: 18, fontFamily: 'PretendardBold')),
                plan.budget == null
                    ? FreeCircularIndicator(plan: plan)
                    : PlanCircularIndicator(plan: plan),
                ElevatedButton(
                  onPressed: () {
                    context.go('/planHistory');
                  },
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
      ],
    );
  }
}
