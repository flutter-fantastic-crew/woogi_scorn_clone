import 'package:flutter/material.dart';
import 'package:scorn_clone/entity/plan_history_entity.dart';

class PlanHistoryPageViewModel with ChangeNotifier {
  bool isPlus = true;
  int expenses = 0;
  TextEditingController memoTextController = TextEditingController();
  DateTime paidDatetime = DateTime.now();
  String emoji = "\u{1F313}";

  void changePaidDatetime(DateTime dateTime) {
    paidDatetime = dateTime;
    notifyListeners();
  }

  void changeExpenses(String expenses) {
    this.expenses = int.parse(expenses.replaceAll(",", "").substring(1));
    notifyListeners();
  }

  void changeEmoji(String emoji) {
    this.emoji = emoji;
    notifyListeners();
  }

  void changePlus() {
    isPlus = !isPlus;
    notifyListeners();
  }

  bool get enableSaveButton {
    return expenses != 0;
  }

  PlanHistoryEntity get getPlanHistoryEntity {
    //todo :: id 생성 방식
    return PlanHistoryEntity(
        planHistoryId: -1,
        expenses: isPlus ? expenses : expenses * -1,
        memo: memoTextController.text,
        createAt: paidDatetime);
  }
}
