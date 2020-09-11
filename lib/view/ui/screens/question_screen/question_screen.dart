import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/helpers/circle_painter.dart';
import 'package:quizzler/provider/button_provider.dart';
import 'package:quizzler/provider/question_provider.dart';
import 'package:quizzler/view/shared/custom_route.dart';
import 'package:quizzler/view/shared/theme_custom.dart';
import 'package:quizzler/view/ui/screens/question_screen/widgets/answer_buttons_block.dart';
import 'package:quizzler/view/ui/screens/question_screen/widgets/loading_block.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  @override
  Widget build(BuildContext context) {
    QuestionProvider notListenableQuestionProvider = Provider.of<QuestionProvider>(context, listen: false);
    QuestionProvider questionProvider = Provider.of<QuestionProvider>(context);
    ButtonProvider notListenableButtonProvider = Provider.of<ButtonProvider>(context, listen: false);

    final double screenWidth = MediaQuery.of(context).size.width;

          return SafeArea(
            child: Scaffold(
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                questionProvider.isLoading?
                <Widget>[LoadingBlock()]:
                <Widget>[
                  AppBar(
                    title: Text(
                      'Question ${(questionProvider.currentIndex + 1).toString()} / ${notListenableQuestionProvider.currentList.length.toString()}',
                    ),
                  ),

                  _buildQuestionHeader(screenWidth, questionProvider, notListenableQuestionProvider),

                  SizedBox(
                    height: 50.0,
                  ),

                  AnswerButtonsBlock(questionProvider.currentList[questionProvider.currentIndex].answers),

                  _buildNextButton(screenWidth, notListenableQuestionProvider, notListenableButtonProvider, context)
                ]
                )),
          );
  }

  Expanded _buildNextButton(double screenWidth, QuestionProvider notListenableQuestionProvider, ButtonProvider notListenableButtonProvider, BuildContext context) {
    return Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  width: screenWidth,
                  height: 50.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [themeCustom.primaryColor, CustomColors.secondGradientColor])),
                  child: InkWell(
                    child: Center(
                      child: Text('Next',
                          style: CustomTextStyles.questionPageCommonStyle),
                    ),
                    onTap: () {
                      if (notListenableQuestionProvider.currentIndex == notListenableQuestionProvider.currentList.length - 1) {
                        notListenableQuestionProvider.checkAnswer(notListenableButtonProvider.currentSelectedIndex);
                        notListenableButtonProvider.resetSelection();
                        Navigator.pushNamed(
                          context,
                          CustomRoute.RESULT_PAGE,
                        );
                      } else {
                        notListenableQuestionProvider.checkAnswer(notListenableButtonProvider.currentSelectedIndex);
                        notListenableButtonProvider.resetSelection();
                        notListenableQuestionProvider.moveToNextQuestion();
                      }
                    },
                  ),
                ),
              ),
            );
  }

  Stack _buildQuestionHeader(double screenWidth, QuestionProvider questionProvider, QuestionProvider notListenableQuestionProvider) {
    return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 200.0,
                    width: screenWidth,
                    child: CustomPaint(
                      painter: CirclePainter(screenWidth),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    notListenableQuestionProvider.currentList[questionProvider.currentIndex].question ?? '',
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.questionPageCommonStyle,
                  ),
                ),
              ],
            );
  }
}
