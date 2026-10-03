import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/pricing/view/widgets/diagonal_pattern.dart';

/// Single bullet inside a plan's feature list.
class PlanFeature {
  const PlanFeature({required this.label, required this.isIncluded});

  final String label;
  final bool isIncluded;
}

/// Data describing one pricing card.
class PricingPlan {
  const PricingPlan({
    required this.title,
    required this.price,
    required this.period,
    required this.billedYearly,
    required this.description,
    required this.features,
    required this.ctaLabel,
    required this.badgeLabel,
    required this.badgeDot,
    this.badgeText,
    this.badgeBackground,
    this.originalPrice,
    this.containerFill,
    this.containerGradient,
    this.containerImage,
    this.containerPattern = ContainerPattern.none,
    this.cardFill,
    this.cardGradient,
    this.strokeColor,
  });

  final String title;
  final double? originalPrice;
  final double price;
  final String period;
  final double billedYearly;
  final String description;
  final List<PlanFeature> features;
  final String ctaLabel;

  /// Badge shown in the card notch.
  final String badgeLabel;
  final Color badgeDot;
  final Color? badgeText;
  final Color? badgeBackground;

  /// [StyledCard] fills for this plan. Set a flat color, a gradient, a
  /// tiled pattern image ([containerImage], e.g. `DecorationImage` with
  /// `repeat: ImageRepeat.repeat`), or a painted [containerPattern] such as
  /// [ContainerPattern.topography]; they layer color-beneath-image/pattern.
  final Color? containerFill;
  final Gradient? containerGradient;
  final DecorationImage? containerImage;
  final ContainerPattern containerPattern;
  final Color? cardFill;
  final Gradient? cardGradient;
  final Color? strokeColor;
}
