import 'dart:convert';

import 'package:quizzler/model/core/Question.dart';
import 'package:quizzler/model/factory/QuestionFactory.dart';
import 'package:quizzler/model/services/QuestionsApi.dart';
import 'package:quizzler/model/utils/QuestionType.dart';

class QuestionHelper{

  final QuestionType _typeOfDataFetched;

  QuestionHelper(this._typeOfDataFetched);

  final api = QuestionApi();
  Future<List<Question>> getQuestionList() async{
    final String apiResult = await api.getQuestionFromUrl(this._typeOfDataFetched);
    return (json.decode(apiResult) as List)
        .map((e) => QuestionFactory(this._typeOfDataFetched).fromJson(e))
        .toList();
  }

}