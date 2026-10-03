import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/pricing/view/widgets/range_selection.dart';

class PricingAppBar extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        IconButton.filled(
          style: IconButton.styleFrom(
            minimumSize: Size(42.0, 42.0),
            backgroundColor: Colors.grey.shade200,
            foregroundColor: Colors.grey.shade900,
          ),
          onPressed: () {},
          icon: Icon(Iconsax.arrow_left_2_copy),
        ),

        RangeSelection(),
      ],
    );
  }
}
