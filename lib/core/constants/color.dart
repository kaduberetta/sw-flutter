import 'package:flutter/painting.dart';

class ColorPalette {
  static bool get isDarkMode => false;

  static Color get background => isDarkMode ? DarkPalette.background : LightPalette.background;
  static Color get backgroundLight =>
      isDarkMode ? DarkPalette.backgroundLight : LightPalette.backgroundLight;
  static Color get backgroundDark =>
      isDarkMode ? DarkPalette.backgroundDark : LightPalette.backgroundDark;

  static Color get border => isDarkMode ? DarkPalette.border : LightPalette.border;

  static Color get disabled => isDarkMode ? DarkPalette.disabled : LightPalette.disabled;

  static Color get primary => isDarkMode ? DarkPalette.primary : LightPalette.primary;
  static Color get secondary => isDarkMode ? DarkPalette.secondary : LightPalette.secondary;

  static Color get warning => isDarkMode ? DarkPalette.warning : LightPalette.warning;
  static Color get success => isDarkMode ? DarkPalette.success : LightPalette.success;
  static Color get danger => isDarkMode ? DarkPalette.danger : LightPalette.danger;
  static Color get info => isDarkMode ? DarkPalette.info : LightPalette.info;

  static Color get text => isDarkMode ? DarkPalette.text : LightPalette.text;
  static Color get textContrast =>
      isDarkMode ? DarkPalette.textContrast : LightPalette.textContrast;
}

class LightPalette {
  static const Color background = Color(0XFFFFFFFF);
  static const Color backgroundLight = Color(0XFFF5F5F5);
  static const Color backgroundDark = Color(0XFFE0E0E0);

  static const Color border = Color(0XFFCCCCCC);

  static const Color disabled = Color(0XFFD1D1D1);

  static const Color primary = Color(0XFF46068E);
  static const Color secondary = Color(0XFFFD3269);

  static const Color warning = Color(0XFFE5D549);
  static const Color success = Color(0XFF51BF47);
  static const Color danger = Color(0XFFE02020);
  static const Color info = Color(0XFF4A90E2);

  static const Color text = Color(0XFF000000);
  static const Color textContrast = Color(0XFF444444);
}

class DarkPalette {
  static const Color background = Color(0XFF192534);
  static const Color backgroundLight = Color(0XFF1F2C3D);
  static const Color backgroundDark = Color(0XFF0E1B2E);

  static const Color border = Color(0XFF444444);

  static const Color disabled = Color(0XFFD1D1D1);

  static const Color primary = Color(0XFF15234F);
  static const Color secondary = Color(0XFFFF8C00);

  static const Color warning = Color(0XFFE5D549);
  static const Color success = Color(0XFF51BF47);
  static const Color danger = Color(0XFFE02020);
  static const Color info = Color(0XFF4A90E2);

  static const Color text = Color(0XFFFFFFFF);
  static const Color textContrast = Color(0XFF888888);
}
