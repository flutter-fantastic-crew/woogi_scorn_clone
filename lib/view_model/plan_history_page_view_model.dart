import 'package:flutter/material.dart';
import 'package:scorn_clone/entity/plan_history_entity.dart';

class PlanHistoryPageViewModel with ChangeNotifier {
  TextEditingController expensesTextController = TextEditingController();
  TextEditingController memoTextController = TextEditingController();
  DateTime paidDatetime = DateTime.now();

  void changePaidDatetime(DateTime dateTime) {
    paidDatetime = dateTime;
    notifyListeners();
  }

  bool get enableSaveButton {
    return expensesTextController.text != "";
  }

  PlanHistoryEntity get getPlanHistoryEntity {
    //todo :: id 생성 방식
    return PlanHistoryEntity(
        planHistoryId: -1,
        expenses: int.parse(
            expensesTextController.text.replaceAll(",", "").substring(1)),
        memo: memoTextController.text,
        createAt: paidDatetime);
  }
}
