import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler/view/ui/screens/question_screen/widgets/BackToListButton.dart';

class UnderConstructionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image.asset('assets/images/coming_soon.jpg'),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'This page is under construction. We will add more exciting courses soon!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )
                ),
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
