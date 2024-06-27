import 'package:flutter/material.dart';
import 'package:scorn_clone/util/datetime_extension.dart';

// notify 어디서 되는지 확인하기
class PlanAdditionPageViewModel with ChangeNotifier {
  TextEditingController dateTextController = TextEditingController();
  TextEditingController titleTextController = TextEditingController();
  TextEditingController contentTextController = TextEditingController();
  int? amount;
  DateTime? startDate;
  DateTime? endDate;

  void changeStartDate(DateTime dateTime) {
    startDate = dateTime;
    changeDateText();
    notifyListeners();
  }

  void changeEndDate(DateTime dateTime) {
    endDate = dateTime;
    changeDateText();
    notifyListeners();
  }

  void changeAmount(String expenses) {
    amount = int.parse(expenses.replaceAll(",", "").substring(1));
    notifyListeners();
  }

  void changeDateText() {
    if (startDate != null && endDate != null) {
      dateTextController.text =
          "${startDate!.convertKoreaDate} : ${endDate!.convertKoreaDate}";
    } else {
      dateTextController.text = "";
    }
    notifyListeners();
  }

  void initNamingPage() {
    titleTextController.clear();
    contentTextController.clear();
  }

  bool get enableNextButton {
    return amount != null && startDate != null && endDate != null;
  }

  @override
  void dispose() {
    dateTextController.dispose();
    titleTextController.dispose();
    contentTextController.dispose();
    super.dispose();
  }
}
