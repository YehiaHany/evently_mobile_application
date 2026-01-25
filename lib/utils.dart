import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys {
  static const isFirstTime = "is_first_time";
  static const appTheme = "app_theme";
  static const langTheme = "lang_theme";
}

Future<bool> getIsFirstTime() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool result = prefs.getBool(SharedPreferencesKeys.isFirstTime) ?? true;
  return result;
}

void setIsFirstTime() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(SharedPreferencesKeys.isFirstTime, false);
}

void setAppTheme({required String theme}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(SharedPreferencesKeys.appTheme, theme);
}

void setAppLanguage({required String lang}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(SharedPreferencesKeys.langTheme, lang);
}