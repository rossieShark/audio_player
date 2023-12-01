import 'dart:ui';

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/language_storage/language_storage.dart';

class LanguageBloc extends Cubit<Locale?> {
  final LanguageStorage _storage;
  LanguageBloc(this._storage) : super(const Locale('en'));

  void changeLanguage(Locale newLocale) async {
    await _storage.changeLocale(newLocale);
    final language = await _storage.loadSavedLocale() ?? 'en';
    emit(Locale(language));
  }

  void loadSavedLanguage() async {
    final language = await _storage.loadSavedLocale() ?? 'en';
    emit(Locale(language));
  }

  List<Locale> get supportedLocales => const [
        Locale('en'),
        Locale('ru'),
        Locale('de'),
      ];
}
