import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static String dataKey = 'data';

  static Future<bool> writeData(String value) async {
    var prefs = await SharedPreferences.getInstance();
    return await prefs.setString(dataKey, value);
  }

  static Future<String?> readData() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(dataKey);
  }

  static Future<bool?> keyExists() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(dataKey);
  }
}
