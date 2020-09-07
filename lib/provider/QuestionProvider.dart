import 'package:flutter/material.dart';
import 'package:quizzler/model/core/Question.dart';
import 'package:quizzler/model/helpers/QuestionHelper.dart';
import 'package:quizzler/model/utils/QuestionType.dart';

class QuestionProvider extends ChangeNotifier{

  List<Question> _currentList;
  int _currentIndex;
  int _testResult;

  void fetchData(QuestionType type) async {
    _currentList = await QuestionHelper(type).getQuestionList();
    print("Provider here. Current list" + _currentList.toString());
  }

  void setScoreToZero() {
    _currentIndex = 0;
    _testResult = 0;
  }

  Question get currentQuestion => _currentIndex==_currentList.length?null:_currentList[_currentIndex];

  void moveToNextQuestion(){
    if(_currentList[_currentIndex].checkAnswer(_currentIndex)){
      _testResult++;
    }
    _currentIndex++;
    notifyListeners();
  }

  int get testResult => _testResult;


}