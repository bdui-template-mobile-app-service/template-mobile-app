import 'package:flutter/material.dart';

import '../arch/storage_manager.dart';
import '../extensions/theme_mode.dart';

// NOTE: It's base file

class ThemeProvider extends ChangeNotifier {
  static const themeModeKey = 'themeMode';

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get rawCurrentThemeMode => _themeMode;

  ThemeMode get currentThemeMode {
    if (_themeMode == ThemeMode.system) {
      return _systemThemeMode;
    }
    return _themeMode;
  }

  ThemeMode get _systemThemeMode =>
      WidgetsBinding.instance?.window.platformBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;

  ThemeProvider() {
    StorageManager.read(themeModeKey).then((value) {
      _themeMode = StringThemeMode.fromString(value as String?);
      notifyListeners();
    });
  }

  void changeBySystem() {
    if (_themeMode != ThemeMode.system) {
      return;
    }
    notifyListeners();
  }

  void setThemeMode(ThemeMode newValue) {
    _themeMode = newValue;
    StorageManager.save(themeModeKey, newValue.stringValue);
    notifyListeners();
  }
}
