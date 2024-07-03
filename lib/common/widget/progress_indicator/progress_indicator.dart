import 'dart:math';

import 'package:flutter/material.dart';
import 'package:one_note/Util/Constant/colors.dart';

class ViCircularProgressIndicator extends StatelessWidget {
  final double value;
  final double size;

  const ViCircularProgressIndicator(
      {super.key, required this.value, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CircularProgressPainter(value),
        child: Center(
          child: Text(
            '${(value * 100).toInt()}%',
            style: TextStyle(
              color: AppColors.black,
              fontSize: size * 0.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double value;

  _CircularProgressPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 10.0;
    double radius = (size.width / 2) - strokeWidth / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    Paint backgroundPaint = Paint()
      ..color = AppColors.grey
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Paint foregroundPaint = Paint()
      ..color = AppColors.canceled
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);
    double sweepAngle = 2 * pi * value;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
