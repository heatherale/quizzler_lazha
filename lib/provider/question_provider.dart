import 'package:flutter/material.dart';
import 'package:quizzler/model/core/one_answer_question_model.dart';
import 'package:quizzler/model/core/true_or_false_question_model.dart';
import 'package:quizzler/model/services/question_service.dart';

class QuestionProvider extends ChangeNotifier{

  List<dynamic> _currentList;
  int _currentIndex;
  int _testResult;
  QuestionService _service;
  bool _isLoading = true;

  QuestionProvider(this._service);

  Future<void>fetchTrueOrFalseQuestions() async {
    startLoading();
    _currentList = await _service.getTrueOrFalseQuestionList();
    setScoreToZero();
    setIndexToZero();
    /*print('TRUE FALSE ${_currentList[0].question}');
    print('TRUE FALSE ${_currentList[1].question}');
    print('TRUE FALSE ${_currentList[2].question}');
    print('TRUE FALSE ${_currentList[3].question}');*/
    stopLoading();
  }

  Future<void>fetchOneAnswerQuestions() async {
    startLoading();
    _currentList = await _service.getOneAnswerQuestionList();
    //print('ONE ANSWER $_currentList');
    setScoreToZero();
    setIndexToZero();
    stopLoading();
  }

  void setIndexToZero(){
    _currentIndex = 0;
  }

  void setScoreToZero(){
    _testResult = 0;
  }

  int get currentIndex => _currentIndex;
  int get testResult => _testResult;
  bool get isLoading => _isLoading;
  List<dynamic> get currentList => _currentList;

  void moveToNextQuestion(){
    _currentIndex++;
    print(_currentIndex);
    notifyListeners();
  }

  void checkAnswer(int index){
    if(_currentList[_currentIndex].checkAnswer(index)){
      _testResult++;
    }
  }

  void startLoading(){
    _isLoading = true;
    //print('start loading');
    notifyListeners();
  }

  void stopLoading(){
    _isLoading = false;
    //print('stop loading');
    notifyListeners();
  }


}