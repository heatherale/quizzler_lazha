import 'package:flutter/material.dart';

class ButtonProvider extends ChangeNotifier{

  int currentSelectedIndex = -1;

  void toggleSelected(int index) {
    currentSelectedIndex = index;
    notifyListeners();
  }

}