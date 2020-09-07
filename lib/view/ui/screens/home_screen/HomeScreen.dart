import 'package:flutter/material.dart';
import 'file:///E:/flutter_courses/quizzler-flutter/lib/view/ui/screens/home_screen/widgets/CourseTypeTile.dart';
import 'package:quizzler/model/utils/QuestionType.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        title: Text("Choose a quiz"),
      ),

      body: GridView.count(
        padding: EdgeInsets.all(20.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        primary: false,
        crossAxisCount: 2,
        children: <Widget>[
          CourseTypeTile('assets/images/true_or_false.png','True or false', QuestionType.trueorfalse),
          CourseTypeTile('assets/images/multiple_answers.png','Multiple answers', QuestionType.oneanswer),
          CourseTypeTile('assets/images/coming_soon.jpg','Coming soon'),
          CourseTypeTile('assets/images/coming_soon.jpg','Coming soon'),
          CourseTypeTile('assets/images/coming_soon.jpg','Coming soon'),
          CourseTypeTile('assets/images/coming_soon.jpg','Coming soon'),
          CourseTypeTile('assets/images/coming_soon.jpg','Coming soon'),
          CourseTypeTile('assets/images/coming_soon.jpg','Coming soon'),
          CourseTypeTile('assets/images/coming_soon.jpg','Coming soon'),
          CourseTypeTile('assets/images/coming_soon.jpg','Coming soon'),
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
