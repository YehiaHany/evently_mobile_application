import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  String? language;
  String appLanguage = "en";
  void changeLanguage(String newLanguage){
    if(newLanguage == appLanguage){
      return;
    }
    appLanguage = newLanguage;
    language = appLanguage;
    notifyListeners();
  }
}