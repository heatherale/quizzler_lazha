import 'package:flutter/material.dart';

class ButtonProvider extends ChangeNotifier{

  int _currentSelectedIndex = -1;

  int get currentSelectedIndex => _currentSelectedIndex;

  void toggleSelected(int index) {
    _currentSelectedIndex = index;
    notifyListeners();
  }

  void resetSelection(){
    _currentSelectedIndex = -1;
    notifyListeners();
  }

}