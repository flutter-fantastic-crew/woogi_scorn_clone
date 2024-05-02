import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scorn_clone/widget/row_text_field.dart';

import '../view_model/home_page_view_model.dart';
import '../widget/custom_appbar.dart';

class PlanHistoryPage extends StatelessWidget {
  const PlanHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "소비 금액",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: Text("원",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'PretendardRegular',
                            color: Colors.grey[400])),
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
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "내용",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ]),
                ),
                RowTextField(widgetList: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Icon(Icons.calendar_month),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: DateTime.now().toString(),
                        border: InputBorder.none,
                      ),
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
  }
}
