import 'package:flutter/material.dart';
import 'package:quizzler/view/shared/custom_route.dart';
import 'package:quizzler/view/shared/theme_custom.dart';


class CourseTypeTile extends StatelessWidget {

  final Image tileImage;
  final String titleOfCourseType;
  final Function tileCallback;

  CourseTypeTile(this.tileImage, this.titleOfCourseType, [this.tileCallback = null]);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        if(tileCallback==null){
          Navigator.pushNamed(
            context,
            CustomRoute.UNDER_CONSTRUCTION_PAGE,
          );
        } else {
          Navigator.pushNamed(
            context,
            CustomRoute.QUESTION_PAGE,
          );
          tileCallback();
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
              child: tileImage
          ),
        ),
        footer: Padding(
          padding: EdgeInsets.only(bottom: 7.0),
          child: Text(
            titleOfCourseType,
            textAlign: TextAlign.center,
            style: CustomTextStyles.styleForCourseTypeTile
          ),
        ),
      ),
    );
  }
}
