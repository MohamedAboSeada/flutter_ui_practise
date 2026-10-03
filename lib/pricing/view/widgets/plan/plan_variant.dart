/// Light vs dark rendering of a plan card's content.
///
/// Passed as [PlanCardContent.variant] (and down to the small pieces) so a
/// single widget covers both themes without separate classes.
enum PlanVariant {
  light,
  dark;

  bool get isDark => this == PlanVariant.dark;
}
