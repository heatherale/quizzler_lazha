import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/provider/question_provider.dart';
import 'package:quizzler/view/shared/assets.dart';
import 'package:quizzler/view/shared/theme_custom.dart';
import 'package:quizzler/view/ui/screens/home_screen/widgets/course_type_tile.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final questionProvider = Provider.of<QuestionProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        leading: Icon(Icons.home, color: Colors.white,),
        title: Text("Choose a quiz"),
      ),

      body: GridView.count(
        padding: EdgeInsets.all(20.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        primary: false,
        crossAxisCount: 2,
        children: <Widget>[
          CourseTypeTile(Assets.trueFalseImage, 'True or false', questionProvider.fetchTrueOrFalseQuestions()),
          CourseTypeTile(Assets.oneAnswerImage,'Multiple answers', questionProvider.fetchOneAnswerQuestions()),
          CourseTypeTile(Assets.underConstructionImage,'Coming soon'),
          CourseTypeTile(Assets.underConstructionImage,'Coming soon'),
          CourseTypeTile(Assets.underConstructionImage,'Coming soon'),
          CourseTypeTile(Assets.underConstructionImage,'Coming soon'),
          CourseTypeTile(Assets.underConstructionImage,'Coming soon'),
          CourseTypeTile(Assets.underConstructionImage,'Coming soon'),
          CourseTypeTile(Assets.underConstructionImage,'Coming soon'),
          CourseTypeTile(Assets.underConstructionImage,'Coming soon'),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart),
            title: Text('My stats')
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
            title: Text('Profile')
          ),
        ],
      ),
    );
  }
}
