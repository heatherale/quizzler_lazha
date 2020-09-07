import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizzler/model/core/OneAnswerQuestion.dart';
import 'package:quizzler/model/core/Question.dart';
import 'package:quizzler/model/core/TrueFalseQuestion.dart';
import 'package:quizzler/model/utils/QuestionType.dart';

class QuestionFactory{

  QuestionType _type;

  QuestionFactory(this._type);

  static Question _questionToReturn;

  Question fromJson(String source) => fromMap(json.decode(source));

  Question fromMap(Map<String,dynamic> map){

    switch(_type){
      case QuestionType.trueorfalse:
        _questionToReturn = TrueFalseQuestion(
          id: map['id'],
          questionText: map['question'],
            rightAnswer: map['rightAnswer']
        );
        break;
      case QuestionType.oneanswer:
        _questionToReturn = OneAnswerQuestion(
            id: map['id'],
            questionText: map['question'],
            answers: map['answers'],
            rightAnswer: map['rightAnswer']
        );
        break;
      default:
        print('Something is wrong');
        break;
    }

    return _questionToReturn;
    }
  }