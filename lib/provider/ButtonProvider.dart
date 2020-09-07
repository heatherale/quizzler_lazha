import 'package:flutter/material.dart';

class ButtonProvider extends ChangeNotifier{

  int currentSelectedIndex;

  void toggleSelected(int index) => currentSelectedIndex = index;

}