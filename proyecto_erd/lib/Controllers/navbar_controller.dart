import 'package:flutter/material.dart';

class NavbarController extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onTabTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
