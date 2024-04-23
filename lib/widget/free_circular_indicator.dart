import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scorn_clone/entity/plan_data_entity.dart';

import '../util/number_util.dart';

class FreeCircularIndicator extends StatelessWidget {
  final PlanDataEntity plan;

  const FreeCircularIndicator({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    final double percent =
        DateTime.now().difference(plan.planEndDate).inDays.toDouble() /
            plan.planStartDate.difference(plan.planEndDate).inDays.toDouble();

    return CircularPercentIndicator(
      radius: 90,
      lineWidth: 1.5,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.black,
      widgetIndicator: Center(
        child: Container(
          width: 14,
          height: 14,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Transform.rotate(
            angle: radians(-360 * percent).toDouble(),
            child: SvgPicture.asset(
              'assets/icons/timer.svg',
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
          ),
        ),
      ),
      animation: true,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '소비 금액',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${thousandWon(plan.totalExpenses)}원',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '${thousandWon(plan.budget ?? 0)}원',
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
