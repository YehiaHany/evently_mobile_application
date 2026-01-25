import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils.dart';

class LanguageProvider extends ChangeNotifier{
  String? language;
  String? appLanguage;
  void changeLanguage(String newLanguage){
    if(newLanguage == appLanguage){
      return;
    }
    appLanguage = newLanguage;
    language = appLanguage;
    setAppLanguage(lang: appLanguage!);
    notifyListeners();
  }

  Future<void> getAppLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String result = prefs.getString(SharedPreferencesKeys.langTheme) ?? "en";
    appLanguage = result;
    language = appLanguage;
  }
}