import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:scorn_clone/view_model/plan_addition_page_view_model.dart';
import 'package:scorn_clone/widget/custom_appbar.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import '../util/CurrencyFormatter.dart';
import '../widget/row_text_field.dart';

class PlanAdditionPage extends StatelessWidget {
  const PlanAdditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return ChangeNotifierProvider(
      create: (_) => PlanAdditionPageViewModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: CustomAppbar(
            context: context,
            backGroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "플랜 기간과 예산을\n입력하세요.",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'PretendardSemiBold',
                            ),
                          ),
                          Text(
                            "대한민국 - 원",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'PretendardRegular',
                                color: Colors.grey[500],
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: RowTextField(widgetList: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 10),
                            child: Icon(Icons.calendar_month),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    scrollControlDisabledMaxHeightRatio: 0.88,
                                    builder: (_) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              height: 400,
                                              child: ScrollableCleanCalendar(
                                                calendarController:
                                                    CleanCalendarController(
                                                  minDate: DateTime.now(),
                                                  maxDate: DateTime.now().add(
                                                      const Duration(
                                                          days: 365)),
                                                  weekdayStart: DateTime.monday,
                                                ),
                                                layout: Layout.BEAUTY,
                                                calendarCrossAxisSpacing: 0,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 100,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: GestureDetector(
                                                      child: Text("오늘로 이동",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  'PretendardRegular',
                                                              color: Colors
                                                                  .grey[500],
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: ElevatedButton(
                                                      onPressed: null,
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.blueAccent,
                                                        foregroundColor:
                                                            Colors.white,
                                                        disabledBackgroundColor:
                                                            Colors.blueAccent[
                                                                100],
                                                        minimumSize:
                                                            Size(700, 50),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12)),
                                                      ),
                                                      child: const Text("선택",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'PretendardBold',
                                                            color: Colors.white,
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: const Text("오늘"),
                            ),
                          ),
                        ]),
                      ),
                      RowTextField(widgetList: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 10),
                          child: Icon(Icons.attach_money_outlined),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "금액",
                              border: InputBorder.none,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CurrencyFormatter(),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          width: 30,
                          child: Text(
                            "원",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'PretendardRegular',
                                color: Colors.grey[400]),
                          ),
                        ),
                      ]),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.blueAccent[100],
                      minimumSize: Size(700, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("다음",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'PretendardBold',
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
