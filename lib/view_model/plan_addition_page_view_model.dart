import 'package:flutter/material.dart';

class PlanAdditionPageViewModel with ChangeNotifier {
  TextEditingController amountTextController = TextEditingController();
  TextEditingController dateTextController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;

  void changeStartDate(DateTime dateTime) {
    startDate = dateTime;
    notifyListeners();
  }

  void changeEndDate(DateTime dateTime) {
    endDate = dateTime;
    notifyListeners();
  }

  void changeDateText() {
    // todo :: date text 포맷 맞춰서 넣어주기
    dateTextController.text = "";
    notifyListeners();
  }

  bool get enableNextButton {
    return amountTextController.text.isNotEmpty &&
        startDate != null &&
        endDate != null;
  }
}
