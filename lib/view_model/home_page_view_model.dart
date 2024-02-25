import 'package:flutter/material.dart';
import '../entity/plan_data_entity.dart';
import '../entity/plan_history_entity.dart';

class HomePageViewModel with ChangeNotifier {
  List<PlanDataEntity> _plans = [
    PlanDataEntity(
        planId: 0,
        planStartDate: DateTime.now(),
        planEndDate: DateTime.now(),
        planMemo: "메모1",
        planName: "계획 이름1",
        planIcon: Icon(Icons.toys_outlined),
        planHistory: [
          PlanHistoryEntity(
            planHistoryId: 0,
            memo: "메모+",
            createAt: DateTime.now(),
            expenses: 100,
          ),
          PlanHistoryEntity(
            planHistoryId: 1,
            memo: "메모+",
            createAt: DateTime.now(),
            expenses: 200,
          )
        ],
        totalPlan: 1000),
    PlanDataEntity(
        planId: 0,
        planStartDate: DateTime.now(),
        planEndDate: DateTime.now(),
        planMemo: "메모2",
        planName: "계획 이름",
        planIcon: Icon(Icons.toys_outlined),
        planHistory: [
          PlanHistoryEntity(
            planHistoryId: 0,
            memo: "메모++",
            createAt: DateTime.now(),
            expenses: 100,
          ),
          PlanHistoryEntity(
            planHistoryId: 1,
            memo: "메모++",
            createAt: DateTime.now(),
            expenses: 200,
          )
        ],
        totalPlan: 1000)
  ];

  List<PlanDataEntity> get plans => _plans;

  void addPlan(PlanDataEntity plan) {
    _plans.add(plan);
    notifyListeners();
  }
}
