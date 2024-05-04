import 'dart:math';

import 'package:flutter/material.dart';
import '../entity/plan_data_entity.dart';
import '../entity/plan_history_entity.dart';

class HomePageViewModel with ChangeNotifier {
  final List<PlanDataEntity> _plans = [
    PlanDataEntity(
        planId: 0,
        planStartDate: DateTime.now(),
        planEndDate: DateTime.now().add(Duration(days: 15)),
        planMemo: "메모1",
        planName: "당근 옷 팔기",
        planIcon: getEmoji,
        planHistory: [
          PlanHistoryEntity(
            planHistoryId: 0,
            memo: "티셔츠",
            createAt: DateTime.now().add(Duration(days: 13)),
            expenses: 3000,
          ),
          PlanHistoryEntity(
            planHistoryId: 1,
            memo: "니트",
            createAt: DateTime.now().add(Duration(days: 4)),
            expenses: 5000,
          )
        ]),
    PlanDataEntity(
        planId: 1,
        planStartDate: DateTime.now(),
        planEndDate: DateTime.now().add(Duration(days: 31)),
        planMemo: "메모2",
        planName: "야식",
        planIcon: getEmoji,
        budget: 10000,
        planHistory: [
          PlanHistoryEntity(
            planHistoryId: 0,
            memo: "어묵",
            createAt: DateTime.now().add(Duration(days: 1)),
            expenses: 500,
          ),
          PlanHistoryEntity(
            planHistoryId: 1,
            memo: "떡볶이",
            createAt: DateTime.now().add(Duration(days: 2)),
            expenses: 1000,
          )
        ])
  ];

  List<PlanDataEntity> get plans => _plans;

  int get totalConsumption {
    return _plans.where((element) => element.totalExpenses < 0).fold(
        0, (previousValue, element) => previousValue + element.totalExpenses);
  }

  int get totalIncome {
    return _plans.where((element) => element.totalExpenses > 0).fold(
        0, (previousValue, element) => previousValue + element.totalExpenses);
  }

  void addPlan(PlanDataEntity plan) {
    _plans.add(plan);
    notifyListeners();
  }

  void addPlanHistoryByPlanId(
      {required PlanHistoryEntity planHistory, required int planId}) {
    for (var plan in _plans) {
      if (plan.planId == planId) {
        plan.planHistory.add(planHistory);
        break;
      }
    }
    notifyListeners();
  }
}

String get getEmoji {
  List<String> emogiList = [
    "\u{1F313}",
    "\u{1F314}",
    "\u{1F315}",
    "\u{1F319}",
    "\u{1F31B}",
    "\u{1F31F}",
    "\u{1F320}",
    "\u{1F330}",
    "\u{1F331}",
    "\u{1F334}",
    "\u{1F335}",
    "\u{1F337}",
    "\u{1F338}",
    "\u{1F339}",
    "\u{1F33A}",
    "\u{1F33B}",
    "\u{1F33D}",
    "\u{1F33E}",
    "\u{1F33F}",
    "\u{1F340}",
    "\u{1F341}",
    "\u{1F342}",
    "\u{1F343}",
    "\u{1F344}",
    "\u{1F345}",
    "\u{1F346}",
    "\u{1F347}",
    "\u{1F348}",
    "\u{1F349}",
  ];

  return emogiList[Random().nextInt(28)];
}
