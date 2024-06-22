import 'dart:math';

import 'package:flutter/material.dart';

class ViCircularProgressIndicator extends StatelessWidget {
  final double value;
  final double size;

  ViCircularProgressIndicator({required this.value, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CircularProgressPainter(value),
        child: Center(
          child: Text(
            '${(value * 100).toInt()}%', // Display percentage
            style: TextStyle(
              fontSize: size *
                  0.2, // Adjusts the font size based on the size of the indicator
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
      ..color = Colors.grey
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Paint foregroundPaint = Paint()
      ..color = Colors.red
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
