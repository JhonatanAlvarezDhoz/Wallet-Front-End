import 'package:flutter/material.dart';

class BottomNavigationBarController extends ChangeNotifier {
  int currentIndex = 0;

  changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
