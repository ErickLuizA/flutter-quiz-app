import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const LANG = 'LANG';

class LanguageController extends ChangeNotifier {
  SharedPreferences _sharedPreferences;

  Locale _currentLocale;
  Locale get currentLocale => _currentLocale;

  void loadLocale(BuildContext context) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    final storageLanguage = _sharedPreferences.getString(LANG);

    if (storageLanguage != null) {
      final storageLangArray = storageLanguage.split(',');

      _currentLocale = Locale(storageLangArray[0], storageLangArray[1]);
    }

    notifyListeners();
  }

  void setLocale(Locale newLocale) async {
    _currentLocale = newLocale;
    await _sharedPreferences.setString(
      LANG,
      "${newLocale.languageCode}, ${newLocale.countryCode}",
    );

    notifyListeners();
  }
}
