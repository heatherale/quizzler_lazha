import 'dart:convert';

List<TrueOrFalseQuestionModel> trueOrFalseQuestionModelFromJson(String str) => List<TrueOrFalseQuestionModel>.from(json.decode(str).map((x) => TrueOrFalseQuestionModel.fromJson(x)));

String trueOrFalseQuestionModelToJson(List<TrueOrFalseQuestionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrueOrFalseQuestionModel {
  TrueOrFalseQuestionModel({
    this.id,
    this.question,
    this.rightAnswer,
  }){
    answers = ['true', 'false'];
  }

  int id;
  String question;
  String rightAnswer;
  List<String> answers;

  TrueOrFalseQuestionModel copyWith({
    int id,
    String question,
   String rightAnswer,
  }) =>
      TrueOrFalseQuestionModel(
        id: id ?? this.id,
        question: question ?? this.question,
        rightAnswer: rightAnswer ?? this.rightAnswer,
      );

  factory TrueOrFalseQuestionModel.fromJson(Map<String, dynamic> json) => TrueOrFalseQuestionModel(
    id: json["id"] == null ? null : json["id"],
    question: json["question"] == null ? null : json["question"],
    rightAnswer: json["rightAnswer"] == null ? null : json["rightAnswer"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "question": question == null ? null : question,
    "rightAnswer": rightAnswer == null ? null : rightAnswer,
  };

  bool checkAnswer(int index) {
    return rightAnswer == answers[index];
  }
}
