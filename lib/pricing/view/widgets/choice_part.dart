import 'package:material_ui/material_ui.dart';

class const ChoicePart({
  super.key,
  required this.isAnnual,
  required this.changeChoice,
  required this.value,
  required this.label,
}) extends StatelessWidget {
  final bool isAnnual;
  final VoidCallback changeChoice;
  final bool value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.0,
      width: 84.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          borderRadius: .circular(999.0),
          onTap: changeChoice,
          child: Center(
            child: AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 100),
              style: TextStyle(
                color: value == isAnnual ? Colors.white : Colors.grey.shade900,
                fontSize: 16.0,
                fontWeight: .w300,
              ),
              child: Text(label),
            ),
          ),
        ),
      ),
    );
  }
}
