import 'package:flutter/material.dart';
import 'package:quizzler/model/utils/QuestionType.dart';

class TypeProvider extends ChangeNotifier{

  QuestionType _type;

  QuestionType get type => _type;

  void setType(QuestionType newType) {
    _type = newType;
    notifyListeners();
  }

}