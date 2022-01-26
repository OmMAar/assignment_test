import 'package:nb_utils/nb_utils.dart';

class PrefKeysUtils{
  static const String haveSeenWelcomeTour = "haveSeenWelcomeTour";
}

class PrefUtils {
  static void saveStringValue(String key, String value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(key, value);
    });
  }

  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static void saveBoolValue(String key, bool value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(key, value);
    });
  }

  static Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static void saveIntValue(String key, int value) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setInt(key, value);
    });
  }

  static Future<int> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }
}
