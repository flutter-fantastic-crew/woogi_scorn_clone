import 'package:flutter/material.dart';
import 'package:scorn_clone/entity/plan_history_entity.dart';

class PlanHistoryPageViewModel with ChangeNotifier {
  int expenses = 0;
  TextEditingController memoTextController = TextEditingController();
  DateTime paidDatetime = DateTime.now();

  void changePaidDatetime(DateTime dateTime) {
    paidDatetime = dateTime;
    notifyListeners();
  }

  void changeExpenses(String expenses) {
    this.expenses = int.parse(expenses.replaceAll(",", "").substring(1));
    notifyListeners();
  }

  bool get enableSaveButton {
    return expenses != 0;
  }

  PlanHistoryEntity get getPlanHistoryEntity {
    //todo :: id 생성 방식
    return PlanHistoryEntity(
        planHistoryId: -1,
        expenses: expenses,
        memo: memoTextController.text,
        createAt: paidDatetime);
  }
}
