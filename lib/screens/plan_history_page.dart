import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:scorn_clone/util/CurrencyFormatter.dart';
import 'package:scorn_clone/util/datetime_extension.dart';
import 'package:scorn_clone/view_model/plan_history_page_view_model.dart';
import 'package:scorn_clone/widget/row_text_field.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import '../view_model/home_page_view_model.dart';
import '../widget/custom_appbar.dart';

class PlanHistoryPage extends StatefulWidget {
  PlanHistoryPage({super.key});

  @override
  State<PlanHistoryPage> createState() => _PlanHistoryPageState();
}

class _PlanHistoryPageState extends State<PlanHistoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlanHistoryPageViewModel>(
        create: (_) => PlanHistoryPageViewModel(),
        builder: (context, child) {
          return Scaffold(
            appBar: CustomAppbar(
              context: context,
              backGroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      RowTextField(widgetList: [
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "소비 금액",
                              border: InputBorder.none,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CurrencyFormatter(),
                            ],
                            controller: context
                                .watch<PlanHistoryPageViewModel>()
                                .expensesTextController,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: RowTextField(widgetList: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: GestureDetector(
                              child: Text(getEmoji),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: "내용",
                                border: InputBorder.none,
                              ),
                              controller: context
                                  .watch<PlanHistoryPageViewModel>()
                                  .memoTextController,
                            ),
                          ),
                        ]),
                      ),
                      RowTextField(widgetList: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          child: Icon(Icons.calendar_month),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  // scrollControlDisabledMaxHeightRatio: 0.88,
                                  builder: (_) {
                                    return FractionallySizedBox(
                                      heightFactor: 0.5,
                                      child: ScrollableCleanCalendar(
                                        calendarController:
                                            CleanCalendarController(
                                          minDate: DateTime.now(),
                                          maxDate: DateTime.now()
                                              .add(const Duration(days: 365)),
                                          rangeMode: false,
                                          onDayTapped: (date) {
                                            context
                                                .read<
                                                    PlanHistoryPageViewModel>()
                                                .changePaidDatetime(date);
                                            Navigator.pop(_);
                                          },
                                          weekdayStart: DateTime.monday,
                                        ),
                                        layout: Layout.BEAUTY,
                                        calendarCrossAxisSpacing: 0,
                                      ),
                                    );
                                  });
                            },
                            child: Text(
                              context
                                  .watch<PlanHistoryPageViewModel>()
                                  .paidDatetime
                                  .convertKoreaDate,
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'PretendardRegular',
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: context
                            .watch<PlanHistoryPageViewModel>()
                            .enableSaveButton
                        ? () {
                            Navigator.pop(
                                context,
                                context
                                    .read<PlanHistoryPageViewModel>()
                                    .getPlanHistoryEntity);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.blueAccent[100],
                      minimumSize: Size(700, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("저장",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'PretendardBold',
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
