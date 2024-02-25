import 'package:flutter/material.dart';

class PlanCardWidget extends StatelessWidget {
  const PlanCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Text("*내 플랜*"),
        ),
      ),
    );
  }
}
