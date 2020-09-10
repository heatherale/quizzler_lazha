import 'package:flutter/material.dart';
import 'answer_button.dart';

class AnswerButtonsBlock extends StatelessWidget {

  final List<String> answers;

  AnswerButtonsBlock(this.answers);

  @override
  Widget build(BuildContext context) {
    print('ANSWERS ${answers.toString()}');
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
