import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static const Color darkBlue = Color(0xFF0371D8);
  static const Color osean = Color(0xFF1DB5E5);
  static const Color blue = Color(0xFF197DDC);
  static const Color lightBlue = Color(0xFFDCEEFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkOrange = Color(0xFFFF6161);
  static const Color orange = Color(0xFFFF8845);
  static const Color mediumOrange = Color(0xFFFFECEC);
  static const Color lightOrange = Color(0xFFFFEFE7);
  static const Color darkRed = Color(0xFFBD251C);
  static const Color red = Color(0xFFD92525);
  static const Color tosca = Color(0xFF8CCC9D);
  static const Color grey = Color(0xFF858585);
  static const Color black = Color(0xFF000000);
  static const Color lightGrey = Color(0xFFFAFAFA);
  static const Color yellow = Color(0xFFFFD233);
  static const Color transparent = Color(0x00000000);
}

ColorScheme AppColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: AppColor.darkBlue,
  onPrimary: AppColor.white,
  secondary: AppColor.grey,
  onSecondary: AppColor.lightOrange,
  error: AppColor.red,
  onError: AppColor.darkRed,
  background: AppColor.blue,
  onBackground: AppColor.lightGrey,
  surface: AppColor.lightGrey,
  onSurface: AppColor.orange,
);

TextStyle AppBasicStyle({
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
  Color fontColor = AppColor.blue,
  FontStyle fontStyle = FontStyle.normal,
  TextAlign textAlign = TextAlign.start,
  double letterSpacing = 0.0,
}) {
  return GoogleFonts.inter(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    color: fontColor,
    letterSpacing: letterSpacing,
  );
}

TextStyle AppTitleHeader = TextStyle(fontSize: 30, color: AppColor.blue);
