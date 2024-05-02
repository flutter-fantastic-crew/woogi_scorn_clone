import 'package:flutter/material.dart';

class RowTextField extends StatelessWidget {
  RowTextField({
    super.key,
    required this.widgetList,
  });
  List<Widget> widgetList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [...widgetList.map((widget) => widget)],
        ),
      ),
    );
  }
}
