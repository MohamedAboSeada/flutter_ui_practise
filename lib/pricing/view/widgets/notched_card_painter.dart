import 'package:material_ui/material_ui.dart';

class NotchedCardPainter extends CustomPainter {
  final Color fillColor;
  final Gradient? fillGradient;
  final Color strokeColor;

  const NotchedCardPainter({
    this.fillColor = Colors.white,
    this.fillGradient,
    this.strokeColor = const Color(0xFF424242),
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty || !size.width.isFinite || !size.height.isFinite) {
      return;
    }

    final w = size.width;
    final h = size.height;

    final double r = 42.0;
    final double notchWidth = 92.0;
    final double notchHeight = 48.0;
    final double notchRadius = 24.0;

    final borderPaint = Paint()
      ..color = strokeColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()..style = PaintingStyle.fill;
    if (fillGradient != null) {
      fillPaint.shader = fillGradient!.createShader(
        Rect.fromLTWH(0, 0, w, h),
      );
    } else {
      fillPaint.color = fillColor;
    }

    final path = Path();

    path.moveTo(0, r);
    path.quadraticBezierTo(0, 0, r, 0);
    path.lineTo(w - notchWidth - notchRadius, 0);
    path.quadraticBezierTo(w - notchWidth, 0, w - notchWidth, notchRadius);
    path.lineTo(w - notchWidth, notchHeight - notchRadius);
    path.quadraticBezierTo(
      w - notchWidth,
      notchHeight,
      w - notchWidth + notchRadius,
      notchHeight,
    );
    path.lineTo(w - r, notchHeight);
    path.quadraticBezierTo(w, notchHeight, w, notchHeight + r);
    path.lineTo(w, h - r);
    path.quadraticBezierTo(w, h, w - r, h);
    path.lineTo(r, h);
    path.quadraticBezierTo(0, h, 0, h - r);
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant NotchedCardPainter oldDelegate) {
    return oldDelegate.fillColor != fillColor ||
        oldDelegate.fillGradient != fillGradient ||
        oldDelegate.strokeColor != strokeColor;
  }
}
