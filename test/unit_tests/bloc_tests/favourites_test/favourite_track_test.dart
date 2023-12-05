import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/domain/entity/favorite_song_model.dart';
import 'package:audio_player/domain/repositories/favourites_repository.dart/favourite_song_repository.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockFavouriteSongRepository extends Mock
    implements FavouriteSongRepository {}

void main() {
  late FavoriteSongBloc favoriteBloc;
  late MockFavouriteSongRepository repository;

  setUp(() {
    repository = MockFavouriteSongRepository();
    favoriteBloc = FavoriteSongBloc(repository);
  });

  tearDown(() {
    favoriteBloc.close();
  });

  group('FavoriteSongBloc', () {
    final songModelToAdd = SongModel(
        artistNames: 'A',
        id: '1',
        image: 'image',
        preview: 'preview',
        title: 'title',
        type: 'type',
        isFavourite: true);

    final existingSongModel = SongModel(
        artistNames: 'B',
        id: '2',
        image: 'image2',
        preview: 'preview2',
        title: 'title2',
        type: 'type2',
        isFavourite: false);

    blocTest<FavoriteSongBloc, FavouriteSongState>(
      'emits LoadedFavouriteSongState when LoadFavouriteSongsEvent is added',
      build: () {
        when(() => repository.loadSongs())
            .thenAnswer((_) async => [songModelToAdd]);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const LoadFavouriteSongsEvent()),
      expect: () => [
        isA<LoadedFavouriteSongState>().having(
          (state) => state.data,
          'favouriteSongBloc',
          contains(songModelToAdd),
        ),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadSongs()).called(1);
      },
    );

    blocTest<FavoriteSongBloc, FavouriteSongState>(
      'emits NoResultsFavouriteSongState when LoadFavouriteSongsEvent is added',
      build: () {
        when(() => repository.loadSongs()).thenAnswer((_) async => []);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const LoadFavouriteSongsEvent()),
      expect: () => [
        isA<NoResultsFavouriteSongState>(),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadSongs()).called(1);
      },
    );
    blocTest<FavoriteSongBloc, FavouriteSongState>(
      'emits LoadedFavouriteSongState when AddSongsEvent is added ',
      build: () {
        when(() => repository.loadSongs())
            .thenAnswer((_) async => [existingSongModel]);
        when(() => repository.addToFavorites(songModelToAdd))
            .thenAnswer((_) async => Future<void>);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(AddSongsEvent(songModelToAdd)),
      expect: () => [
        isA<LoadedFavouriteSongState>().having(
          (state) => state.data,
          'favouriteSongBloc',
          [existingSongModel, songModelToAdd],
        ),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadSongs()).called(1);
        // Verify that addToRecentlySearched was called
        verify(() => repository.addToFavorites(songModelToAdd)).called(1);
      },
    );

    blocTest<FavoriteSongBloc, FavouriteSongState>(
      'emits LoadedFavouriteSongState when RemoveSongsEvent is added ',
      build: () {
        when(() => repository.loadSongs())
            .thenAnswer((_) async => [existingSongModel, songModelToAdd]);
        when(() => repository.removeSongFromDatabase(songModelToAdd))
            .thenAnswer((_) async => Future<void>);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(RemoveSongsEvent(songModelToAdd)),
      expect: () => [
        isA<LoadedFavouriteSongState>().having(
          (state) => state.data,
          'favouriteSongBloc',
          [existingSongModel],
        ),
      ],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadSongs()).called(1);
        // Verify that addToRecentlySearched was called
        verify(() => repository.removeSongFromDatabase(songModelToAdd))
            .called(1);
      },
    );

    blocTest<FavoriteSongBloc, FavouriteSongState>(
      'emits NoResults when RemoveSongsEvent is added ',
      build: () {
        when(() => repository.loadSongs())
            .thenAnswer((_) async => [songModelToAdd]);
        when(() => repository.removeSongFromDatabase(songModelToAdd))
            .thenAnswer((_) async => Future<void>);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(RemoveSongsEvent(songModelToAdd)),
      expect: () => [isA<NoResultsFavouriteSongState>()],
      verify: (_) {
        // Verify that loadFromDatabase was called
        verify(() => repository.loadSongs()).called(1);
        // Verify that addToRecentlySearched was called
        verify(() => repository.removeSongFromDatabase(songModelToAdd))
            .called(1);
      },
    );

    blocTest<FavoriteSongBloc, FavouriteSongState>(
      'emits the correct states when ToggleIsFavourite event is added',
      build: () {
        when(() => repository.loadSongs())
            .thenAnswer((_) async => [songModelToAdd]);
        when(() => repository.removeSongFromDatabase(songModelToAdd))
            .thenAnswer((_) async => Future<void>);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(ToggleIsFavourite(detailSong: songModelToAdd)),
      expect: () => [
        isA<NoResultsFavouriteSongState>(), // The state after the toggle, you need to adjust this based on your expected logic
      ],
      verify: (_) {
        verify(() => repository.removeSongFromDatabase(songModelToAdd))
            .called(1);
        verifyNever(() => repository.addToFavorites(songModelToAdd)).called(0);
        // Add additional verifications based on your expected behavior
      },
    );

    blocTest<FavoriteSongBloc, FavouriteSongState>(
      'emits the correct states when ToggleIsFavourite event is added',
      build: () {
        when(() => repository.loadSongs())
            .thenAnswer((_) async => [songModelToAdd]);
        when(() => repository.addToFavorites(existingSongModel))
            .thenAnswer((_) async => Future<void>);
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(ToggleIsFavourite(detailSong: existingSongModel)),
      expect: () => [
        isA<LoadedFavouriteSongState>().having(
          (state) => state.data,
          'favouriteSongBloc',
          [songModelToAdd, existingSongModel],
        ),
      ],
      verify: (_) {
        verify(() => repository.addToFavorites(existingSongModel)).called(1);
        verifyNever(() => repository.removeSongFromDatabase(existingSongModel))
            .called(0);
        // Add additional verifications based on your expected behavior
      },
    );

    blocTest<FavoriteSongBloc, FavouriteSongState>(
      'return sortedList when SortSongsEvent event is added',
      build: () {
        when(() => repository.loadSongs())
            .thenAnswer((_) async => [existingSongModel, songModelToAdd]);

        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const SortSongsEvent()),
      expect: () => [
        isA<LoadedFavouriteSongState>().having(
          (state) => state.data,
          'favouriteSongBloc',
          [songModelToAdd, existingSongModel],
        ),
      ],
      verify: (_) {
        verify(() => repository.loadSongs()).called(1);
      },
    );
  });
}