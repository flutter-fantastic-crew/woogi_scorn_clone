import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scorn_clone/entity/plan_history_entity.dart';
import 'package:scorn_clone/view_model/home_page_view_model.dart';
import 'package:scorn_clone/widget/pie_chart.dart';
import 'package:scorn_clone/widget/plan_type_circular_indicator.dart';

import '../entity/plan_entity.dart';
import 'free_type_circular_indicator.dart';

class PlanCardWidget extends StatelessWidget {
  const PlanCardWidget({
    Key? key,
    required this.plan,
  }) : super(key: key);
  final PlanEntity plan;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: const TextStyle(
                    fontSize: 18, fontFamily: 'PretendardBold')),
            plan.budget == null
                ? FreeTypeCircularIndicator(plan: plan)
                : PlanTypeCircularIndicator(plan: plan),
            ElevatedButton(
              onPressed: () {
                context.push('/planHistory').then((value) {
                  if (value != null && value is PlanHistoryEntity) {
                    context.read<HomePageViewModel>().addPlanHistoryByPlanId(
                        planHistory: value, planId: plan.planId);
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                minimumSize: Size(700, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("내역 추가",
                  style: TextStyle(fontSize: 18, fontFamily: 'PretendardBold')),
            )
          ],
        ),
      ),
    );
  }
}
