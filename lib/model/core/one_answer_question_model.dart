// To parse this JSON data, do
//
//     final oneAnswerQuestionModel = oneAnswerQuestionModelFromJson(jsonString);

import 'dart:convert';

List<OneAnswerQuestionModel> oneAnswerQuestionModelFromJson(String str) => List<OneAnswerQuestionModel>.from(json.decode(str).map((x) => OneAnswerQuestionModel.fromJson(x)));

String oneAnswerQuestionModelToJson(List<OneAnswerQuestionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OneAnswerQuestionModel {
  OneAnswerQuestionModel({
    this.id,
    this.question,
    this.answers,
    this.rightAnswer,
  });

  int id;
  String question;
  List<String> answers;
  String rightAnswer;

  OneAnswerQuestionModel copyWith({
    int id,
    String question,
    List<String> answers,
    String rightAnswer,
  }) =>
      OneAnswerQuestionModel(
        id: id ?? this.id,
        question: question ?? this.question,
        answers: answers ?? this.answers,
        rightAnswer: rightAnswer ?? this.rightAnswer,
      );

  factory OneAnswerQuestionModel.fromJson(Map<String, dynamic> json) => OneAnswerQuestionModel(
    id: json["id"] == null ? null : json["id"],
    question: json["question"] == null ? null : json["question"],
    answers: json["answers"] == null ? null : List<String>.from(json["answers"].map((x) => x)),
    rightAnswer: json["rightAnswer"] == null ? null : json["rightAnswer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "question": question == null ? null : question,
    "answers": answers == null ? null : List<dynamic>.from(answers.map((x) => x)),
    "rightAnswer": rightAnswer == null ? null : rightAnswer,
  };

  bool checkAnswer(int index) {
    return rightAnswer == answers[index];
  }

}
