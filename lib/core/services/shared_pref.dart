import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<SharedPreferences> get _instance async =>
      _preferences ??= await SharedPreferences.getInstance();
  static SharedPreferences? _preferences;

  static Future<SharedPreferences> init() async {
    _preferences = await _instance;
    return _preferences!;
  }

  static setAccessToken(String value) async {
    await _preferences?.setString('access_token', value);
  }

  static setRefreshToken(String value) async {
    await _preferences?.setString('refresh_token', value);
  }

  static Future<String?> getAccessToken() async {
    String? data = _preferences!.getString('access_token');
    return data;
  }

  static Future<String?> getRefreshToken() async {
    String? data = _preferences!.getString('refresh_token');
    return data;
  }
}
