library dashed_outline;

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

enum BorderType { Rect, RRect, Circle, Oval }

class DashedOutline extends StatelessWidget {
  final Widget child;
  final Color color;
  final double strokeWidth;
  final double radius;
  final List<double> dashPattern;
  final BorderType borderType;

  const DashedOutline({
    super.key,
    required this.child,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.radius = 0.0,
    this.dashPattern = const [5, 3],
    this.borderType = BorderType.Rect,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: color,
        strokeWidth: strokeWidth,
        radius: radius,
        dashPattern: dashPattern,
        borderType: borderType,
      ),
      child: child,
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double radius;
  final List<double> dashPattern;
  final BorderType borderType;

  _DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.radius,
    required this.dashPattern,
    required this.borderType,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Path path;
    switch (borderType) {
      case BorderType.RRect:
        path = Path()..addRRect(RRect.fromRectXY(Rect.fromLTWH(0, 0, size.width, size.height), radius, radius));
        break;
      case BorderType.Circle:
        path = Path()..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
        break;
      case BorderType.Oval:
        path = Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));
        break;
      case BorderType.Rect:
      default:
        path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    }

    canvas.drawPath(dashPath(path, dashArray: CircularIntervalList(dashPattern)), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
