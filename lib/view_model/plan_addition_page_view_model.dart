import 'package:flutter/material.dart';

class PlanAdditionPageViewModel with ChangeNotifier {
  TextEditingController amountTextController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;

  void changeStartDate(DateTime dateTime) {
    startDate = dateTime;
    notifyListeners();
  }

  void changeEndDate(DateTime dateTime) {
    startDate = dateTime;
    notifyListeners();
  }

  bool get enableNextButton {
    return amountTextController.text.isNotEmpty &&
        startDate != null &&
        endDate != null;
  }
}
