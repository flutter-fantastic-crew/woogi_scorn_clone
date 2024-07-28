import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scorn_clone/entity/plan_entity.dart';

import 'circular_inner_plan_type_info.dart';
import 'circular_inner_remaining_time.dart';

class FreeTypeCircularIndicator extends StatefulWidget {
  final PlanEntity plan;

  const FreeTypeCircularIndicator({super.key, required this.plan});

  @override
  State<StatefulWidget> createState() => _FreeTypeCircularIndicatorState();
}

class _FreeTypeCircularIndicatorState extends State<FreeTypeCircularIndicator> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final double percent =
        DateTime.now().difference(widget.plan.planEndDate).inDays.toDouble() /
            widget.plan.planStartDate
                .difference(widget.plan.planEndDate)
                .inDays
                .toDouble();
    return CircularPercentIndicator(
      radius: 90,
      lineWidth: _isPressed ? 4 : 1.5,
      backgroundWidth: 1.5,
      percent: percent < 0 ? 0 : percent,
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: const Color(0xFFF2F2F2),
      progressColor: Colors.black,
      widgetIndicator: Align(
        alignment: Alignment.center,
        child: Center(
          child: Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPressed = !_isPressed;
                  });
                },
                child: Transform.rotate(
                  angle: percent < 0 ? 0 : radians(-360 * percent).toDouble(),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPressed = !_isPressed;
                        });
                      },
                      icon: Icon(Icons.timer)),
                ),
              )),
        ),
      ),
      animation: true,
      // TODO : animation 추가
      center: _isPressed
          ? CircularInnerRemainingTime(
              startDate: widget.plan.planStartDate,
              endDate: widget.plan.planEndDate)
          : CircularInnerPlanTypeInfo(
              remainAmount: widget.plan.budget ?? 0,
              totalAmount: widget.plan.totalExpenses),
    );
  }
}
