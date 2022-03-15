import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../styles/src/color_set.dart';
import 'theme_provider.dart';

// NOTE: It's base file

class ColorsProvider with ChangeNotifier {
  final ThemeProvider themeProvider;
  ColorsProvider(this.themeProvider);

  ColorSet get colorSet =>
      ColorSetManager(themeProvider.currentThemeMode).colorSet;
}
