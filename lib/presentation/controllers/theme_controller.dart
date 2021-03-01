import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const DARK = 'DARK';

class ThemeController extends ChangeNotifier {
  SharedPreferences _sharedPreferences;

  bool _isDark = true;
  bool get isDark => _isDark;

  void load() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    bool storageTheme;

    try {
      storageTheme = _sharedPreferences.getBool(DARK);
    } catch (e) {
      storageTheme = false;
    }

    _isDark = storageTheme;

    notifyListeners();
  }

  void toggleTheme() {
    _sharedPreferences.setBool(DARK, _isDark ? false : true);
    _isDark = _isDark ? false : true;

    notifyListeners();
  }
}
