import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeCustom = ThemeData(
  primaryColor: Color(0xff8D5BE3),
  primaryTextTheme: TextTheme(
    headline6: GoogleFonts.alata(
      color: Colors.white,
      fontWeight: FontWeight.bold
    )
  ),
  unselectedWidgetColor: Colors.grey[800],
);