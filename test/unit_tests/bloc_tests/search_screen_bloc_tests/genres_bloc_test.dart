import 'package:audio_player/app/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/app/databases/app_database/database.dart';
import 'package:audio_player/app/domain/repositories/index.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGenresRepository extends Mock implements GenresRepository {}

void main() {
  group('GenresBloc', () {
    late GenresBloc genresBloc;
    late MockGenresRepository repository;

    setUp(() {
      repository = MockGenresRepository();
      genresBloc = GenresBloc(repository);
    });

    blocTest<GenresBloc, GenresBlocState>(
      'emits LoadedGenresBlocState when FetchGenresEvent is added',
      build: () {
        when(() => repository.getAllGenres()).thenAnswer((_) async =>
            [const MusicGenre(id: '1', image: 'image', name: 'name')]);
        return genresBloc;
      },
      act: (bloc) => bloc.add(FetchGenresEvent()),
      expect: () => [
        isA<LoadedGenresBlocState>().having(
          (state) => state.data,
          'genres',
          contains(
            const MusicGenre(id: '1', image: 'image', name: 'name'),
          ),
        ),
      ],
    );

    blocTest<GenresBloc, GenresBlocState>(
      'emits LoadingGenresBlocState when FetchGenresEvent is added with empty genres',
      build: () {
        when(() => repository.getAllGenres()).thenAnswer((_) async => []);
        return genresBloc;
      },
      act: (bloc) => bloc.add(FetchGenresEvent()),
      expect: () => [isA<LoadingGenresBlocState>()],
    );
    blocTest<GenresBloc, GenresBlocState>(
      'emits ErrorGenresBlocState when FetchGenresEvent throws an exception',
      build: () {
        when(() => repository.getAllGenres()).thenThrow(Exception());
        return genresBloc;
      },
      act: (bloc) => bloc.add(FetchGenresEvent()),
      expect: () => [
        isA<ErrorGenresBlocState>(),
      ],
    );
  });
}
