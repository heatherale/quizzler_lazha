import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeCustom = ThemeData(
  primaryColor: Color(0xff8D5BE3),
  primaryTextTheme: TextTheme(
      headline6:
          GoogleFonts.alata(color: Colors.white, fontWeight: FontWeight.bold)),
  unselectedWidgetColor: Colors.grey[800],
);

class CustomTextStyles {
  static TextStyle styleForCourseTypeTile = GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: CustomColors.courseTitleColor.withOpacity(0.9),
      fontSize: 20.0);

  static TextStyle loadingBlockStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold));

  static TextStyle questionPageCommonStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold));
}

class CustomColors {
  static Color courseTitleColor = Color(0xff757575);
  static Color backgroundColor = Color(0xfff4f4f4);
  static Color secondGradientColor = Color(0xff7B1FA2);
}
