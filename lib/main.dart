import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/model/services/question_service.dart';
import 'package:quizzler/provider/button_provider.dart';
import 'package:quizzler/provider/question_provider.dart';
import 'package:quizzler/view/shared/custom_route.dart';
import 'package:quizzler/view/shared/theme_custom.dart';


void main() => runApp(QuizzlerApp());

class QuizzlerApp extends StatelessWidget {

  final QuestionService questionService = QuestionService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ButtonProvider>(create: (_) => ButtonProvider(),),
        ChangeNotifierProvider<QuestionProvider>(create: (_) => QuestionProvider(questionService),),
      ],
      child: MaterialApp(
        onGenerateRoute: CustomRoute.generateRoute,
        initialRoute: CustomRoute.HOME_SCREEN,
        theme: themeCustom,
      ),
    );
  }
}
