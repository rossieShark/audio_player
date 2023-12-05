import 'dart:ui';

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/language_storage/language_storage.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLanguageStorage extends Mock implements LanguageStorage {}

void main() {
  late LanguageBloc bloc;
  late MockLanguageStorage storage;

  setUp(() {
    storage = MockLanguageStorage();
    bloc = LanguageBloc(storage);
  });

  tearDown(() {
    bloc.close();
  });

  group('LanguageBloc', () {
    blocTest<LanguageBloc, Locale?>(
      'emits new state, when language was changed',
      build: () {
        when(() => storage.changeLocale(Locale('ru')))
            .thenAnswer((_) async => Future<void>.value());
        when(() => storage.loadSavedLocale()).thenAnswer((_) async => 'ru');
        return bloc;
      },
      act: (bloc) => bloc.changeLanguage(Locale('ru')),
      verify: (_) {
        expect(bloc.state, Locale('ru'));
      },
    );

    blocTest<LanguageBloc, Locale?>(
      'emits new state, when language was changed and loadSavedLocale returns null',
      build: () {
        when(() => storage.changeLocale(Locale('ru')))
            .thenAnswer((_) async => Future<void>);
        when(() => storage.loadSavedLocale()).thenAnswer((_) async => null);
        return bloc;
      },
      act: (bloc) => bloc.changeLanguage(Locale('ru')),
      verify: (_) {
        expect(bloc.state, Locale('en'));
      },
    );

    blocTest<LanguageBloc, Locale?>(
      'emits state, when language was loaded',
      build: () {
        when(() => storage.loadSavedLocale()).thenAnswer((_) async => 'de');
        return bloc;
      },
      act: (bloc) => bloc.loadSavedLanguage(),
      verify: (_) {
        expect(bloc.state, Locale('de'));
      },
    );

    blocTest<LanguageBloc, Locale?>(
      'get supported locals',
      build: () {
        return bloc;
      },
      verify: (_) {
        expect(bloc.supportedLocales, [
          Locale('en'),
          Locale('ru'),
          Locale('de'),
        ]);
      },
    );
  });
}
