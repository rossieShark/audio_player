import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/databases/app_database/database.dart';
import 'package:audio_player/domain/repositories/index.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFavoriteArtistRepository extends Mock
    implements FavoriteArtistRepository {}

void main() {
  group('FavoriteArtistBloc', () {
    late FavoriteArtistBloc favoriteArtistBloc;
    late MockFavoriteArtistRepository repository;

    setUp(() {
      repository = MockFavoriteArtistRepository();
      favoriteArtistBloc = FavoriteArtistBloc(repository);
    });

    blocTest<FavoriteArtistBloc, FavoriteArtistBlocState>(
      'emits FavoriteArtistBloc when FetchFavoriteArtistsEvent is added',
      build: () {
        // Mock the scenario where getTracksFromDb returns non-empty data
        when(() => repository.getFavoriteArtists()).thenAnswer((_) async => [
              const FavoriteArtist(id: 1, image: 'image', name: 'name'),
            ]);
        return favoriteArtistBloc;
      },
      act: (bloc) => bloc.add(FetchFavoriteArtistsEvent()),
      expect: () => [
        // Check that the bloc emits a FavoriteArtistState with data from getTracksFromDb
        isA<LoadedFavoriteArtistBlocState>().having(
          (state) => state.data,
          'favoriteArtists',
          contains(const FavoriteArtist(id: 1, image: 'image', name: 'name')),
        ),
      ],
    );

    blocTest<FavoriteArtistBloc, FavoriteArtistBlocState>(
      'emits FavoriteArtistBloc when FetchFavoriteArtistsEvent is added with empty tracks',
      build: () {
        // Mock the scenario where getTracksFromDb returns an empty list
        when(() => repository.getFavoriteArtists()).thenAnswer((_) async => []);
        return favoriteArtistBloc;
      },
      act: (bloc) => bloc.add(FetchFavoriteArtistsEvent()),
      expect: () => [
        // Check that the bloc emits a FavoriteArtistState with data from getFavoriteArtists
        isA<LoadingFavoriteArtistBlocState>()
      ],
    );
    blocTest<FavoriteArtistBloc, FavoriteArtistBlocState>(
      'emits FavoriteArtistBloc when FetchFavoriteArtistsEvent throws an exception',
      build: () {
        when(() => repository.getFavoriteArtists()).thenThrow(Exception());
        return favoriteArtistBloc;
      },
      act: (bloc) => bloc.add(FetchFavoriteArtistsEvent()),
      expect: () => [
        isA<ErrorFavoriteArtistBlocState>(),
      ],
    );
  });
}
