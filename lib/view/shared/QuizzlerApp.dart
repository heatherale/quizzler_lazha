import 'package:flutter/material.dart';
import 'package:quizzler/view/shared/CustomRoute.dart';
import 'package:quizzler/view/shared/ThemeCustom.dart';

class QuizzlerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: CustomRoute.generateRoute,
      initialRoute: CustomRoute.HOME_SCREEN,
      theme: themeCustom,
    );
  }
}
