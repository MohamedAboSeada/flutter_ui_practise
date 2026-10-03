import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

/// Background pattern rendered on a [StyledCard]'s outer container.
///
/// Stored on [PricingPlan] (enum → const-friendly) and resolved to a painter
/// by [StyledCard].
enum ContainerPattern {
  none,
  diagonalLines,
}

/// Diagonal pinstripe pattern painted over the container fill.
///
/// Draws evenly spaced 45° lines (bottom-left to top-right) in [color] at
/// [opacity]. [spacing] is the perpendicular gap between lines.
/// Fully deterministic — no randomness, so repaints are stable.
class DiagonalLinesPatternPainter extends CustomPainter {
  const DiagonalLinesPatternPainter({
    this.color = const Color(0xFF111012),
    this.opacity = 0.2,
    this.spacing = 18.0,
    this.strokeWidth = 1.5,
  });

  final Color color;
  final double opacity;
  final double spacing;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty || !size.width.isFinite || !size.height.isFinite) {
      return;
    }

    final paint = Paint()
      ..color = color.withValues(alpha: opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Lines of constant (x + y): step along c by spacing * sqrt(2) so the
    // perpendicular gap between lines equals [spacing]. Overshoot on both
    // ends (clipped by the canvas) so no edge is left uncovered.
    final step = spacing * math.sqrt2;
    for (var c = -step; c < size.width + size.height + step; c += step) {
      canvas.drawLine(
        Offset(c, -strokeWidth),
        Offset(c - size.height, size.height + strokeWidth),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant DiagonalLinesPatternPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.opacity != opacity ||
        oldDelegate.spacing != spacing ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
