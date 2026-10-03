import 'package:material_ui/material_ui.dart';

/// Small status pill rendered inside the card notch.
///
/// Keeps the 92x48 notch geometry in sync: [StyledCard] sizes this to
/// `SizedBox(width: 92, height: 48)`.
class PlanBadge extends StatelessWidget {
  const PlanBadge({
    super.key,
    required this.label,
    required this.dotColor,
    this.textColor,
    this.backgroundColor,
  });

  final String label;
  final Color dotColor;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: backgroundColor,
      alignment: .center,
      child: Row(
        spacing: 8.0,
        mainAxisAlignment: .center,
        children: [
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(color: textColor),
          ),
          CircleAvatar(radius: 4.0, backgroundColor: dotColor),
        ],
      ),
    );
  }
}
