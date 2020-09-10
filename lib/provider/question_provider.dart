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

  Future<List<TrueOrFalseQuestionModel>>fetchTrueOrFalseQuestions() async {
    _currentList = await _service.getTrueOrFalseQuestionList();
    print('TRUE FALSE $_currentList');
    return _currentList;
  }

  Future<List<OneAnswerQuestionModel>>fetchOneAnswerQuestions() async {
    _currentList = await _service.getOneAnswerQuestionList();
    print('ONE ANSWER $_currentList');
    return _currentList;
  }

  void setIndexToZero(){
    _currentIndex = 0;
    notifyListeners();
  }

  void setScoreToZero(){
    _testResult = 0;
    notifyListeners();
  }

  int get currentIndex => _currentIndex;
  int get testResult => _testResult;
  bool get isLoading => _isLoading;
  List<dynamic> get currentList => _currentList;

  void moveToNextQuestion(){
    _currentIndex++;
    notifyListeners();
  }

  void checkAnswer(int index){
    if(_currentList[_currentIndex].checkAnswer(index)){
      _testResult++;
    }
  }


  void startLoading(){
    _isLoading = true;
    print('start loading');
    notifyListeners();
  }

  void stopLoading(){
    _isLoading = false;
    print('stop loading');
    notifyListeners();
  }


}