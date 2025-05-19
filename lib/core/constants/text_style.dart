import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sw_flutter_carlos/core/constants/color.dart';

class AppTextStyle {
  AppTextStyle._();

  // Title

  static TextStyle titleSmall({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.quicksand(height: 1, fontSize: 14, color: color ?? ColorPalette.text, fontWeight: fontWeight ?? FontWeight.w700);

  static TextStyle title({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.quicksand(height: 1, fontSize: 16, color: color ?? ColorPalette.text, fontWeight: fontWeight ?? FontWeight.w700);

  static TextStyle titleMedium({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.quicksand(height: 1, fontSize: 18, color: color ?? ColorPalette.text, fontWeight: fontWeight ?? FontWeight.w700);

  static TextStyle titleLarge({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.quicksand(height: 1, fontSize: 24, color: color ?? ColorPalette.text, fontWeight: fontWeight ?? FontWeight.w700);

  static TextStyle typing({Color? color, FontWeight? fontWeight, double? fontSize}) =>
      GoogleFonts.martianMono(height: 1, fontSize: fontSize ?? 24, color: color ?? ColorPalette.text, fontWeight: fontWeight ?? FontWeight.w300);

  // Body

  static TextStyle bodySmallX({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.quicksand(height: 1.33, fontSize: 12, color: color ?? ColorPalette.text, fontWeight: fontWeight ?? FontWeight.w400);

  static TextStyle bodySmall({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.quicksand(height: 1.33, fontSize: 14, color: color ?? ColorPalette.text, fontWeight: fontWeight ?? FontWeight.w400);

  static TextStyle body({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.quicksand(height: 1.33, fontSize: 16, color: color ?? ColorPalette.text, fontWeight: fontWeight ?? FontWeight.w400);

  static TextStyle bodyMedium({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.quicksand(height: 1.33, fontSize: 18, color: color ?? ColorPalette.text, fontWeight: fontWeight ?? FontWeight.w400);

  static TextStyle bodyLarge({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.quicksand(height: 1.33, fontSize: 24, color: color ?? ColorPalette.text, fontWeight: fontWeight ?? FontWeight.w400);
}
