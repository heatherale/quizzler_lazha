import 'package:flutter/material.dart';
import 'package:quizzler/model/core/Question.dart';

class OneAnswerQuestion extends Question{

  int _id;
  String _questionText;
  List<String> _answers;
  String _rightAnswer;

  OneAnswerQuestion({int id, String questionText, String rightAnswer, List<String> answers}):super(id: id, questionText: questionText, rightAnswer: rightAnswer, answers: answers);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id':this._id,
      "question":this._questionText,
      "answers":this._answers,
      "rightAnswer":this._rightAnswer
    };
  }

  @override
  bool checkAnswer(int index) {
    return this._rightAnswer == answers[index];
  }

}