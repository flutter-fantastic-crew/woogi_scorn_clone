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
import '../widget/plan_addition_page/range_calendar_bottom_sheet.dart';
import '../widget/row_text_field.dart';

class PlanAdditionPage extends StatefulWidget {
  const PlanAdditionPage({super.key});

  @override
  State<PlanAdditionPage> createState() => _PlanAdditionPageState();
}

class _PlanAdditionPageState extends State<PlanAdditionPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 200))
          .then((value) => showRangeCalendarBottomSheet(context));
    });
  }

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
                                showRangeCalendarBottomSheet(context);
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
