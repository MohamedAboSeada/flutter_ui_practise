import 'package:dotted_line/dotted_line.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/plan_action_button.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/plan_feature_list.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/plan_price_row.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/plan_variant.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/pricing_plan.dart';

/// Full body of a pricing card.
///
/// Single widget covering both themes via [variant]:
/// - [PlanVariant.light]: current look (dark text on light card).
/// - [PlanVariant.dark]: white text on dark card, amber CTA.
class PlanCardContent extends StatelessWidget {
  const PlanCardContent({super.key, required this.plan, required this.variant});

  final PricingPlan plan;
  final PlanVariant variant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = variant.isDark;

    final titleColor = isDark ? Colors.white : null;
    final descriptionColor = isDark
        ? Colors.white.withValues(alpha: 0.7)
        : theme.colorScheme.outline.withValues(alpha: 0.8);
    final dividerColor = isDark
        ? Colors.white.withValues(alpha: 0.24)
        : theme.colorScheme.outline.withValues(alpha: 0.4);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const SizedBox(height: 28.0),
          Text(
            plan.title,
            style: theme.textTheme.headlineSmall?.copyWith(color: titleColor),
          ),
          const SizedBox(height: 28.0),
          PlanPriceRow(
            originalPrice: plan.originalPrice,
            price: plan.price,
            period: plan.period,
            billedYearly: plan.billedYearly,
            variant: variant,
          ),
          const SizedBox(height: 14.0),
          Text(
            plan.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: .bold,
              color: descriptionColor,
            ),
          ),
          const SizedBox(height: 28.0),
          DottedLine(dashRadius: 999, dashColor: dividerColor),
          const SizedBox(height: 28.0),
          Expanded(
            child: PlanFeatureList(features: plan.features, variant: variant),
          ),
          const SizedBox(height: 12.0),
          PlanActionButton(
            label: plan.ctaLabel,
            variant: variant,
            onPressed: () {},
          ),
          const SizedBox(height: 18.0),
        ],
      ),
    );
  }
}
