import 'package:flutter/material.dart';
import 'package:quizzler/model/core/Question.dart';

class TrueFalseQuestion extends Question{

  int _id;
  String _questionText;
  List<String> _answers = [
    'true',
    'false'
  ];
  String _rightAnswer;

  TrueFalseQuestion({int id, String questionText, String rightAnswer}):super(id: id, questionText: questionText, rightAnswer: rightAnswer);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id':id,
      "question":questionText,
      "rightAnswer":rightAnswer
    };
  }

  @override
  bool checkAnswer(int index) {
    return this._rightAnswer == answers[index];
  }
}