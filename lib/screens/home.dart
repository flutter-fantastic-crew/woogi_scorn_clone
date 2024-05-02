import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scorn_clone/view_model/home_page_view_model.dart';
import 'package:scorn_clone/widget/plan_card_widget.dart';
import '../widget/custom_appbar.dart';

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
              appBar: CustomAppbar(
                context: context,
              ),
              backgroundColor: Colors.grey[100],
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TabBarView(
                        controller: _tabController,
                        children: List<Widget>.generate(
                            homePageViewModel.plans.length,
                            (index) => PlanCardWidget(
                                  plan: homePageViewModel.plans[index],
                                )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: TabPageSelector(
                      color: Colors.black26,
                      controller: _tabController,
                      indicatorSize: 8,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
