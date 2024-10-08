import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:scorn_clone/view_model/plan_addition_page_view_model.dart';
import 'package:scorn_clone/widget/custom_appbar.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

import '../util/CurrencyFormatter.dart';
import '../view_model/range_calendar_view_model.dart';
import '../widget/bottom_navigation_button.dart';
import '../widget/plan_addition_page/range_calendar_widget.dart';
import '../widget/row_text_field.dart';

class PlanNamingAdditionPage extends StatefulWidget {
  PlanNamingAdditionPage({super.key, required this.viewModel});

  PlanAdditionPageViewModel viewModel;

  @override
  State<PlanNamingAdditionPage> createState() => _PlanNamingAdditionPageState();
}

class _PlanNamingAdditionPageState extends State<PlanNamingAdditionPage> {
  TextEditingController titleTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleTextController.text = widget.viewModel.title ?? "";
  }

  @override
  void dispose() {
    widget.viewModel.initNamingPage();
    titleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext _) {
    initializeDateFormatting();
    return ChangeNotifierProvider<PlanAdditionPageViewModel>.value(
        value: widget.viewModel,
        builder: (BuildContext context, Widget? child) {
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
                              "플랜 이름을\n정해주세요",
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
                              child: Icon(Icons.sticky_note_2_outlined),
                            ),
                            Expanded(
                              child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: "플랜 이름",
                                    border: InputBorder.none,
                                  ),
                                  controller: titleTextController,
                                  onChanged: (value) {
                                    context
                                        .read<PlanAdditionPageViewModel>()
                                        .changeTitle(value);
                                  },
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black)),
                            )
                          ]),
                        ),
                        RowTextField(widgetList: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 10),
                            child: Icon(Icons.list_outlined),
                          ),
                          Expanded(
                            child: TextField(
                                decoration: const InputDecoration(
                                  hintText: "설명(선택)",
                                  border: InputBorder.none,
                                ),
                                controller: context
                                    .read<PlanAdditionPageViewModel>()
                                    .contentTextController,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black)),
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Consumer<PlanAdditionPageViewModel>(builder:
                (BuildContext context, PlanAdditionPageViewModel viewModel,
                    Widget? _) {
              return BottomNavigationButton(
                onPressed: viewModel.enableNextButtonForNaming
                    ? () {
                        context.push("/planCompleteAddition", extra: viewModel);
                      }
                    : null,
                text: "다음",
              );
            }),
          );
        });
  }
}
