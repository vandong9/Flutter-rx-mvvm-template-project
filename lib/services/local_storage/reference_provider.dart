import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider {
  static SharedPreferences _prefs;
  static Map<String, dynamic> _memoryPrefs = Map<String, dynamic>();

  static Future<SharedPreferences> load() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return _prefs;
  }

  static Future setString(String key, String value) async {
    await _prefs.setString(key, value);
    _memoryPrefs[key] = value;
  }

  static Future setInt(String key, int value) async {
    await _prefs.setInt(key, value);
    _memoryPrefs[key] = value;
  }

  static Future setDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
    _memoryPrefs[key] = value;
  }

  static Future setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
    _memoryPrefs[key] = value;
  }

  static Future removeAll() async {
    await _prefs.clear();
    _memoryPrefs.clear();
  }

  static String getString(String key, {String def}) {
    String val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }

    if (val == null) {
      val = _prefs.getString(key);
    }
    if (val == null) {
      val = def;
    }

    _memoryPrefs[key] = val;
    return val;
  }

  static int getInt(String key, {int def}) {
    int val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs.getInt(key);
    }
    if (val == null) {
      val = def;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static double getDouble(String key, {double def}) {
    double val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs.getDouble(key);
    }
    if (val == null) {
      val = def;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static bool getBool(String key, {bool def = false}) {
    bool val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null) {
      val = _prefs.getBool(key);
    }
    if (val == null) {
      val = def;
    }
    _memoryPrefs[key] = val;
    return val;
  }

  static Future cleanAll() async {
    _prefs.clear();
  }
}
