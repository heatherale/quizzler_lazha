import 'package:flutter/material.dart';
import 'package:quizzler/view/shared/ThemeCustom.dart';

class AnswerButton extends StatelessWidget {

  final int index;
  bool isSelected;
  final void onSelect;

  AnswerButton(this.index, this.isSelected, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: Border.all(color: isSelected?themeCustom.unselectedWidgetColor:themeCustom.primaryColor, width: 2.0),
      onTap: () => this.onSelect,
    );
  }
}
