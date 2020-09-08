abstract class Question{

  int _id;
  String _questionText;
  String _rightAnswer;
  List<String> _answers;

  int get id => this._id;

  String get questionText => this._questionText;

  List<String> get answers => this._answers;

  String get rightAnswer => this._rightAnswer;

  bool checkAnswer(int index);

}