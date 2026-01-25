import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode? appTheme;

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    setAppTheme(theme: appTheme == ThemeMode.dark ? "dark" : "light");
    notifyListeners();
  }

  Future<void> getAppTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String result = prefs.getString(SharedPreferencesKeys.appTheme) ?? "light";
    if (result == "light") {
      appTheme = ThemeMode.light as ThemeMode?;
    } else {
      appTheme = ThemeMode.dark as ThemeMode?;
    }
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
