import 'package:flutter/material.dart';
import 'package:quizzler/view/ui/screens/home_screen/home_screen.dart';
import 'package:quizzler/view/ui/screens/question_screen/question_screen.dart';
import 'package:quizzler/view/ui/screens/result_screen/result_screen.dart';
import 'package:quizzler/view/ui/screens/under_construction_screen/under_construction_screen.dart';

class CustomRoute{

  static const String HOME_SCREEN = '/';
  static const String QUESTION_PAGE = '/question_page';
  static const String RESULT_PAGE = '/result_page';
  static const String UNDER_CONSTRUCTION_PAGE = '/under_construction_page';

  static Route<dynamic> generateRoute(RouteSettings settings){

    Widget screen;
    final args = settings.arguments;

    switch(settings.name){

      case HOME_SCREEN:
        screen = HomeScreen();
        break;
      case QUESTION_PAGE:
        screen = QuestionScreen();
        break;
      case RESULT_PAGE:
        screen = ResultScreen();
        break;
      case UNDER_CONSTRUCTION_PAGE:
        screen = UnderConstructionScreen();
        break;
    }

    return MaterialPageRoute(
      builder: (_) => screen,
    );
  }
}