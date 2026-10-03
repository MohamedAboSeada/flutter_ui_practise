import 'package:material_ui/material_ui.dart';
import 'package:pricing_screen/core/theme/app_theme.dart';
import 'package:pricing_screen/pricing/view/screen/pricing_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: PricingScreen(),
    );
  }
}
