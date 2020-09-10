import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler/view/shared/assets.dart';
import 'package:quizzler/view/shared/theme_custom.dart';
import 'package:quizzler/view/ui/screens/question_screen/widgets/back_to_list_button.dart';

class UnderConstructionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Assets.underConstructionImage,
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'This page is under construction. We will add more exciting courses soon!',
                textAlign: TextAlign.center,
                style: CustomTextStyles.questionPageCommonStyle.copyWith(color: Colors.black)
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
