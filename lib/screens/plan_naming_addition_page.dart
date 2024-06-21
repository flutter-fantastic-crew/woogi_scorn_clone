import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:scorn_clone/view_model/plan_addition_page_view_model.dart';
import 'package:scorn_clone/widget/custom_appbar.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

import '../util/CurrencyFormatter.dart';
import '../view_model/range_calendar_view_model.dart';
import '../widget/plan_addition_page/range_calendar_widget.dart';
import '../widget/row_text_field.dart';

class PlanNamingAdditionPage extends StatelessWidget {
  const PlanNamingAdditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "플랜 이름",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'PretendardSemiBold',
                        ),
                      ),
                    ],
                  ),
                  // type : date, text, amount
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RowTextField(widgetList: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: Icon(Icons.calendar_month),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Consumer<PlanAdditionPageViewModel>(
                            builder: (BuildContext context,
                                PlanAdditionPageViewModel viewModel,
                                Widget? _) {
                              return TextField(
                                  enabled: false,
                                  decoration: const InputDecoration(
                                    hintText: "기간",
                                    border: InputBorder.none,
                                  ),
                                  controller: viewModel.dateTextController,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black));
                            },
                          ),
                        ),
                      )
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
                          onChanged: (value) {
                            context
                                .read<PlanAdditionPageViewModel>()
                                .changeAmount(value);
                          },
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
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
              Consumer<PlanAdditionPageViewModel>(builder:
                  (BuildContext context, PlanAdditionPageViewModel viewModel,
                      Widget? _) {
                return ElevatedButton(
                  onPressed: viewModel.enableNextButton
                      ? () => print("next page~")
                      : null,
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
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
