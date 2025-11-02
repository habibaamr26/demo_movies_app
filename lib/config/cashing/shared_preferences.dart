


import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCashing {
  static SharedPreferences? _instance;
 static Future<void> initSharedPreferences() async {
    _instance ??= await SharedPreferences.getInstance();
  }

  Future<void> addData(String key, dynamic value) async {
    await initSharedPreferences();
    if (value is String) {
      await _instance?.setString(key, value);
    } else if (value is int) {
      await _instance?.setInt(key, value);
    } else if (value is double) {
      await _instance?.setDouble(key, value);
    } else if (value is bool) {
      await _instance?.setBool(key, value);
    } else if (value is List<String>) {
      await _instance?.setStringList(key, value);
    }
  }

  dynamic getData(String key) {
    return _instance?.get(key);
  }
}