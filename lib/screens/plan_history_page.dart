import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scorn_clone/widget/row_text_field.dart';

class PlanHistoryPage extends StatelessWidget {
  const PlanHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            RowTextField(widgetList: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
              Text("소비 금액"),
              Text("원"),
            ]),
          ],
        ),
        ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            minimumSize: Size(700, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text("저장",
              style: TextStyle(fontSize: 18, fontFamily: 'PretendardBold')),
        ),
      ],
    );
  }
}
