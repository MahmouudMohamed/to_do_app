import 'package:flutter/material.dart';


class MyProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  ChangeTheme(ThemeMode themeMode) async {
    mode = themeMode;
    notifyListeners();
  }
}
