import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/provider/QuestionProvider.dart';
import 'package:quizzler/view/ui/screens/question_screen/widgets/BackToListButton.dart';

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
            isGoodResult?Image.asset('assets/images/win.jpg'):Image.asset('assets/images/lose.jpg'),
            SizedBox(height: 20.0,),
            Text(
              isGoodResult?"Congratulations! Your have earned "+userResult.toString()+" points":
              "Do not worry! Today it is only "+userResult.toString()+" points, but we believe you can do it better!",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            SizedBox(height: 20.0,),
            BackToListButton()
          ],
        ),
      ),
    );
  }
}
