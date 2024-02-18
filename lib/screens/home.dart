import 'package:flutter/material.dart';
import 'package:scorn_clone/widget/badge_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            const Padding(
              padding: EdgeInsets.only(right: 11),
              child: Text("내 플랜",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            BadgeWidget(
              badgeText: "요약",
              backgroundColor: Colors.grey,
              textColor: Colors.white,
            )
          ]),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.grey,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ))
          ],
        ),
        body: Container());
  }
}
