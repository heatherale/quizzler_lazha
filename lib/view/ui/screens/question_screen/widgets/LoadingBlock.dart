import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler/view/shared/ThemeCustom.dart';

class LoadingBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircularProgressIndicator(backgroundColor: themeCustom.primaryColor,),
          SizedBox(height: 10.0,),
          Text(
            'Loading course, please wait',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                )
            ),
          ),
        ],
      ),
    );
  }
}
