import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/pricing_plans_data.dart';
import 'package:pricing_screen/pricing/view/widgets/pricing_app_bar.dart';
import 'package:pricing_screen/pricing/view/widgets/pricing_carousel.dart';
import 'package:pricing_screen/pricing/view/widgets/pricing_header.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  final crrIdx = ValueNotifier<int>(0);

  @override
  void dispose() {
    crrIdx.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/background.jpeg", fit: .cover),
          ),

          // MAIN SCREEN CONTENT
          SafeArea(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: PricingAppBar(),
                ),
                const SizedBox(height: 24.0),
                Expanded(
                  child: Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: crrIdx,
                        builder: (context, value, child) {
                          return PricingHeader(
                            currentIndex: value,
                            pageCount: demoPlans.length,
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Expanded(
                        child: PricingCarousel(
                          plans: demoPlans,
                          variants: demoPlanVariants,
                          onPageChanged: (index) => crrIdx.value = index,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
