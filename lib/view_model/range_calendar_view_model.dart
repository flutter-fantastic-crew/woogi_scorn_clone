import 'package:flutter/material.dart';

class RangeCalendarViewModel with ChangeNotifier {
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

  bool get enableCalendarSelectButton {
    return startDate != null && endDate != null;
  }

  ({DateTime startDate, DateTime endDate}) get selectedDateRecords {
    return (startDate: startDate!, endDate: endDate!);
  }
}
