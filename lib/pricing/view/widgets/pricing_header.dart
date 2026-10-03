import 'package:material_ui/material_ui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// "Pricing" title + carousel dot indicator.
class PricingHeader extends StatelessWidget {
  const PricingHeader({
    super.key,
    required this.currentIndex,
    required this.pageCount,
  });

  final int currentIndex;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .center,
        children: [
          Text('Pricing', style: theme.textTheme.displayMedium),
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: pageCount,
            effect: WormEffect(
              activeDotColor: Colors.amber,
              dotHeight: 4.0,
              spacing: 4.0,
              dotColor: Colors.grey.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
