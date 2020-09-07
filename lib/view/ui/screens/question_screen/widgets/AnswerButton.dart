import 'package:flutter/material.dart';
import 'package:quizzler/view/shared/ThemeCustom.dart';

class AnswerButton extends StatelessWidget {

  final int index;
  bool isSelected;
  final void onSelect;
  String text;

  AnswerButton(this.index, this.isSelected, this.onSelect, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: InkWell(
        customBorder: Border.all(color: isSelected?themeCustom.unselectedWidgetColor:themeCustom.primaryColor, width: 2.0),
        onTap: () => this.onSelect,
        child: Text(
          this.text
        ),
      ),
    );
  }
}
