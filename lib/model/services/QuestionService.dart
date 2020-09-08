import 'dart:convert';
import 'package:quizzler/model/core/Question.dart';
import 'package:quizzler/model/factory/QuestionFactory.dart';
import 'package:quizzler/model/utils/QuestionType.dart';
import 'package:http/http.dart' as http;

class QuestionService {

  final QuestionType _typeOfDataFetched;

  QuestionService (this._typeOfDataFetched);

  //final api = QuestionApi();
  final String endpoint = 'https://demo0586388.mockable.io/';

  Future<List<Question>> getQuestionList() async {
    final response = await http.get(endpoint + urlParameters[_typeOfDataFetched]);
    return (json.decode(response.body) as List)
        .map((e) =>QuestionFactory(_typeOfDataFetched).fromMap(e))
        .toList();
  }
}