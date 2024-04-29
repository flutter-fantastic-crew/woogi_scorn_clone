import 'package:flutter/material.dart';

class RowTextField extends StatelessWidget {
  RowTextField({
    super.key,
    required this.widgetList,
  });
  List<Widget> widgetList = [];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [...widgetList.map((widget) => widget)],
    );
  }
}
