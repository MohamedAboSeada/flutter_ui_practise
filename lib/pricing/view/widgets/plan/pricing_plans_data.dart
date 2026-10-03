import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/plan_variant.dart';
import 'package:pricing_screen/pricing/view/widgets/plan/pricing_plan.dart';
import 'package:pricing_screen/pricing/view/widgets/diagonal_pattern.dart';

const _basicFeatures = [
  PlanFeature(label: 'Access to core HR features', isIncluded: true),
  PlanFeature(label: 'Employee record management', isIncluded: true),
  PlanFeature(label: 'Basic reporting tools', isIncluded: true),
  PlanFeature(label: 'Manage up to 10 team members', isIncluded: true),
  PlanFeature(label: 'Track employee attendance', isIncluded: false),
  PlanFeature(label: 'Assign and monitor tasks', isIncluded: false),
  PlanFeature(label: 'Email support', isIncluded: false),
  PlanFeature(label: 'Simple onboarding process', isIncluded: false),
  PlanFeature(label: 'Designed user-focused interfaces', isIncluded: false),
];

/// Demo data wiring each carousel page to a [PlanVariant].
///
/// Page 2 uses [PlanVariant.dark]; pages 1 and 3 use [PlanVariant.light].
const demoPlans = [
  PricingPlan(
    title: 'Basic Plan',
    originalPrice: 170,
    price: 17,
    period: '/ Month(USD)',
    billedYearly: 228,
    description: 'Get started with essential tools to manage your team efficiently. Ideal for small teams with fundamental needs',
    features: _basicFeatures,
    ctaLabel: 'Cancel',
    badgeLabel: 'Active',
    badgeDot: Colors.amberAccent,
    strokeColor: Colors.black26,
  ),
  PricingPlan(
    title: 'Pro Plan',
    originalPrice: 320,
    price: 29,
    period: '/ Month(USD)',
    billedYearly: 348,
    description: 'Unlock advanced tools and analytics to scale your team with confidence and speed.',
    features: _basicFeatures,
    ctaLabel: 'Start 7-days free trial',
    badgeLabel: 'Save 28%',
    badgeDot: Color(0xFF212121),
    badgeText: Color(0xFF212121),
    containerFill: Color(0xFFFFD54D),
    containerPattern: ContainerPattern.diagonalLines,
    cardFill: Color(0xFF212121),
    cardGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF373737), Color(0xFF101010)],
    ),
  ),
  PricingPlan(
    title: 'Team Plan',
    originalPrice: 520,
    price: 49,
    period: '/ Month(USD)',
    billedYearly: 588,
    description: 'Everything your growing organization needs with priority support and custom onboarding.',
    features: _basicFeatures,
    ctaLabel: 'Contact Sales',
    badgeLabel: 'Popular',
    badgeDot: Color(0xFF66BB6A),
    cardFill: Color(0xB3FFFFFF),
    cardGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.white, Color.fromARGB(255, 251, 241, 213)],
    ),
  ),
];

/// Variant per carousel page, kept next to the data so the screen stays dumb.
const demoPlanVariants = [
  PlanVariant.light,
  PlanVariant.dark,
  PlanVariant.light,
];
