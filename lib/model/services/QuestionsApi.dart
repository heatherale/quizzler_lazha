import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:quizzler/model/utils/QuestionType.dart';

class QuestionApi{

  final String endpoint = 'https://demo0586388.mockable.io/';

  Future<String> getQuestionFromUrl(QuestionType typeOfDataFetched) async{
    try{
      final response = await http.get(endpoint+urlParameters[typeOfDataFetched]); //we take the string value from the map typesOfQuestions (models/utils/QuestionType.dart);
      return response.body;
    } catch(e) {
      print(e);
    }
  }



}