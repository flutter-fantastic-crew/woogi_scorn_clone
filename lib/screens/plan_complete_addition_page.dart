import 'package:flutter/material.dart';

import '../util/number_util.dart';
import '../view_model/plan_addition_page_view_model.dart';
import '../widget/custom_appbar.dart';

class PlanCompleteAdditionPage extends StatelessWidget {
  PlanCompleteAdditionPage({super.key, required this.viewModel});

  PlanAdditionPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        context: context,
        backGroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent[100],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shop_2_outlined,
                        color: Colors.white,
                        size: 50,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  viewModel.title ?? "",
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'PretendardRegular',
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  viewModel.contentTextController.text,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'PretendardRegular',
                      color: Colors.grey[500]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${thousandWon(viewModel.amount ?? 0)} 원",
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'PretendardRegular',
                      color: Colors.blueAccent),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "대한민국 - 원",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'PretendardRegular',
                          color: Colors.grey[500]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  viewModel.dateTextController.text,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'PretendardRegular',
                      color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            viewModel.getPlanDataEntity;
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            disabledBackgroundColor: Colors.blueAccent[100],
            minimumSize: const Size(700, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text("플랜 시작",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'PretendardBold',
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
