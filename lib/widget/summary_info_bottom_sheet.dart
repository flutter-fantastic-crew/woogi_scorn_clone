import 'package:flutter/material.dart';

class SummaryInfoBottomSheet extends StatelessWidget {
  const SummaryInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              width: 45,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '요약',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'PretendardBold'),
              ),
              Text(
                '대한민국 - 원 v',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("총 소비",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontFamily: 'PretendardMedium',
                                )),
                            Text("20원",
                                style: TextStyle(
                                  fontFamily: 'PretendardBold',
                                )),
                          ],
                        ),
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("총 소비",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontFamily: 'PretendardMedium',
                                )),
                            Text("20원",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'PretendardBold',
                                )),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
