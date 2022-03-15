import 'package:flutter/material.dart';

// NOTE: It's base file

extension BrightnessToThemeMode on Brightness {
  ThemeMode get themeMode {
    switch (this) {
      case Brightness.light:
        return ThemeMode.light;
      case Brightness.dark:
        return ThemeMode.dark;
    }
  }
}

extension StringThemeMode on ThemeMode {
  static const lightString = 'ThemeMode.light';
  static const darkString = 'ThemeMode.dark';
  static const systemString = 'ThemeMode.system';

  String get stringValue {
    switch (this) {
      case ThemeMode.light:
        return lightString;
      case ThemeMode.dark:
        return darkString;
      case ThemeMode.system:
        return systemString;
    }
  }

  static ThemeMode fromString(String? string) {
    switch (string) {
      case lightString:
        return ThemeMode.light;
      case darkString:
        return ThemeMode.dark;
      case systemString:
      default:
        return ThemeMode.system;
    }
  }
}
