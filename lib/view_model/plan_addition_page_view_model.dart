import 'dart:math';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:scorn_clone/util/datetime_extension.dart';

import '../entity/plan_data_entity.dart';

// notify 어디서 되는지 확인하기
class PlanAdditionPageViewModel with ChangeNotifier {
  TextEditingController dateTextController = TextEditingController();
  TextEditingController contentTextController = TextEditingController();
  String? title;
  int? amount;
  DateTime? startDate;
  DateTime? endDate;
  bool isFirst = true;

  void setIsFirstFalse() {
    isFirst = false;
  }

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

  void changeTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  void changeDateText() {
    if (startDate != null && endDate != null) {
      dateTextController.text =
          "${startDate!.convertKoreaDate} ~ ${endDate!.convertKoreaDate}";
    } else {
      dateTextController.text = "";
    }
    notifyListeners();
  }

  void initNamingPage() {
    title = "";
    contentTextController.clear();
  }

  bool get enableNextButtonForDetail {
    return amount != null && startDate != null && endDate != null;
  }

  bool get enableNextButtonForNaming {
    return (title ?? "") != "";
  }

  PlanDataEntity get getPlanDataEntity {
    //todo :: id 생성 방식
    return PlanDataEntity(
        planId: -1,
        planStartDate: startDate ?? DateTime.now(),
        planEndDate: endDate ?? DateTime.now(),
        planMemo: contentTextController.text,
        planName: title ?? "",
        planIcon: defaultEmojiSet[2]
            .emoji[Random().nextInt(defaultEmojiSet[2].emoji.length)]
            .emoji,
        planHistory: []);
  }

  @override
  void dispose() {
    dateTextController.dispose();
    contentTextController.dispose();
    super.dispose();
  }
}
