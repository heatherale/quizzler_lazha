import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/provider/ButtonProvider.dart';
import 'package:quizzler/view/ui/screens/question_screen/widgets/AnswerButton.dart';

class AnswerButtonsBlock extends StatelessWidget {

  List<String> answers;

  AnswerButtonsBlock(this.answers);

  @override
  Widget build(BuildContext context) {
    print('ANSWERS '+this.answers.toString());
    return Container(
      child: ListView.builder(
        itemCount: answers.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
            child: AnswerButton(index, answers[index]),
          );
        },
      ),
    );
  }
}
