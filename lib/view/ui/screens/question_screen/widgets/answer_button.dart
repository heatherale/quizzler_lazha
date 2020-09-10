import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/provider/button_provider.dart';
import 'package:quizzler/view/shared/theme_custom.dart';

class AnswerButton extends StatefulWidget {

  int index;
  final String text;

  AnswerButton(this.index, this.text);

  @override
  _AnswerButtonState createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {

    final buttonProvider = Provider.of<ButtonProvider>(context);
    final notListenableButtonProvider = Provider.of<ButtonProvider>(context, listen: false);

    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(color: buttonProvider.currentSelectedIndex==widget.index?themeCustom.primaryColor:themeCustom.unselectedWidgetColor.withOpacity(0.4), width: 2.5)
      ),
      onPressed: () => notListenableButtonProvider.toggleSelected(widget.index),
      child: Center(
        child: Text(
          this.widget.text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
