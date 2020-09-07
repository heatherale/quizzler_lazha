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
  Widget build(BuildContext context) {

    /*WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(Provider.of<QuestionProvider>(context, listen: false).currentQuestion==null){
        Navigator.pushNamed(context, CustomRoute.RESULT_PAGE);
        return null;
      }
    });*/

    QuestionType type = Provider.of<TypeProvider>(context, listen: false).type;
    Provider.of<QuestionProvider>(context, listen: false).setScoreToZero();

    return FutureBuilder<List<Question>>(
      future: Provider.of<QuestionProvider>(context, listen: false).fetchData(type),
      builder: (context, AsyncSnapshot snapshot){
        List<Widget> columnChildren;
        if (!snapshot.hasData) {
          columnChildren = <Widget>[Center(child: CircularProgressIndicator())];
      } else {
        print('QUESTION '+snapshot.data[0].questionText.toString());
        columnChildren = <Widget>[
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
              snapshot.data[0].questionText??'null',
              ),
        ],
        ),
          AnswerButtonsBlock(snapshot.data[0].answers),
        ];
    }
          return SafeArea(
            child: Scaffold(
                body: Column(
                  children: columnChildren
                )),
          );
        }
    );
  }
}
