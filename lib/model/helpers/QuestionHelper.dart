import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizzler/model/core/Question.dart';
import 'package:quizzler/model/services/QuestionsApi.dart';
import 'package:quizzler/model/utils/QuestionType.dart';

class QuestionHelper{

  final api = QuestionApi();
  Future<List<Question>> getQuestionList(QuestionType type) async{
    final String apiResult = await api.getQuestionFromUrl(type);
    return (json.decode(apiResult) as List)
        .map((e) => Question.fromJson(e))
        .toList();


  }

}