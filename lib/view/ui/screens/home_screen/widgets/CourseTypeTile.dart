import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/model/utils/QuestionType.dart';
import 'package:quizzler/provider/TypeProvider.dart';
import 'package:quizzler/view/shared/CustomRoute.dart';

class CourseTypeTile extends StatelessWidget {

  final String _imagePath;
  final String _titleOfType;
  final QuestionType _typeOfQuestions;

  CourseTypeTile(this._imagePath, this._titleOfType, [this._typeOfQuestions = null]);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(this._typeOfQuestions==null){
          Navigator.pushNamed(
            context,
            CustomRoute.UNDER_CONSTRUCTION_PAGE,
          );
        } else {
          Provider.of<TypeProvider>(context, listen: false).setType(this._typeOfQuestions);
          Navigator.pushNamed(
            context,
            CustomRoute.QUESTION_PAGE,
          );
        }
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Padding(
              padding: EdgeInsets.only(bottom: 40.0, top: 20.0),
              child: Image.asset(this._imagePath)
          ),
        ),
        footer: Padding(
          padding: EdgeInsets.only(bottom: 7.0),
          child: Text(
            this._titleOfType,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Color(0xff757575).withOpacity(0.9),
                fontSize: 20.0
            ),
          ),
        ),
      ),
    );
  }
}
