import 'package:flutter/material.dart';
import 'package:quizzler/model/core/Question.dart';
import 'package:quizzler/model/services/QuestionService.dart';
import 'package:quizzler/model/utils/QuestionType.dart';

class QuestionProvider extends ChangeNotifier{

  List<Question> _currentList;
  int _currentIndex;
  int _testResult;

  Future<List<Question>> fetchData(QuestionType type) async {
    List<Question> listToReturn =  await QuestionService(type).getQuestionList();
    _currentList = listToReturn;
    return listToReturn;
  }

  void setScoreToZero() {
    _currentIndex = 0;
    _testResult = 0;
  }

  int get currentIndex => _currentIndex;

  void moveToNextQuestion(){
    _currentIndex++;
    notifyListeners();
  }

  void checkAnswer(int index){
    if(_currentList[_currentIndex].checkAnswer(index)){
      _testResult++;
      //print ("Test result" + _testResult.toString());
    }
  }

  int get testResult => _testResult;


}