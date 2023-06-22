import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    return await sharedPreferences!.setBool(key, value);
  }

  static getBool({
    required String key,
  }) {
    return sharedPreferences!.getBool(key);
  }

  static getString({
    required String key,
  }) {
    return sharedPreferences!.getString(key);
  }

  static remove({
    required String key,
  }) {
    return sharedPreferences!.remove(key);
  }
}
