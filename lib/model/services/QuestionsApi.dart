import 'package:http/http.dart' as http;
import 'package:quizzler/model/utils/QuestionType.dart';

class QuestionApi{

  final String endpoint = 'https://demo0586388.mockable.io';

  Future<String> getQuestionFromUrl(QuestionType type) async{
    try{
      final uri = Uri.https(endpoint, endpoint+typesOfQuestions[type]); //we take the string value from the map typesOfQuestions (models/utils/QuestionType.dart);
      final response = await http.get(uri);
      return response.body;
    } catch(e) {
      print(e);
    }
  }



}