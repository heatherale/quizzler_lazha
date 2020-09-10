import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/provider/question_provider.dart';
import 'package:quizzler/view/shared/assets.dart';
import 'package:quizzler/view/shared/theme_custom.dart';
import 'package:quizzler/view/ui/screens/question_screen/widgets/back_to_list_button.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int totalNumberOfQuestions = Provider.of<QuestionProvider>(context, listen: false).currentIndex+1;
    int userResult = Provider.of<QuestionProvider>(context, listen: false).testResult;
    bool isGoodResult = userResult/totalNumberOfQuestions>=0.5;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isGoodResult?Assets.winImage:Assets.loseImage,
            SizedBox(height: 20.0,),
            Text(
              isGoodResult?'Congratulations! Your have earned ${userResult.toString()} points':
              'Do not worry! Today it is only ${userResult.toString()} points, but we believe you can do it better!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: CustomTextStyles.questionPageCommonStyle.copyWith(color: Colors.black)
              ),
            ),
            SizedBox(height:.0,),
            BackToListButton()
          ],
        ),
      ),
    );
  }
}

