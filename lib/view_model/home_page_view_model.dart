import 'package:flutter/material.dart';
import '../entity/plan_data_entity.dart';
import '../entity/plan_history_entity.dart';

class HomePageViewModel with ChangeNotifier {
  final List<PlanDataEntity> _plans = [
    PlanDataEntity(
        planId: 0,
        planStartDate: DateTime.now(),
        planEndDate: DateTime.now(),
        planMemo: "메모1",
        planName: "당근 옷 팔기",
        planIcon: Icon(Icons.toys_outlined),
        planHistory: [
          PlanHistoryEntity(
            planHistoryId: 0,
            memo: "티셔츠",
            createAt: DateTime.now(),
            expenses: 3000,
          ),
          PlanHistoryEntity(
            planHistoryId: 1,
            memo: "니트",
            createAt: DateTime.now(),
            expenses: 5000,
          )
        ]),
    PlanDataEntity(
        planId: 0,
        planStartDate: DateTime.now(),
        planEndDate: DateTime.now(),
        planMemo: "메모2",
        planName: "야식",
        planIcon: Icon(Icons.toys_outlined),
        planHistory: [
          PlanHistoryEntity(
            planHistoryId: 0,
            memo: "어묵",
            createAt: DateTime.now(),
            expenses: -500,
          ),
          PlanHistoryEntity(
            planHistoryId: 1,
            memo: "떡볶이",
            createAt: DateTime.now(),
            expenses: -1000,
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
}
