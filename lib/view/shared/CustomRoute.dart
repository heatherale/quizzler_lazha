import 'package:flutter/material.dart';
import 'file:///E:/flutter_courses/quizzler-flutter/lib/view/ui/screens/home_screen/HomeScreen.dart';

class CustomRoute{

  static const String HOME_SCREEN = '/';
  static const String TRUE_OR_FALSE = 'true_or_false_quiz';
  static const String MULTIPLE_ANSWERS = 'multiple_answers_quiz';
  static const String RESULT_PAGE = 'result_page';

  static Route<dynamic> generateRoute(RouteSettings settings){

    Widget screen;
    final args = settings.arguments;

    switch(settings.name){

      case HOME_SCREEN:
        screen = HomeScreen();
        break;
    }

    return MaterialPageRoute(
      builder: (_) => screen,
    );
  }
}