import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final Future<SharedPreferences> _preferens = SharedPreferences.getInstance();

  Future<void> setLocalStorageString(String key, String value) async {
    SharedPreferences pref = await _preferens;
    await pref.setString(key, value);
  }

  Future<String?> getLocalStorageString(String key) async {
    SharedPreferences pref = await _preferens;
    return pref.getString(key);
  }

  Future<void> setLocalStorageBool(String key, bool value) async {
    SharedPreferences pref = await _preferens;
    await pref.setBool(key, value);
  }

  Future<bool?>? getLocalStorageBool(String key) async {
    SharedPreferences pref = await _preferens;
    return pref.getBool(key);
  }
}
