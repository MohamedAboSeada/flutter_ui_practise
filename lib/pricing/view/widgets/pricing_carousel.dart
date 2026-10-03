import 'package:carousel_slider/carousel_slider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/plan_card_content.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/plan_variant.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/pricing_plan.dart';
import 'package:pricing_screen/pricing/view/widgets/plan_badge.dart';
import 'package:pricing_screen/pricing/view/widgets/styled_card.dart';

/// Full-width carousel of pricing cards.
///
/// Maps each [plans]/[variants] entry to a [StyledCard] + [PlanBadge] +
/// [PlanCardContent] so the screen never builds card internals directly.
class PricingCarousel extends StatelessWidget {
  const PricingCarousel({
    super.key,
    required this.plans,
    required this.variants,
    required this.onPageChanged,
  });

  final List<PricingPlan> plans;
  final List<PlanVariant> variants;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        for (var i = 0; i < plans.length; i++)
          StyledCard(
            containerFill: plans[i].containerFill,
            containerGradient: plans[i].containerGradient,
            containerImage: plans[i].containerImage,
            containerPattern: plans[i].containerPattern,
            cardFill: plans[i].cardFill,
            cardGradient: plans[i].cardGradient,
            strokeColor: plans[i].strokeColor,
            badge: PlanBadge(
              label: plans[i].badgeLabel,
              dotColor: plans[i].badgeDot,
              textColor:
                  plans[i].badgeText ??
                  (variants[i].isDark ? Colors.white : null),
              backgroundColor: plans[i].badgeBackground,
            ),
            content: PlanCardContent(plan: plans[i], variant: variants[i]),
          ),
      ],
      options: CarouselOptions(
        disableCenter: true,
        enableInfiniteScroll: false,
        viewportFraction: 1.0,
        height: double.infinity,
        onPageChanged: (index, _) => onPageChanged(index),
      ),
    );
  }
}
