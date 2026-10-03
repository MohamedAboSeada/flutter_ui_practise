import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/plan_variant.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/pricing_plan.dart';

/// One row in the feature list: tick / cross icon + label.
///
/// Included rows use green; excluded rows mute to [variant]-aware grey.
class PlanFeatureTile extends StatelessWidget {
  const PlanFeatureTile({
    super.key,
    required this.feature,
    required this.variant,
  });

  final PlanFeature feature;
  final PlanVariant variant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = variant.isDark;
    final muted = isDark
        ? Colors.white.withValues(alpha: 0.38)
        : theme.colorScheme.outline.withValues(alpha: 0.6);

    return ListTile(
      leading: Icon(
        feature.isIncluded ? Iconsax.tick_circle : Iconsax.close_circle_copy,
        color: feature.isIncluded ? Colors.green : muted,
        size: 28.0,
      ),
      contentPadding: .zero,
      horizontalTitleGap: 12.0,
      minTileHeight: 38.0,
      title: Text(
        feature.label,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: feature.isIncluded
              ? (isDark ? Colors.white : theme.colorScheme.onSurface)
              : muted,
        ),
      ),
    );
  }
}
