import 'package:flutter/material.dart';
import 'package:quizzler/provider/ButtonProvider.dart';
import 'package:quizzler/provider/QuestionProvider.dart';
import 'package:quizzler/provider/TypeProvider.dart';
import 'package:quizzler/view/shared/CustomRoute.dart';
import 'package:quizzler/view/shared/ThemeCustom.dart';
import 'package:provider/provider.dart';

class QuizzlerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ButtonProvider>(create: (_) => ButtonProvider(),),
        ChangeNotifierProvider<QuestionProvider>(create: (_) => QuestionProvider(),),
        ChangeNotifierProvider<TypeProvider>(create: (_) => TypeProvider(),)
      ],
      child: MaterialApp(
        onGenerateRoute: CustomRoute.generateRoute,
        initialRoute: CustomRoute.HOME_SCREEN,
        theme: themeCustom,
      ),
    );
  }
}
