// import 'package:flutter/material.dart';

// class KColor {
//   KColor._();
//   static const Color bodyBackground = Color(0xFFF1F7FF);

//   /* ------------------------------- Font Colors ------------------------------ */
//   static const Color headingText = Color(0xFF000000);
//   static const Color subHeadingText = Color(0xFF1A1A1A);
//   static const Color bodyText = Color(0xFF4F4F4F);

//   /* ------------------------------- Button Colors ------------------------------ */

//   /* ------------------------------- Icon Colors ------------------------------ */
//   static const Color blackIcon = Color(0xFF000000);
//   static const Color whiteIcon = Color(0xFFFFFFFF);
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppColor {
  AppColor._();
  // the syntax of a color will be followed by: what is the color for + which part of the app it is used (if applicable) + the color name
  static const Color bodyBg = Color(0xFFF1F7FF);
  static const Color cardBgW = Color(0xFFFFFFFF);
  static const Color cardBgB = Color(0xFF1F2022);
  static Color cardBgRThick = const Color(0xFFE22727).withOpacity(0.8);
  static Color cardBgRThin = const Color(0xFFD92525).withOpacity(0);
  static Color cardBorder = const Color(0xFF4671FC).withOpacity(0.2);

  /* ------------------------------- Navigation Bar Colors ------------------------------ */
  static Color navBarBg = const Color(0xFFFFFFFF);
  static Color navBarBorder = const Color(0xFFE8EEF6);
  static Color navBarShadow = const Color(0xFF000000).withOpacity(0.15);
  static Color navBarIconG = const Color(0xFF000000).withOpacity(0.4);
  static Color navBarIconR = const Color(0xFFFF002B);
  static Color navBarTextG = const Color(0xFF000000).withOpacity(0.4);
  static Color navBarTextR = const Color(0xFFFF002B);

  /* ------------------------------- Font Colors ------------------------------ */
  static const Color headingText = Color(0xFF000000);
  static const Color subHeadingTextB = Color(0xFF1A1A1A);
  static const Color subHeadingTextW = Color(0xFFFFFFFF);
  static Color mutedTextW = const Color(0xFFFFFFFF).withOpacity(0.6);
  static Color mutedTextB = const Color(0xFF000000).withOpacity(0.5);
  static const Color bodyText = Color(0xFF1F2022);

  /* ------------------------------- Button Colors ------------------------------ */
  static const Color buttonBgW = Color(0xFFFFFFFF);
  static const Color buttonTextB = Color(0xFF000000);
  static const Color textButtonR = Color(0xFFFF002B);

  /* ------------------------------- Icon Colors ------------------------------ */
  static const Color iconB = Color(0xFF000000);
  static const Color iconW = Color(0xFFFFFFFF);
  static const Color iconR = Color(0xFFFF002B);
  static Color iconG = const Color(0xFF000000).withOpacity(0.4);
}
