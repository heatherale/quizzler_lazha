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
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: AnswerButton(index, Provider.of<ButtonProvider>(context).currentSelectedIndex==index, Provider.of<ButtonProvider>(context, listen: false).toggleSelected(index), answers[index]),
          );
        },
      ),
    );
  }
}
