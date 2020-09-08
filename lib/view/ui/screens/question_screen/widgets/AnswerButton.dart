import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/provider/ButtonProvider.dart';
import 'package:quizzler/view/shared/ThemeCustom.dart';

class AnswerButton extends StatelessWidget {

  final int index;
  String text;

  AnswerButton(this.index, this.text);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(color: Provider.of<ButtonProvider>(context).currentSelectedIndex==this.index?themeCustom.primaryColor:themeCustom.unselectedWidgetColor.withOpacity(0.4), width: 2.5)
      ),
      onPressed: () => Provider.of<ButtonProvider>(context, listen: false).toggleSelected(this.index),
      child: Center(
        child: Text(
          this.text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
