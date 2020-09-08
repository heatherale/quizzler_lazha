import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/helpers/CirclePainter.dart';
import 'package:quizzler/model/core/Question.dart';
import 'package:quizzler/model/utils/QuestionType.dart';
import 'package:quizzler/provider/ButtonProvider.dart';
import 'package:quizzler/provider/QuestionProvider.dart';
import 'package:quizzler/provider/TypeProvider.dart';
import 'package:quizzler/view/shared/CustomRoute.dart';
import 'package:quizzler/view/shared/ThemeCustom.dart';
import 'package:quizzler/view/ui/screens/question_screen/widgets/AnswerButtonsBlock.dart';
import 'package:quizzler/view/ui/screens/question_screen/widgets/LoadingBlock.dart';

class QuestionScreen extends StatefulWidget {

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {


  @override
  Widget build(BuildContext context) {

    QuestionType type = Provider.of<TypeProvider>(context, listen: false).type;
    Provider.of<QuestionProvider>(context, listen: false).setScoreToZero();

    final double screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<List<Question>>(
      future: Provider.of<QuestionProvider>(context, listen: false).fetchData(type),
      builder: (context, AsyncSnapshot snapshot){
        List<Widget> columnChildren;
        if (!snapshot.hasData) {
          columnChildren = <Widget>[LoadingBlock()];
      } else {
        columnChildren = <Widget>[
          AppBar(
            title: Text(
                'Question '+ (Provider.of<QuestionProvider>(context).currentIndex+1).toString()+' / '+snapshot.data.length.toString(),
            ),
          ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
            height: 200.0,
            width: screenWidth,
              child: CustomPaint(
              painter: CirclePainter(screenWidth),
              )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  snapshot.data[Provider.of<QuestionProvider>(context).currentIndex].questionText??'null',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ),
        ],
        ),
          SizedBox(height: 50.0,),

          AnswerButtonsBlock(snapshot.data[Provider.of<QuestionProvider>(context).currentIndex].answers),

          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                width: screenWidth,
                height: 50.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [themeCustom.primaryColor, Color(0xff7B1FA2)]
                    )
                ),
                child: InkWell(
                  child: Center(
                      child: Text('Next',
                        style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                        )
                      )
                  ),
        ),
                  onTap: (){
                    if(Provider.of<QuestionProvider>(context, listen: false).currentIndex==snapshot.data.length-1){
                      Provider.of<QuestionProvider>(context, listen: false).checkAnswer(Provider.of<ButtonProvider>(context, listen: false).currentSelectedIndex);
                      Provider.of<ButtonProvider>(context, listen: false).resetSelection();
                      Navigator.pushNamed(
                          context,
                          CustomRoute.RESULT_PAGE,
                      );
                    } else{
                      Provider.of<QuestionProvider>(context, listen: false).checkAnswer(Provider.of<ButtonProvider>(context, listen: false).currentSelectedIndex);
                      Provider.of<ButtonProvider>(context, listen: false).resetSelection();
                      Provider.of<QuestionProvider>(context, listen: false).moveToNextQuestion();

                    }
                  },
                ),
              ),
            ),
          )
        ];
    }
          return SafeArea(
            child: Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: columnChildren
                )),
          );
        }
    );
  }
}
