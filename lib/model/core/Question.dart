import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quizzler/model/utils/QuestionType.dart';

class Question{

  int id;
 QuestionType type;
  String questionText;
  Map<String,bool> answers = {
    'true':false,
    'false':false
  };
  String rightAnswer;

  Question.trueOrFalse({this.id, this.questionText, this.rightAnswer}){
    this.type = QuestionType.trueorfalse; //as per the file utils:QuestionType.dart
    answers[rightAnswer] = true;
  }

  Question.fourOptions({this.id, this.questionText, this.answers, this.rightAnswer}){
    this.type = QuestionType.fouroptions; //as per the file utils:QuestionType.dart
    answers[rightAnswer] = true;
  }

  Map<String,dynamic> toMap() => this.type==QuestionType.trueorfalse?{
    'id':id,
    "question":questionText,
    "rightAnswer":rightAnswer
  }:{
    'id':id,
    "question":questionText,
    "answers":answers.keys,
    "rightAnswer":rightAnswer
  };



  static Question fromJson(Map<String,dynamic> json){
    if (json == null){
      return null;
    } else if (json['answers'] == null){ //if the question is true or false
      return Question.trueOrFalse(
        id: json['id'],
        questionText: json['question'],
        rightAnswer: json['rightAnswer']
      );
    } else { //if the question has 4 options
      return Question.fourOptions(
          id: json['id'],
          questionText: json['question'],
          answers: {
            for (var v in json['answers']) v:false
          },
      rightAnswer: json['rightAnswer']
      );
    }
  }

  String toJson() => json.encode(toMap());


  bool checkAnswer(){}

}