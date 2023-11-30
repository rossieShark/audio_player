import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LanguageStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> changeLocale(Locale newLocale) async {
    await (await _prefs).setString('appLocale', newLocale.languageCode);
  }

  Future<String?> loadSavedLocale() async {
    return (await _prefs).getString('appLocale');
  }
}
