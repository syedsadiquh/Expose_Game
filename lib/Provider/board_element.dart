import 'package:flutter/material.dart';

class BoardElement with ChangeNotifier {
  late int number;
  late bool clicked;

  BoardElement(int n) {
    number = n;
    clicked = false;
  }

  int get tileNumber {
    return number;
  }

  bool get clickedStatus {
    return clicked;
  }

  // set setClickedStatus(bool s) {
  //   clicked = s;
  //   notifyListeners();
  // }

  void setClickedStatus(bool bool) {
    clicked = bool;
    notifyListeners();
  }
}
