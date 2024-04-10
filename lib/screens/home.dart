import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scorn_clone/view_model/home_page_view_model.dart';
import 'package:scorn_clone/widget/badge_widget.dart';
import 'package:scorn_clone/widget/plan_card_widget.dart';
import 'package:scorn_clone/widget/summary_info_bottom_sheet.dart';
import '../widget/icon_button_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageViewModel>(
      create: (_) => HomePageViewModel(),
      builder: (context, child) {
        return Consumer<HomePageViewModel>(
          builder: (context, homePageViewModel, _) {
            _tabController = TabController(
                length: homePageViewModel.plans.length,
                vsync: this,
                initialIndex: 0);
            return Scaffold(
              appBar: AppBar(
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
                              totalConsumption: context
                                  .read<HomePageViewModel>()
                                  .totalConsumption,
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
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'PretendardBold')),
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
                backgroundColor: Colors.grey[300],
              ),
              backgroundColor: Colors.grey[300],
              body: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: TabBarView(
                      controller: _tabController,
                      children: List<Widget>.generate(
                          homePageViewModel.plans.length,
                          (index) => PlanCardWidget()),
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      child: TabPageSelector(
                        color: Colors.black26,
                        controller: _tabController,
                      ))
                ],
              ),
            );
          },
        );
      },
    );
  }
}
