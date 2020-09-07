import 'package:flutter/material.dart';
import 'package:quizzler/model/core/Question.dart';

class TrueFalseQuestion extends Question{

  int _id;
  String _questionText;
  List<String> _answers;
  String _rightAnswer;

  TrueFalseQuestion({int id, String questionText, String rightAnswer}){
    this._id = id;
    this._questionText = questionText;
    this._answers = [
      'true',
      'false'
    ];
    this._rightAnswer = rightAnswer;
  }

  int get id => this._id;

  String get questionText => this._questionText;

  List<String> get answers => this._answers;

  String get rightAnswer => this._rightAnswer;

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
    return this._rightAnswer == _answers[index];
  }
}