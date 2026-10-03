import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/pricing/view/widgets/choice_part.dart';

class RangeSelection extends StatefulWidget {
  const new({super.key});

  @override
  State<RangeSelection> createState() => _RangeSelectionState();
}

class _RangeSelectionState extends State<RangeSelection> {
  var isAnnual = false;

  void _toggleSelection(bool value) => setState(() {
    isAnnual = value;
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: .circular(999.0),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            left: isAnnual ? 0.0 : 84.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              height: 42.0,
              width: 84.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(999.0),
              ),
            ),
          ),

          Row(
            children: [
              ChoicePart(
                label: "Annual",
                isAnnual: isAnnual,
                changeChoice: () {
                  _toggleSelection(true);
                },
                value: true,
              ),
              ChoicePart(
                label: "Monthly",
                isAnnual: isAnnual,
                changeChoice: () {
                  _toggleSelection(false);
                },
                value: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
