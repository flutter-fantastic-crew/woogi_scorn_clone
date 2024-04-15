import 'dart:math';

import 'package:flutter/material.dart';

class PieChart extends CustomPainter {
  final int percentage;
  final double textScaleFactor;
  final int budget;
  final int totalExpenses;

  PieChart({
    required this.percentage,
    required this.budget,
    required this.totalExpenses,
    this.textScaleFactor = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 화면에 그릴 paint 정의
    Paint paint = Paint()
      ..color = Colors.grey[400]!
      ..strokeWidth = 12.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // 원의 반지름을 구한다. 선의 굵이에 영향을 받지 않게 보정
    double radius = min(size.width / 2 - paint.strokeWidth / 2,
        size.height / 2 - paint.strokeWidth / 2);

    // 그래프가 가운데로 그려지도록 좌표를 정한다.
    Offset center = Offset(size.width / 2, size.height / 2);

    // 원 그래프를 그린다.
    canvas.drawCircle(center, radius, paint);

    // 호(arc)의 각도를 정한다. 정해진 각도만큼만 그린다.
    double arcAngle = 2 * pi * (percentage / 100.0);

    // 호를 그릴때 색 변경
    paint..color = Colors.deepOrangeAccent;

    // 호(arc)를 그린다.
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paint);

    // 텍스트를 화면에 표시한다.
    drawText(canvas, size, '$totalExpenses원 \n/ $budget원');
  }

  // 원의 중앙에 텍스트를 적는다.
  void drawText(Canvas canvas, Size size, String text) {
    double fontSize = getFontSize(size, text);

    TextSpan sp = TextSpan(
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black),
        text: text);

    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);

    // 필수로 호출해야 한다. 텍스트 페인터에 그려질 텍스트의 크기와 방향을 결정한다.
    tp.layout();

    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height / 2 - tp.height / 2;

    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  // 화면 크기에 비례하도록 텍스트 폰트 크기를 정한다.
  double getFontSize(Size size, String text) {
    return size.width / text.length * textScaleFactor;
  }

  // 다르면 다시 그리도록
  @override
  bool shouldRepaint(PieChart old) {
    return old.percentage != percentage;
  }
}
