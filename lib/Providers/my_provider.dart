import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLight = prefs.getBool("isLight");
    if (isLight!= null) {
      if (isLight == true) {
        mode =ThemeMode.light;
      } else {
        mode = ThemeMode.dark;
      }
      notifyListeners();
    }
  }


  ChangeTheme(ThemeMode themeMode) async {
    mode = themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLight', mode == ThemeMode.light);
    notifyListeners();
  }
}
