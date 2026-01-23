import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys {
  static const isFirstTime = "is_first_time";
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
