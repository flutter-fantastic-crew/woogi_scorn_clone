import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scorn_clone/entity/plan_entity.dart';

import 'circular_inner_plan_type_info.dart';
import 'circular_inner_remaining_time.dart';

class PlanTypeCircularIndicator extends StatefulWidget {
  final PlanEntity plan;

  const PlanTypeCircularIndicator({super.key, required this.plan});

  @override
  State<StatefulWidget> createState() => _PlanTypeCircularIndicatorState();
}

class _PlanTypeCircularIndicatorState extends State<PlanTypeCircularIndicator> {
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
        radius: 100,
        lineWidth: _isPressed ? 4 : 1.5,
        percent: percent < 0 ? 0 : percent,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: const Color(0xFFF2F2F2),
        backgroundColor: Colors.transparent,
        widgetIndicator: GestureDetector(
          onTap: () {
            setState(() {
              _isPressed = !_isPressed;
            });
          },
          child: Center(
            child: Container(
              width: 14,
              height: 14,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
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
            ),
          ),
        ),
        animation: true,
        center: CircularPercentIndicator(
          radius: 90,
          lineWidth: 12,
          percent: widget.plan.remainAmount / (widget.plan.budget ?? 1),
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: const Color(0xFFF2F2F2),
          progressColor: _isPressed || percent < 0
              ? const Color(0xFFD5D5D5)
              : const Color(0xFF1773FC),
          animation: true,
          // TODO : animation 추가
          center: _isPressed
              ? CircularInnerRemainingTime(
                  startDate: widget.plan.planStartDate,
                  endDate: widget.plan.planEndDate)
              : CircularInnerPlanTypeInfo(
                  remainAmount: widget.plan.remainAmount,
                  totalAmount: widget.plan.budget ?? 1),
        ));
  }
}
