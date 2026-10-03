import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/pricing/view/widgets/notched_card_painter.dart';
import 'package:pricing_screen/pricing/view/widgets/diagonal_pattern.dart';

/// Notched pricing card shell.
///
/// Paints the card shape via [NotchedCardPainter] and reserves the top-right
/// notch area for a [badge] (see `PlanBadge`).
///
/// The outer container accepts a flat [containerFill], a [containerGradient],
/// or a tiled [containerImage] pattern (e.g. `DecorationImage` with
/// `repeat: ImageRepeat.repeat`). When several are set, they layer as
/// [BoxDecoration] paints them: color beneath, image above.
///
/// [containerPattern] paints a [CustomPainter] motif (e.g. diagonal lines)
/// over the whole container — ring and notch — beneath the card itself.
class StyledCard extends StatelessWidget {
  const StyledCard({
    super.key,
    required this.badge,
    required this.content,
    this.containerFill,
    this.containerGradient,
    this.containerImage,
    this.containerPattern = ContainerPattern.none,
    this.cardFill,
    this.cardGradient,
    this.strokeColor,
  });

  final Widget badge;
  final Widget content;
  final Color? containerFill;
  final Gradient? containerGradient;
  final DecorationImage? containerImage;
  final ContainerPattern containerPattern;
  final Color? cardFill;
  final Gradient? cardGradient;
  final Color? strokeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: .antiAlias,
      margin: .symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: .circular(42.0),
        color: containerFill,
        gradient: containerGradient,
        image: containerImage,
      ),
      child: CustomPaint(
        painter: containerPattern == ContainerPattern.diagonalLines
            ? const DiagonalLinesPatternPainter()
            : null,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: NotchedCardPainter(
                    strokeColor: strokeColor ?? Colors.transparent,
                    fillColor: cardFill ?? Colors.transparent,
                    fillGradient: cardGradient,
                  ),
                  child: content,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SizedBox(width: 92.0, height: 48.0, child: badge),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
