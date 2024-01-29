import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkModeEnabled => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode = isDarkModeEnabled ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
