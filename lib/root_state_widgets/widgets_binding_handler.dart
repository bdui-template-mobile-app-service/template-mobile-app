import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

// NOTE: It's base file

class WidgetsBindingHandler extends StatelessWidget {
  final Widget child;
  const WidgetsBindingHandler({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listen platform theme changed
    WidgetsBinding.instance?.window.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance?.handlePlatformBrightnessChanged();
      context.read<ThemeProvider>().changeBySystem();
    };

    return child;
  }
}
