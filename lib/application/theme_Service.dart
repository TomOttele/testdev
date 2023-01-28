// ignore_for_file: file_names, unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ThemeService extends ChangeNotifier {
  bool isDarkModeOn = true;

  void toggleTheme() {
    this.isDarkModeOn = !this.isDarkModeOn;
    notifyListeners();
  }
}
