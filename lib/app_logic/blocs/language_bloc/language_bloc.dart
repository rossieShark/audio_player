import 'dart:ui';

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/language_storage/language_storage.dart';
import 'package:audio_player/domain/services/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@injectable
class LanguageBloc extends Cubit<Locale?> {
  final LanguageStorage _storage;
  final Logger _logger = getLogger('LanguageBloc');
  LanguageBloc(this._storage) : super(const Locale('en'));

  void changeLanguage(Locale newLocale) async {
    try {
      await _storage.changeLocale(newLocale);
      final language = await _storage.loadSavedLocale() ?? 'en';
      emit(Locale(language));
    } catch (error, stackTrace) {
      _logger.severe('Language change error: $error, stack trace: $stackTrace');
    }
  }

  void loadSavedLanguage() async {
    try {
      final language = await _storage.loadSavedLocale() ?? 'en';
      emit(Locale(language));
    } catch (error, stackTrace) {
      _logger.severe('Language load error: $error, stack trace: $stackTrace');
    }
  }

  List<Locale> get supportedLocales => const [
        Locale('en'),
        Locale('ru'),
        Locale('de'),
      ];
}
