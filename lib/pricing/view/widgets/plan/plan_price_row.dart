import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/plan_variant.dart';

/// Price line: strikethrough original + current price + period info.
///
/// Takes raw [double] amounts and formats them via [currencyFormat], so
/// callers can inject their own `NumberFormat` (locale, symbol, decimals).
/// Colors switch on [variant]: muted greys on light, white-based on dark.
class PlanPriceRow extends StatelessWidget {
  const PlanPriceRow({
    super.key,
    required this.price,
    required this.period,
    required this.billedYearly,
    required this.variant,
    this.originalPrice,
    this.currencyFormat,
  });

  final double? originalPrice;
  final double price;
  final String period;
  final double billedYearly;
  final PlanVariant variant;

  /// Formatter for all amounts. Defaults to `$` with no decimals.
  /// Pass your own `NumberFormat` to customize (e.g. locale/cents).
  final NumberFormat? currencyFormat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = variant.isDark;
    final priceFont = GoogleFonts.ebGaramond().fontFamily;
    final subColor = isDark
        ? Colors.white.withValues(alpha: 0.6)
        : theme.colorScheme.onSurface.withValues(alpha: 0.6);
    final currencyFormatter =
        currencyFormat ?? NumberFormat.currency(symbol: r'$', decimalDigits: 0);

    return FittedBox(
      child: Row(
        children: [
          if (originalPrice != null) ...[
            Text(
              currencyFormatter.format(originalPrice!),
              style: theme.textTheme.displayLarge?.copyWith(
                fontFamily: priceFont,
                decoration: .lineThrough,
                decorationColor: isDark ? Colors.white38 : Colors.grey,
                color: isDark ? Colors.white38 : Colors.grey,
              ),
            ),
            const SizedBox(width: 12.0),
          ],
          Text(
            currencyFormatter.format(price),
            style: theme.textTheme.displayLarge?.copyWith(
              fontFamily: priceFont,
              color: isDark ? Colors.white : null,
            ),
          ),
          const SizedBox(width: 12.0),
          Column(
            spacing: 4.0,
            crossAxisAlignment: .start,
            children: [
              Text(
                period,
                style: theme.textTheme.bodyLarge?.copyWith(color: subColor),
              ),
              Text(
                '${currencyFormatter.format(billedYearly)} billed yearly',
                style: theme.textTheme.bodyLarge?.copyWith(color: subColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
