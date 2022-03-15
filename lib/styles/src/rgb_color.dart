import 'dart:math';

import 'dart:ui';

extension RGBColor on Color {
  static Color fromRGB(int r, int g, int b) => Color.fromARGB(
    255,
    _correctValue(r),
    _correctValue(g),
    _correctValue(b),
  );
  static Color fromHex(String hexColor) => Color(_getColorFromHex(hexColor));

  // MARK: - Private methods
  static int _correctValue(int value) => min(max(0, value), 255);

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
