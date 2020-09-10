import 'package:quizzler/model/core/one_answer_question_model.dart';
import 'package:quizzler/model/core/true_or_false_question_model.dart';
import 'package:http/http.dart' as http;

class QuestionService {

  //final api = QuestionApi();
  final String trueOrFalseEndpoint = 'https://demo0586388.mockable.io/truefalse';
  final String oneAnswerEndpoint = 'https://demo0586388.mockable.io/oneanswer';

  Future<List<TrueOrFalseQuestionModel>> getTrueOrFalseQuestionList() async {
    final response = await http.get(trueOrFalseEndpoint);
    return trueOrFalseQuestionModelFromJson(response.body);
  }

  Future<List<OneAnswerQuestionModel>> getOneAnswerQuestionList() async {
    final response = await http.get(oneAnswerEndpoint);
    return oneAnswerQuestionModelFromJson(response.body);
  }
}