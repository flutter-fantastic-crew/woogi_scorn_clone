import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: badgeWidget());
  }

  Widget badgeWidget() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.grey),
        height: 66,
        child: const Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 3),
          child: Text(
            "요약",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
