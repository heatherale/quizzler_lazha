import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizzler/model/core/OneAnswerQuestion.dart';
import 'package:quizzler/model/core/Question.dart';
import 'package:quizzler/model/core/TrueFalseQuestion.dart';
import 'package:quizzler/model/utils/QuestionType.dart';

class QuestionFactory{

  QuestionType _type;

  QuestionFactory(this._type);

  //Question fromJson(String source) => fromMap(json.decode(source));

  Question fromMap(Map<String,dynamic> map){

    Question questionToReturn;

    switch(_type){
      case QuestionType.trueorfalse: {
        questionToReturn = TrueFalseQuestion(
            id: map['id'],
            questionText: map['question'],
            rightAnswer: map['rightAnswer'].toString()
        );
      } break;
      case QuestionType.oneanswer: {
        List<String> castedAnswers = List<String>.from(map['answers']);
        questionToReturn = OneAnswerQuestion(
            id: map['id'],
            questionText: map['question'],
            answers: castedAnswers,
            rightAnswer: map['rightAnswer']
        );
      } break;
      default: {
        print('Something is wrong');
      } break;
    }

    print('FACTORY HERE. HERE IS MY QUESTION'+questionToReturn.questionText);
    return questionToReturn;
    }
  }