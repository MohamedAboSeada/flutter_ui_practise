import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/plan_feature_tile.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/plan_variant.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/pricing_plan.dart';

/// Scrollable feature list with fading top/bottom edges.
///
/// Owns its [ScrollController] so each carousel page scrolls independently.
class PlanFeatureList extends StatefulWidget {
  const PlanFeatureList({
    super.key,
    required this.features,
    required this.variant,
  });

  final List<PlanFeature> features;
  final PlanVariant variant;

  @override
  State<PlanFeatureList> createState() => _PlanFeatureListState();
}

class _PlanFeatureListState extends State<PlanFeatureList> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadingEdgeScrollView.fromScrollView(
      gradientFractionOnEnd: 0.4,
      gradientFractionOnStart: 0.4,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.features.length,
        itemBuilder: (context, index) {
          return PlanFeatureTile(
            feature: widget.features[index],
            variant: widget.variant,
          );
        },
      ),
    );
  }
}
