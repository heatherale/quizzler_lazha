import 'package:quizzler/model/core/Question.dart';

class OneAnswerQuestion extends Question{

  int _id;
  String _questionText;
  List<String> _answers;
  String _rightAnswer;

  OneAnswerQuestion({int id, String questionText, String rightAnswer, List<String> answers}){
    this._id = id;
    this._questionText = questionText;
    this._answers = answers;
    this._rightAnswer = rightAnswer;
  }


  int get id => this._id;

  String get questionText => this._questionText;

  List<String> get answers => this._answers;

  String get rightAnswer => this._rightAnswer;

  @override
  bool checkAnswer(int index) {
    return this._rightAnswer == _answers[index];
  }

}