import 'dart:convert';
import 'dart:io';

import 'package:quizzler/model/core/Question.dart';
import 'package:quizzler/model/factory/QuestionFactory.dart';
import 'package:quizzler/model/services/QuestionsApi.dart';
import 'package:quizzler/model/utils/QuestionType.dart';
import 'package:http/http.dart' as http;

class QuestionHelper {

  final QuestionType _typeOfDataFetched;

  QuestionHelper(this._typeOfDataFetched);

  //final api = QuestionApi();
  final String endpoint = 'https://demo0586388.mockable.io/';

  Future<List<Question>> getQuestionList() async {
    final response = await http.get(endpoint + urlParameters[_typeOfDataFetched]);
    print(response.body);
    var res = json.decode(response.body) as List;
    print(res);
    var map = res.map((e) =>QuestionFactory(_typeOfDataFetched).fromMap(e));
    var list = map.toList();
    print(list);
    return list;

  }
}