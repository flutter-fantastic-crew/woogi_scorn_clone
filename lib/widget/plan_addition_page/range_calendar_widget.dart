import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import '../../view_model/range_calendar_view_model.dart';

class RangeCalendarWidget extends StatelessWidget {
  RangeCalendarWidget({
    super.key,
    required this.rangeMode,
    this.showBottomButton = false,
  });

  bool rangeMode;
  bool showBottomButton;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RangeCalendarViewModel(),
        builder: (context, child) {
          CleanCalendarController calendarController = CleanCalendarController(
            minDate: DateTime.now().subtract(const Duration(days: 100)),
            maxDate: DateTime.now().add(const Duration(days: 365)),
            weekdayStart: DateTime.monday,
            onRangeSelected: (DateTime startDate, DateTime? endDate) {
              if (rangeMode) {
                if (endDate != null) {
                  context
                      .read<RangeCalendarViewModel>()
                      .changeStartDate(startDate);
                  context.read<RangeCalendarViewModel>().changeEndDate(endDate);
                }
              }
            },
            rangeMode: rangeMode,
            onDayTapped: (date) {
              if (!rangeMode) {
                context.read<RangeCalendarViewModel>().changeStartDate(date);
                context.read<RangeCalendarViewModel>().changeEndDate(date);
                Navigator.of(context).pop(
                    context.read<RangeCalendarViewModel>().selectedDateRecords);
              }
            },
          );

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 400,
                  child: ScrollableCleanCalendar(
                    calendarController: calendarController,
                    layout: Layout.BEAUTY,
                    calendarCrossAxisSpacing: 0,
                  ),
                ),
                Visibility(
                  visible: showBottomButton,
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        const SizedBox(width: 30),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              calendarController.jumpToMonth(
                                  date: DateTime.now(), alignment: 0);
                            },
                            child: Text("오늘로 이동",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'PretendardRegular',
                                    color: Colors.grey[500],
                                    decoration: TextDecoration.underline)),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Consumer<RangeCalendarViewModel>(builder:
                              (BuildContext context,
                                  RangeCalendarViewModel viewModel, Widget? _) {
                            return ElevatedButton(
                              onPressed: viewModel.enableCalendarSelectButton
                                  ? () => Navigator.of(context)
                                      .pop(viewModel.selectedDateRecords)
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                foregroundColor: Colors.white,
                                disabledBackgroundColor: Colors.blueAccent[100],
                                minimumSize: Size(700, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text("선택",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'PretendardBold',
                                    color: Colors.white,
                                  )),
                            );
                          }),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
