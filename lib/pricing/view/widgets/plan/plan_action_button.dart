import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/plan_variant.dart';

/// Bottom CTA button of a plan card.
///
/// Light: white button on light card. Dark: amber button on dark card.
class PlanActionButton extends StatelessWidget {
  const PlanActionButton({
    super.key,
    required this.label,
    required this.variant,
    required this.onPressed,
  });

  final String label;
  final PlanVariant variant;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: variant.isDark ? Colors.amberAccent : Colors.white,
          foregroundColor: Colors.grey.shade900,
          minimumSize: const Size(0, 48.0),
          textStyle: theme.textTheme.labelLarge?.copyWith(fontWeight: .bold),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
