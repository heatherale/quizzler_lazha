import 'package:flutter/material.dart';
import 'package:quizzler/view/shared/custom_route.dart';

class BackToListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.white,
        child: Text('Back to list of quizzes'),
        onPressed: () {
          Navigator.pushNamed(
            context,
            CustomRoute.HOME_SCREEN,
          );
        }
        );
    }
  }
