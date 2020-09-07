import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quizzler/model/utils/QuestionType.dart';

abstract class Question{

  int _id;
  String _questionText;
  String _rightAnswer;
  List<String> _answers;

  int get id => this._id;

  String get questionText => this._questionText;

  List<String> get answers => this._answers;

  String get rightAnswer => this._rightAnswer;

  Map<String,dynamic> toMap();

  String toJson() => json.encode(toMap());

  bool checkAnswer(int index);

}