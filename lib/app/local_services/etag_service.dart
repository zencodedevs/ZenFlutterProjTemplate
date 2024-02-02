import 'package:shared_preferences/shared_preferences.dart';

class EtagService {
  EtagService(this._preferences);

  Future<void> save(String key, String value) {
    return _preferences.setString(key, value);
  }

  String? get(String key) {
    return _preferences.getString(key);
  }

  Future<void> delete(String key) {
    return _preferences.remove(key);
  }

  Future<void> clearAll() => _preferences.clear();

  final SharedPreferences _preferences;
}
