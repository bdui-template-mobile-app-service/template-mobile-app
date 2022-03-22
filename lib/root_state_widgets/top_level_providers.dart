import 'package:flutter/widgets.dart';
import 'package:graduate_work/providers/card_provider.dart';
import 'package:provider/provider.dart';

import '../providers/colors_provider.dart';
import '../providers/theme_provider.dart';

// NOTE: It's base file

class TopLevelProviders extends StatelessWidget {
  final Widget child;

  const TopLevelProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProxyProvider<ThemeProvider, ColorsProvider>(
          create: (context) => ColorsProvider(context.read<ThemeProvider>()),
          update: (context, themeProvider, _) => ColorsProvider(themeProvider),
        ),
        // Not base providers
        ChangeNotifierProvider(create: (_) => CardProvider()),
      ],
      child: child,
    );
  }
}
