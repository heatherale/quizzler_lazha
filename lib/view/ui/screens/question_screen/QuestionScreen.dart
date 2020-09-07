import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/helpers/CirclePainter.dart';
import 'package:quizzler/model/core/Question.dart';
import 'package:quizzler/model/utils/QuestionType.dart';
import 'package:quizzler/provider/QuestionProvider.dart';
import 'package:quizzler/provider/TypeProvider.dart';
import 'package:quizzler/view/shared/CustomRoute.dart';
import 'package:quizzler/view/shared/ThemeCustom.dart';
import 'package:quizzler/view/ui/screens/question_screen/widgets/AnswerButtonsBlock.dart';

class QuestionScreen extends StatefulWidget {

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  @override
  void initState() {
    QuestionType type = Provider.of<TypeProvider>(context, listen: false).type;
    Provider.of<QuestionProvider>(context, listen: false).fetchData(type);
    Provider.of<QuestionProvider>(context, listen: false).setScoreToZero();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(Provider.of<QuestionProvider>(context).currentQuestion==null){
      Navigator.pushNamed(context, CustomRoute.RESULT_PAGE);
      return null;
    }

    else return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: CirclePainter(MediaQuery.of(context).size.width),
                )
              ),
              Text(
                  Provider.of<QuestionProvider>(context).currentQuestion.questionText,
              ),
              AnswerButtonsBlock(Provider.of<QuestionProvider>(context).currentQuestion.answers),
            ],
          )
        ],
      )),
    );
  }
}
