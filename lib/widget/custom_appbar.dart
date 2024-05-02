import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scorn_clone/widget/summary_info_bottom_sheet.dart';

import '../view_model/home_page_view_model.dart';
import 'badge_widget.dart';
import 'icon_button_widget.dart';

class CustomAppbar extends AppBar {
  BuildContext context;
  Color? backGroundColor;

  CustomAppbar({
    super.key,
    required this.context,
    this.backGroundColor,
  }) : super(
          title: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  // scrollControlDisabledMaxHeightRatio: 0.88,
                  builder: (_) {
                    return FractionallySizedBox(
                      heightFactor: 0.88,
                      child: SummaryInfoBottomSheet(
                        totalConsumption:
                            context.read<HomePageViewModel>().totalConsumption,
                        totalIncome:
                            context.read<HomePageViewModel>().totalIncome,
                        planList: context.read<HomePageViewModel>().plans,
                      ),
                    );
                  });
            },
            child: Row(children: [
              const Padding(
                padding: EdgeInsets.only(right: 11),
                child: Text("내 플랜",
                    style:
                        TextStyle(fontSize: 18, fontFamily: 'PretendardBold')),
              ),
              BadgeWidget(
                badgeText: "요약",
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                onTap: () {},
              )
            ]),
          ),
          actions: [
            IconButtonWidget(
                iconSize: 20,
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.add,
                  color: Colors.grey,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: IconButtonWidget(
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  )),
            )
          ],
          backgroundColor: backGroundColor ?? Colors.grey[100],
        );
}
